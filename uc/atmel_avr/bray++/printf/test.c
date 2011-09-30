 /***********************************************************
  *   Program:    AVRGCC - printf test
  *   Created:    28.8.99 17:23
  *   Author:     Bray++
  *   Comments:
  ************************************************************/
#include <io.h>
#include "lcd.h"

void delay(unsigned int p)
{
  unsigned int i;
  unsigned char j;
  for(i=0;i<p;i++)
    for (j=0;j<100;j++);
}

int main(void)
{
    unsigned char byte;
    int i;
    unsigned char mychar;

    byte=0xAA;
    i=-32;
    mychar=0xDF;

    lcd_init();
    lcd_control(1,0,0);
    //lcd_putstr(" Hello from AVR ");

    printf(" Hello from AVR ");
    lcd_goto(0x40);
    printf("Temp=%d%cC %x",i,mychar,byte);
    while(1);
}
