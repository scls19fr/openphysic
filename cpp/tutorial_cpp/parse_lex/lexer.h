#ifndef _LEXER_H__
#define _LEXER_H__

#include <string>
#include "ex.h"
#define YYSTYPE ex
#include "parser.h"
void set_lexer_string(const std::string & s);
extern YYSTYPE resultat;
int yyparse();
#endif
