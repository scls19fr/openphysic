/* -*- mode:Mail; compile-command: "bison -y -d parser.y ; mv -f y.tab.c parser.cc ; mv -f y.tab.h parser.h ; g++ -g -c parser.cc" -*- 

/* Infix notation calculator.  */
     
%{
  #include <cmath>
  #include "ex.h"
  /* #define YYSTYPE double */
  #define YYSTYPE ex
  extern YYSTYPE resultat;

  int yylex (void);
  void yyerror (char const *);
%}
     
/* Bison declarations.  */
%token NUM END PLUS MINUS TIMES DIV POW OPENPAR CLOSEPAR SYMBOL SIN
%left MINUS PLUS
%left TIMES 
%left DIV
%left NEG     /* negation--unary minus */
%right POW    /* exponentiation */

%% /* The grammar follows.  */
input :  exp END { resultat=$1; }
	;
     
exp :      NUM                { $$ = $1; }
	 | SYMBOL	      { $$ = $1; }
         | exp PLUS exp        { $$ = $1 + $3; }
    /*         | exp MINUS exp        { $$ = $1 - $3;    } */
    /*         | exp TIMES exp        { $$ = $1 * $3;    } */
    /*         | exp DIV exp        { $$ = $1 / $3;    }  */
    /*         | MINUS exp  %prec NEG { $$ = -$2;        } */
    /*         | exp POW exp        { $$ = pow ($1, $3); } */
             | OPENPAR exp CLOSEPAR        { $$ = $2; }
	     | SIN OPENPAR exp CLOSEPAR { $$=symb_sin($3); }
     ;

%%
