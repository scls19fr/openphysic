#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "main.tab.h"

#include "main.h"

void yyerror(const char *str) {
  fprintf(stderr,"yyerror: %s\n",str);
}
 
int yywrap() {
  return 1;
}


  
int main(void) {
  value=0;
  state=off;
  
  /* yyparse(); */ /* parser les commandes envoyes sur stdin */

  /* suite de commandes ˆ parser */
  yy_scan_string("*identification?\n");
  yyparse();
  
  /* suite de commandes ˆ parser */
  yy_scan_string("*idn?\n");
  yyparse();
  
  /* suite de commandes ˆ parser */
  yy_scan_string("*IDN?\n");
  yyparse();

  /* suite de commandes ˆ parser */
  yy_scan_string("heat on\n");
  yyparse();

  /* suite de commandes ˆ parser */
  yy_scan_string("get heat\n");
  yyparse();

  /* suite de commandes ˆ parser */
  yy_scan_string("heat off\n");
  yyparse();

  /* suite de commandes ˆ parser */
  yy_scan_string("get heat\n");
  yyparse();
  
  /* suite de commandes ˆ parser */
  yy_scan_string("set temperature 21.6\n");
  yyparse();
  
  /* suite commandes ˆ parser */
  yy_scan_string("get temperature\n");
  yyparse();
  
  return 0;
} 