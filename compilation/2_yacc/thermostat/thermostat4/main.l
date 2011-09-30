%{
#include <string.h>
#include "main.tab.h"
%}

%option case-insensitive

INTEGER                 [0-9]+
FLOATING                [-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?

%%
{INTEGER}               {yylval=atoi(yytext); return TOK_NUMBER;}
"*IDN?"                 return TOK_IDENT;	
heat                    return TOK_HEAT;
on|off                  {yylval=!strcasecmp(yytext,"on"); return TOK_STATE;}
set                     return TOK_SET;
temperature             return TOK_TEMPERATURE;
get                     return TOK_GET;
\n                      return TOK_EOL; /* end of line */;
[ \t]+                  /* ignore whitespace */;

%%

