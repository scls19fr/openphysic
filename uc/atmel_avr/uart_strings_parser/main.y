%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "main.h"

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
%union
{
	double dbl;
	int integer;
}
%type <integer> TOK_STATE
%type <dbl> TOK_NUMBER


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
        	if ($2==0) { /* or $<integer>2==0 if no %type definition */
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
        	value=$3; /* $<dbl>3 */
			printf("\tTemperature set to %f\n",value);
        }
        ;
        
target_get:
        TOK_GET TOK_TEMPERATURE
        {
			printf("\tTemperature is %f\n",value);
        }
        ;
%%


