// -----------------------------------------------------------------------
// Printer.h 
// -----------------------------------------------------------------------

#import < objc/object.h>


@interface Printer : Object
{
 char buffer[100];
}

- init;
- addStringValue:(const char*)astring;
- print;
- clear;

@end
