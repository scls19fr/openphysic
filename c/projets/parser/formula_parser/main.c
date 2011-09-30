#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <math.h>

// limits
#define MAX_BYTECODE_PROGRAM_SIZE 50
#define MAX_CONSTANTS 20
#define STACK_DEPTH 20

// tokens
enum TokenType {
        TOKEN_EOF,
        TOKEN_NUMBER,
        TOKEN_ADD,
        TOKEN_SUB,
        TOKEN_MUL,
        TOKEN_DIV,
        TOKEN_LEFT_PAREN,
        TOKEN_RIGHT_PAREN,
        TOKEN_VARIABLE,
        TOKEN_LOG,
        TOKEN_EXP,

};

// one token
struct Token {
        enum TokenType type;
        union {
                float floatValue;
                char charValue;
        } value;

};

// next character for lexer function scan
char g_peek;

// next token for parse function
struct Token g_lookahead;

// formula to parse
char* g_formula;

// bytecode program: contains TokenType elements
// bytecode with one argument:
// TOKEN_NUMBER: index in g_constants
// TOKEN_VARIABLE: 'a', 'b' or 'c'
// not used: TOKEN_LEFT_PAREN and TOKEN_RIGHT_PAREN
int g_program[MAX_BYTECODE_PROGRAM_SIZE];
int g_programIndex;

// constant table
float g_constants[MAX_CONSTANTS];
int g_constantsIndex;

// stack, used while evaluating
float g_stack[STACK_DEPTH];
int g_stackIndex;

// forward declaration
void expr();

// read next character from formula and return it
// return 0, if at end
char nextChar()
{
        char c = *g_formula;
        if (c) g_formula++;
        return c;

}

// lexer
struct Token scan()
{
        struct Token token;
        while (1) {
                if (!g_peek) {
                        token.type = TOKEN_EOF;
                        return token;
                }
                while (1) {
                        if (!(g_peek == ' ' || g_peek == '\t')) break;
                        g_peek = nextChar();
                }
                if (!g_peek) {
                        token.type = TOKEN_EOF;
                        return token;
                }
                if (isdigit(g_peek) || g_peek == '.') {
                        float v = 0;
                        if (isdigit(g_peek)) {
                                while (1) {
                                        v = v * 10.0f + (float) (g_peek - '0');
                                        g_peek = nextChar();
                                        if (!isdigit(g_peek)) break;
                                }
                        }
                        if (g_peek == '.') {
                                float fraction = 0;
                                float div = 10;
                                g_peek = nextChar();
                                if (isdigit(g_peek)) {
                                        while (1) {
                                                fraction += (float) (g_peek - '0') / div;
                                                div *= 10.0f;
                                                g_peek = nextChar();
                                                if (!isdigit(g_peek)) break;
                                        }
                                }
                                v += fraction;
                        }
                        token.type = TOKEN_NUMBER;
                        token.value.floatValue = v;
                        return token;
                }
                if (isalpha(g_peek)) {
                        int i = 0;
                        char buf[10];
                        while (1) {
                                buf[i++] = g_peek;
                                g_peek = nextChar();
                                if (!isalpha(g_peek)) break;
                                if (i == 10) {
                                        printf("identifier too long");
                                        exit(-1);
                                }
                        }
                        buf[i] = 0;
                        if (strcmp(buf, "a") == 0) {
                                token.type = TOKEN_VARIABLE;
                                token.value.charValue = 'a';
                        } else if (strcmp(buf, "b") == 0) {
                                token.type = TOKEN_VARIABLE;
                                token.value.charValue = 'b';
                        } else if (strcmp(buf, "c") == 0) {
                                token.type = TOKEN_VARIABLE;
                                token.value.charValue = 'c';
                        } else if (strcmp(buf, "log") == 0) {
                                token.type = TOKEN_LOG;
                        } else if (strcmp(buf, "exp") == 0) {
                                token.type = TOKEN_EXP;
                        } else {
                                printf("unknown identifier");
                                exit(-1);
                        }
                        return token;
                }
                switch (g_peek) {
                        case '+':
                                token.type = TOKEN_ADD; break;
                        case '-':
                                token.type = TOKEN_SUB; break;
                        case '*':
                                token.type = TOKEN_MUL; break;
                        case '/':
                                token.type = TOKEN_DIV; break;
                        case '(':
                                token.type = TOKEN_LEFT_PAREN; break;
                        case ')':
                                token.type = TOKEN_RIGHT_PAREN; break;
                        default:
                                printf("syntax error");
                                exit(-1);
                                break;
                }
                g_peek = ' ';
                return token;
        }

}

// match a token and scan the next token
void match(enum TokenType t)
{
        if (g_lookahead.type == t) {
                g_lookahead = scan();
        } else {
                printf("\nsyntax error");
                exit(-1);
        }

}

// add one bytecode to the program
void addBytecode(int code)
{
        g_program[g_programIndex++] = code;
        if (g_programIndex == MAX_BYTECODE_PROGRAM_SIZE) {
                printf("\nprogram too long");
                exit(-1);
        }

}

// add a constant to the constant table and the constant load instruction to bytecode
void addConstant(float value)
{
        addBytecode(TOKEN_NUMBER);
        addBytecode(g_constantsIndex);
        g_constants[g_constantsIndex++] = value;
        if (g_constantsIndex == MAX_CONSTANTS) {
                printf("\ntoo many constants");
                exit(-1);
        }

}

