/* -*- mode: C++; compile-command: "flex -olexer.cc lexer.ll && g++ -g -c lexer.cc" -*- */

/*
 *  Definitions
 */

%{

#include <iostream>
#include <stdexcept>
#include <string>
#include <map>
#include "lexer.h"
#include "ex.h"

  // lexer make symbol function
  std::map<std::string,ex> table;
  int find_or_make_symbol(const std::string & s,ex & value){
    std::map<std::string,ex>::iterator it=table.find(s),itend=table.end();
    if (it!=itend)
      value=it->second;
    else {
      // symbole * ptr = new symbole(s);
      table[s]=s; // *ptr;
      value=table[s];
      // std::cerr << "Lexer " << value << std::endl;
    }
    return SYMBOL;
  }

// lex input function
static int lexer_input(char *buf, int max_size);
#define YY_INPUT(buf, result, max_size) (result = lexer_input(buf, max_size))

%}

	/* Abbreviations */
D	[0-9]
E	[eE][eE]?[-+]?{D}+
A	[a-zA-Z_]
AN	[0-9a-zA-Z_.]

/*
 *  Lexical rules
 */

%%
[ \t\\]+			/* skip whitespace */
"("  return OPENPAR;
")"  return CLOSEPAR;
"+" return PLUS;
"-" return MINUS;
"*" return TIMES;
"/" return DIV;
"^" return POW;
"sin" return SIN;
"¤"   { /* std::cerr << "end parse" << std::endl; */ return END; }
	/* numbers */
{D}+			|
{D}+"."{D}*({E})?	|
{D}*"."{D}+({E})?	|
{D}+{E}			{ 
  char * endchar;
  yylval = strtod (yytext,&endchar);
  return NUM; 
}

{A}{AN}*		{
  return find_or_make_symbol(yytext,yylval);
}

%%


/* Routines */

/* Called by yyparse on error.  */
void yyerror (char const *s)
{
  std::cerr << s << std::endl;
}

YYSTYPE resultat;
// The string from which we will read
std::string lexer_string;

// The current position within the string
int curr_pos = 0;

// Input function that reads from string
static int lexer_input(char *buf, int max_size)
{
  int actual = lexer_string.length() - curr_pos;
  if (actual > max_size)
    actual = max_size;
  if (actual <= 0)
    return YY_NULL;
  lexer_string.copy(buf, actual, curr_pos);
  curr_pos += actual;
  return actual;
}

void set_lexer_string(const std::string & s){
    lexer_string = s + '¤';
    curr_pos = 0;
}

// EOF encountered, terminate the scanner
int yywrap()
{
  return 1;
}
