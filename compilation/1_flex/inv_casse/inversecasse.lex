/* -- inversecasse.lex --
  Ce programme inverse la casse de toutes les lettres
*/

    #include <ctype.h>

%%
[a-z]   printf("%c", toupper(yytext[0]));
[A-Z]   printf("%c", tolower(yytext[0]));
