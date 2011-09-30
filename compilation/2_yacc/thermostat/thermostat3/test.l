INTEGER                 [0-9]+
FLOATING                [-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?

%%

{FLOATING}              printf("TOK_NUMBER ");
heat                    printf("TOK_HEAT ");
on|off                  printf("TOK_STATE ");
set                     printf("TOK_SET ");
temperature             printf("TOK_TEMPERATURE ");
get                     printf("TOK_GET ");
\n                      printf("TOK_EOL "); /* end of line */;
[ \t]+                  /* ignore whitespace */;
.				        fprintf(stderr,"!!!ERROR!!!");

%%

