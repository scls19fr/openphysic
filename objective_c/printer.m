// -----------------------------------------------------------------------
// Printer.m 
// -----------------------------------------------------------------------

#import "printer.h"

@implementation Printer 

- init
{
 [super init];
 [self clear];
 return self;
}

- addStringValue:(const char*)astring
{
 strcat(buffer, astring);
 return self;
}

- print
{
 printf("%s\n",buffer);
 [self clear];
 return self;
}

- clear
{
 strcpy(buffer, "");
 return self;
}

@end

