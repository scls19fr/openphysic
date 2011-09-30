%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char* g_str = NULL;
size_t g_str_size;
size_t g_str_read;

int set_parse_string(char* str) {
  size_t length = strlen(str);
  if (g_str != NULL) free(g_str);

  g_str = (char*) malloc(length+1);
  if (g_str == NULL) return 0;

  strcpy(g_str, str);
  g_str_size = length;
  g_str_read = 0;

  return 1;
}
/*
#define STR_SIZE 50
char str[STR_SIZE];

int myinput(char *buf, int max){
  memcpy(buf, str, STR_SIZE);
}
*/
/*
  int n = min(max, gStringLimit-gStringPtr);
  if(n>0){
    memcpy(buf, gStringPtr, n);
    gStringPtr +=n;
  }
  return n;
}
*/


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

%}


%token TOK_IDENT TOK_NUMBER TOK_HEAT TOK_STATE TOK_SET TOK_TEMPERATURE TOK_GET TOK_EOL

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

  /* strcpy(g_str,"get temperature"); */
  /* printf(g_str); */

  value=0;
  state=off;
  
  /* yyparse(); */ /* parser les commandes envoyées sur stdin */

  /* suite de commandes à parser */
  set_parse_string("*idn?\n");
  yyparse();
  
  /* suite de commandes à parser */
  set_parse_string("*IDN?\n");
  yyparse();

  /* suite de commandes à parser */
  set_parse_string("heat on\n");
  yyparse();

  /* suite de commandes à parser */
  set_parse_string("get heat\n");
  yyparse();

  /* suite de commandes à parser */
  set_parse_string("heat off\n");
  yyparse();

  /* suite de commandes à parser */
  set_parse_string("get heat\n");
  yyparse();
  
  /* suite de commandes à parser */
  set_parse_string("set temperature 12\n");
  yyparse();
  
  /* suite commandes à parser */
  set_parse_string("get temperature\n");
  yyparse();

  return 0;
} 
