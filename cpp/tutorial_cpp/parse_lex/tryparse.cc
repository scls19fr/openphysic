/* -*- mode:C++; compile-command: "g++ -g lexer.o parser.o ex.o tryparse.cc" -*- */
#include <iostream>
#include "lexer.h"
using namespace std;

int main(){
  // Parse x 
  set_lexer_string("x");
  yyparse();
  ex x=resultat;
  symbole * xs;
  xs=dynamic_cast<symbole *>(x.ptr);
  if (!xs)
    cout << "Error, unable to parse x as a symbol";
  // Parse user entry
  string s;
  cout << "Enter expression: " << endl;
  cin >> s;
  set_lexer_string(s);
  yyparse();
  cout << "Parsed: " << resultat << endl;
  // Evaluate expression at x = 1.2
  xs->value=new ex(1.2);
  cout << "Expression at x=1.2: " << resultat.eval() << endl;
  return 0;
}



