%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int value; /* temperature value */

enum _state {
   off,
   on
};
enum _state state;

void show_heat_state() {
  if (state==off) {
    printf("\tHeat is off\n");
  } else {
    printf("\tHeat is on\n");
  }
}


/* Si l'on compile avec l'option --verbose et yydebug mis a  1, permet
d'obtenir le fichier data.output, qui contient la liste des
differents states possibles pour la machine d'etat. */
int yydebug=1;

%}


%token TOK_IDENT TOK_NUMBER TOK_HEAT TOK_STATE TOK_SET TOK_TEMPERATURE TOK_GET TOK_EOL
/*
%union
{
	double dbl;
	int integer;
}
*/

%%

commands: /* empty */
        | commands command TOK_EOL
        ;

command:
		identification
        | heat_switch
        | heat_get
        | target_set
        | target_get
        ;

identification:
        TOK_IDENT
        {
			printf("\tMyDevice\n",value);
        }
        ;


heat_switch:
        TOK_HEAT TOK_STATE
        {
        	if ($2==0) {
				state=off;
			} else if ($2==1) {
				state=on;
			}
			show_heat_state();
        }
        ;

heat_get:
        TOK_GET TOK_HEAT
        {
			show_heat_state();        
        }
        ;


target_set:
        TOK_SET TOK_TEMPERATURE TOK_NUMBER
        {
        	value=$3;
			printf("\tTemperature set to %d\n",value);
        }
        ;
        
target_get:
        TOK_GET TOK_TEMPERATURE
        {
			printf("\tTemperature is %d\n",value);
        }
        ;
%%

 
void yyerror(const char *str) {
  fprintf(stderr,"yyerror: %s\n",str);
}
 
int yywrap() {
  return 1;
}


  
int main(void) {
  value=0;
  state=off;
  
  /* yyparse(); */ /* parser les commandes envoyées sur stdin */

  /* suite de commandes à parser */
  yy_scan_string("*idn?\n");
  yyparse();
  
  /* suite de commandes à parser */
  yy_scan_string("*IDN?\n");
  yyparse();

  /* suite de commandes à parser */
  yy_scan_string("heat on\n");
  yyparse();

  /* suite de commandes à parser */
  yy_scan_string("get heat\n");
  yyparse();

  /* suite de commandes à parser */
  yy_scan_string("heat off\n");
  yyparse();

  /* suite de commandes à parser */
  yy_scan_string("get heat\n");
  yyparse();
  
  /* suite de commandes à parser */
  yy_scan_string("set temperature 21\n");
  yyparse();
  
  /* suite commandes à parser */
  yy_scan_string("get temperature\n");
  yyparse();
  
  return 0;
} 
