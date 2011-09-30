    /*
       Evaluation d'une expression
       Partie analyseur lexical.
    */

BLANC [ \n\t]
%%

[0-9]+      yylval = atoi(yytext); return Tnb;
[-+*/()=]   return yytext[0];   /* caracteres unites lexicales */
{BLANC}+    ;
.           fprintf(stderr, "Caractere (%c) non reconnu\n", yytext[0]);
