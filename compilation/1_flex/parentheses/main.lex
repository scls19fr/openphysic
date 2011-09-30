 /* -- par.lex --
    Ce programme compte le nb de parentheses ouvrantes et
    verifie si le nb de parenthese fermante correspond.
    */

    int nbParOuv=0; /* Variable globale du nb de par ouvrantes */
%%
"("     {nbParOuv++; ECHO;}
\)      {
        if (nbParOuv>0)
            {
            nbParOuv--;
            ECHO;
            }
        else
            printf ("Votre parenthesage est incorrect\n");
        }
