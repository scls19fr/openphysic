// -----------------------------------------------------------------------
// main.m 
// This will create a Printer object, set it's string and tell it to print
//
// To compile:  gcc  -lobjc main.m printer.m -o test 
//
// -----------------------------------------------------------------------
#import "printer.h"

void main()
{
 id printer = [[Printer alloc] init];
 [printer addStringValue:"Hello World!"];
 [printer print];
 [printer free];
}