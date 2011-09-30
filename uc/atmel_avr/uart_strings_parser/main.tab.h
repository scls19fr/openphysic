typedef union
{
	double dbl;
	int integer;
} YYSTYPE;
#define	TOK_IDENT	257
#define	TOK_NUMBER	258
#define	TOK_HEAT	259
#define	TOK_STATE	260
#define	TOK_SET	261
#define	TOK_TEMPERATURE	262
#define	TOK_GET	263
#define	TOK_EOL	264


extern YYSTYPE yylval;
