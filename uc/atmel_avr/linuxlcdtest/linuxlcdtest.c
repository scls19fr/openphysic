/* vim: set sw=8 ts=8 si : */
/*************************************************************************
Title:    lcd display test software
Author:   guido socher 
Copyright: GPL
**************************************************************************/

#include <avr/io.h>
#include <avr/pgmspace.h>
#include <avr/interrupt.h>
#define F_CPU 1000000UL  // 1 MHz
#include <util/delay.h>

#include <string.h>
#include <stdlib.h>
#include "lcd.h"	/* these are the prototypes and defines for lcd.c */
#include "avr_compat.h"


/* should be twice the length of the banner string */
#define BANNERSCROLLEN 30
/* LED0=green */
#define LED0 PC5
#define LED0DDR DDRC
#define LED0PORT PORTC

void delay_ms(unsigned int ms)
/* delay for a minimum of <ms> */
{
        // we use a calibrated macro. This is more
        // accurate and not so much compiler dependent
        // as self made code.
        while(ms){
                _delay_loop_2(240.0);
                ms--;
        }
}

int main(void)
{
	char *banner = (char *)PSTR("tuxgraphics.org");
	unsigned char i;


	/* initialize display, cursor off */
	lcd_init(LCD_DISP_ON);
	/* initialize LED as output */
	sbi(LED0DDR,LED0);
	/* LEDs off */
	sbi(LED0PORT,LED0);
	sei(); /* enable interrupt */
	lcd_clrscr();


	while(1){
		/* display a scroll banner until we
		* get the first command */
		for (i=0;i<BANNERSCROLLEN;i++) {	
			lcd_clrscr();
			rolltext_lcd_p(banner,i);
			sbi(LED0PORT,LED0); /* off */
			delay_ms(150);
			cbi(LED0PORT,LED0); /* on */
			delay_ms(150);
		}
	}

}
