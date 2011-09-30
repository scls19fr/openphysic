%{
#include <string.h>
#include "main.tab.h"
%}

%option case-insensitive

INTEGER                 [0-9]+
FLOATING                [-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?

%%
{FLOATING}				{yylval.dbl=atof(yytext); return TOK_NUMBER;}
"*IDN?"|"*identification?"	return TOK_IDENT;	
heat                    return TOK_HEAT;
on|off                  {yylval.integer=!strcasecmp(yytext,"on"); return TOK_STATE;}
set                     return TOK_SET;
temperature             return TOK_TEMPERATURE;
get                     return TOK_GET;
\n                      return TOK_EOL; /* end of line */;
[ \t]+                  /* ignore whitespace */;

%%

