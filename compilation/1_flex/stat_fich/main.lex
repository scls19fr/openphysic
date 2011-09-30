		/* -- nlnc.lex --
		Ce programme compte le nb de lignes et 
		le nb de caracteres
		*/
	   int nbLignes = 0, nbCaracteres = 0;

%%
\n      ++nbLignes; ++nbCaracteres;
.       ++nbCaracteres;

%%
main()
	   {
	   yylex();
	   printf( "Nb de lignes = %d, Nb de caracteres = %d\n", nbLignes, nbCaracteres );
	   }
