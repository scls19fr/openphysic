%{
#include <string.h>
#include <math.h>
#include "main.tab.h"

/* comment undef/define YY_INPUT to parse stdin
   uncomment it to parse a string using set_parse_string(...) */
#undef YY_INPUT
#define YY_INPUT(b,r,ms) (r = my_yyinput(b, ms))

extern char* g_str;
extern size_t g_str_size; /* taille de g_str */
extern int g_str_read; /* nombre de caractre dŽjˆ envoyŽs ˆ lex, initializŽ au dŽpart ˆ 0 */

int my_yyinput(char* buf, int max_size)
{
    /* on calcule le nombre de caractres ˆ copier dans buf,
     * soit on a assez de caractres pour remplir, buf, soit on prend le reste de la chaine
     */
    int num = fmin(max_size, g_str_size-g_str_read);
    

    /* on copie notre chaine dans buf */
    if (num > 0)
    {
        memcpy(buf, g_str+g_str_read, num);
        g_str_read += num;
    }
    return num;
}


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

