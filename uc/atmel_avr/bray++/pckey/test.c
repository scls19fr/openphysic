 /***********************************************************
  *   Program:    AVRGCC - PC Keyboard Test
  *   Created:    21.5.99 17:23
  *   Author:     Bray++
  *   Comments:   simple char dump on LCD (ESC - clear LCD)
  ************************************************************/
#include <io.h>
#include <interrupt.h>
#include "lcd.h"
#include "pckb.h"


void delay(unsigned int p)
{
  unsigned int i;
  unsigned char j;
  for(i=0;i<p;i++)
    for (j=0;j<100;j++);
}


int main(void)
{
    unsigned char znak,test=0;


    init_kb();
    lcd_init();
    lcd_control(1,0,0);


    outp(0x0F,DDRC);
    outp(0xFF,PORTC);
    outp(0xFF,DDRB);
    outp(0xFF,PORTB);

    cbi(DDRD,4);
    sbi(PORTD,4);
    sei();

    while(1) {
      //lcd_home();
      //printhex(test++);
      //test=inp(PINC);
      znak=getchar();
      lcd_putch(znak);
      //delay(1000);
    }
    for(;;);
}
