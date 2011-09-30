    /*
       Evaluation d'une expression
       Partie analyseur lexical.
    */

BLANC [ \n\t]
%%
[a-zA-Z_]+  strcpy(yylval.chaine, yytext);  return Tid;
[0-9]+      yylval.valeur = atoi(yytext);   return Tnb;
[-+*/()=]   return yytext[0];   /* caracteres unites lexicales */
{BLANC}+    ;
.           printf("Caractere (%c) non reconnu\n", yytext[0]);