// parse a factor
void factor()
{
        if (g_lookahead.type == TOKEN_LEFT_PAREN) {
                match(g_lookahead.type);
                expr();
                match(TOKEN_RIGHT_PAREN);
        } else if (g_lookahead.type == TOKEN_NUMBER) {
                addConstant(g_lookahead.value.floatValue);
                match(g_lookahead.type);
        } else if (g_lookahead.type == TOKEN_LOG) {
                match(g_lookahead.type);
                match(TOKEN_LEFT_PAREN);
                expr();
                match(TOKEN_RIGHT_PAREN);
                addBytecode(TOKEN_LOG);
        } else if (g_lookahead.type == TOKEN_EXP) {
                match(g_lookahead.type);
                expr();
                addBytecode(TOKEN_EXP);
        } else if (g_lookahead.type == TOKEN_VARIABLE) {
                addBytecode(TOKEN_VARIABLE);
                addBytecode(g_lookahead.value.charValue);
                match(g_lookahead.type);
        } else {
                printf("\nsyntax error");
                exit(-1);
        }

}

// parse a term
void term()
{
        factor();
        while (1) {
                if (g_lookahead.type == TOKEN_MUL) {
                        match(TOKEN_MUL);
                        factor();
                        addBytecode(TOKEN_MUL);
                } else if (g_lookahead.type == TOKEN_DIV) {
                        match(TOKEN_DIV);
                        factor();
                        addBytecode(TOKEN_DIV);
                } else return;
        }

}

// parse an expression
void expr()
{
        term();
        while (1) {
                if (g_lookahead.type == TOKEN_ADD) {
                        match(TOKEN_ADD);
                        term();
                        addBytecode(TOKEN_ADD);
                } else if (g_lookahead.type == TOKEN_SUB) {
                        match(TOKEN_SUB);
                        term();
                        addBytecode(TOKEN_SUB);
                } else return;
        }

}

// parse a formula
void parse(char* formula)
{
        g_formula = formula;
        g_programIndex = 0;
        g_constantsIndex = 0;
        g_peek = ' ';
        g_lookahead = scan();
        expr();

}

// pop a value from stack
float pop()
{
        if (g_stackIndex == 0) {
                printf("stack underflow");
                exit(-1);
        }
        return g_stack[--g_stackIndex];

}

// push a value to stack
void push(float value)
{
        g_stack[g_stackIndex++] = value;
        if (g_stackIndex == STACK_DEPTH) {
                printf("stack underflow");
                exit(-1);
        }

}

// evaluate the parsed formula
float evaluate(float a, float b, float c)
{
        int* program = g_program;
        float arg;
        g_stackIndex = 0;
        while (1) {
                int bytecode = *program++;
                switch (bytecode) {
                        case TOKEN_EOF:
                                return pop();
                        case TOKEN_NUMBER:
                                push(g_constants[*program++]);
                                break;
                        case TOKEN_ADD:
                                push(pop() + pop());
                                break;
                        case TOKEN_SUB:
                                arg = pop();
                                push(pop() - arg);
                                break;
                        case TOKEN_MUL:
                                push(pop() * pop());
                                break;
                        case TOKEN_DIV:
                                arg = pop();
                                push(pop() / arg);
                                break;
                        case TOKEN_VARIABLE:
                                switch (*program++) {
                                        case 'a':
                                                push(a);
                                                break;
                                        case 'b':
                                                push(b);
                                                break;
                                        case 'c':
                                                push(c);
                                                break;
                                        default:
                                                printf("unknown variable");
                                                exit(-1);
                                }
                                break;
                        case TOKEN_LOG:
                                push(logf(pop()));
                                break;
                        case TOKEN_EXP:
                                push(expf(pop()));
                                break;
                }
        }

}

// debug function for dumping the bytecode program
void dump()
{
        int* program = g_program;
        g_stackIndex = 0;
        while (1) {
                int bytecode = *program++;
                switch (bytecode) {
                        case TOKEN_EOF:
                                return;
                        case TOKEN_NUMBER:
                                printf("%f ", g_constants[*program++]);
                                break;
                        case TOKEN_ADD:
                                printf("+ ");
                                break;
                        case TOKEN_SUB:
                                printf("- ");
                                break;
                        case TOKEN_MUL:
                                printf("* ");
                                break;
                        case TOKEN_DIV:
                                printf("/ ");
                                break;
                        case TOKEN_VARIABLE:
                                printf("%c ", *program++);
                                break;
                        case TOKEN_LOG:
                                printf("log ");
                                break;
                        case TOKEN_EXP:
                                printf("exp ");
                                break;
                }
        }

}

// main entry point
int main(int argc, char** argv)
{
        float a, b, c, y;
        if (argc != 5) {
                printf("usage: formula a b c\n");
                exit(-1);
        }
        parse(argv[1]);
        a = (float) atof(argv[2]);
        b = (float) atof(argv[3]);
        c = (float) atof(argv[4]);
        y = evaluate(a, b, c);
        printf("formula: %s\n", argv[1]);
        printf("\na: %f\n", a);
        printf("b: %f\n", b);
        printf("c: %f\n", c);
        printf("\ny: %f\n", y);
        printf("\ninfix syntax: ");
        dump();
        printf("\n");
        return 0;

} 