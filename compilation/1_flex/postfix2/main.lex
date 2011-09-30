    /* -- postfix_evalv2.lex --
       Lit et evalue une expression postfixee.
    */

%{
#define TEOF 0 /* Fin de fichier */
#define TNB  1 /* Token : entier */
#define TOP  2 /* Token : operation */
int value;      /* valeur associee a la chaine reconnue, ou bien le car. de l'operation */
%}

%%

[0-9]+      { value=atoi(yytext);   return TNB; }
[-+*/]      { value=yytext[0];      return TOP; }

[ \t\n]+    ;
.           printf("car. non reconnu: (%c)\n",yytext[0]);

%%

#define MAXSP 100
int st[MAXSP];  /* pile */
int sp=-1;      /* pointeur de pile */
main()
    {
    int token;
    int error = 0;
    int a1, a2;
    
    /* Analyse de l'expression */
    while (! error && (token=yylex())!=TEOF)
        {
        switch (token)
            {
            case TNB :
                if (sp >= MAXSP)
                    error=1;
                else
                    st[++sp] = value;
                break;
            
            case TOP :
                if (sp < 0)
                    {
                    printf("Pas assez d'arguments pour l'operation '%c'\n",value);
                    error = 1;
                    }
                else
                    a2 = st[sp--];      /* on depile le 2em arg */
            
                if (sp < 0)
                    {
                    printf("Premier argument manquant pour l'operation '%c'\n",value);
                    error = 1;
                    }
                else
                    a1 = st[sp--];      /* on depile le 1er arg */
            
                switch (value)
                    {
                    case '-':
                        st[++sp] = a1 - a2;
                        break;
                    case '*':
                        st[++sp] = a1 * a2;
                        break;
                    case '+':
                        st[++sp] = a1 + a2;
                        break;
                    case '/':
                        st[++sp] = a1 / a2;
                        break;      
                    }
                break;
            }
        }
    
    if ( sp != 0 || error)
        printf("sp!=0 : expr. postfixee incorrecte ou erreur prog. C\n");
    else
        printf("Resultat : %d\n", st[sp--] );
    }
