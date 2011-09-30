 /* 
This program emulate a device's firmware which is
able to understand some SCPI commands
Standard Commands for Programmable Instruments (SCPI)
    */

%{
#define IDENT "MyDevice"
double value;
%}

INTEGER   [0-9]+

%%

"*IDN\?"  {printf ("IDENTIFICATION=%s", IDENT);}
"MEAS\?"|"MEASure?"  {printf ("MEASURE=%f", value);}
"SET"  {printf ("SET");}

[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?  {printf ("FLOATING_POINT_NUMBER");}


\n                      printf("\n");
[ \t]+                  /* ignore whitespace */;

%%

int main(void) {
  value=5.1;
  yylex();
  return 0;
}
