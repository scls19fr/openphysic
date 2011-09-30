/* [a-zA-Z][a-zA-Z0-9]*		{ printf("<%s> ", yytext );  } */

%%
for 		{ printf("<mot-cle_%s> ", yytext );  }
if 		{ printf("<mot-cle_%s> ", yytext );  }
while 	{ printf("<mot-cle_%s> ", yytext );  }
else 	{ printf("<mot-cle_%s> ", yytext );  }
%%

/*+	        { printf("<symbole_ajoute> ", yytext );  } */
