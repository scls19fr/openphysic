/*********************************************
* vim: set sw=8 ts=8 si :
* Author: Guido Socher, Copyright: GPL 
* This program is to test the led connected to
* PC5. 
* See http://linuxfocus.org/English/November2004/
* for details.
* Chip type           : ATMEGA8
* Clock frequency     : Internal clock 1 Mhz (factory default)
*********************************************/
#include <avr/io.h>
#include <inttypes.h>
#define F_CPU 1000000UL  // 1 MHz
#include <avr/delay.h>


/* compatibilty macros for old style */
#ifndef cbi
#define cbi(sfr, bit) (_SFR_BYTE(sfr) &= ~_BV(bit))
#endif

#ifndef sbi
#define sbi(sfr, bit) (_SFR_BYTE(sfr) |= _BV(bit))
#endif


void delay_ms(unsigned int ms)
/* delay for a minimum of <ms> */
{
	// we use a calibrated macro. This is more
	// accurate and not so much compiler dependent
	// as self made code.
	while(ms){
		_delay_ms(0.96);
		ms--;
	}
}


/* new style */
int main(void)
{
          /* INITIALIZE */
          /* enable PC5 as output */
          DDRC|= (1<<DDC5);

          /* PC5 is 5 (see file include/avr/iom8.h) and 1<<PC5 is 00100000 
	   * This can also be written as _BV(PC5)*/
          while (1) {
                      /* led on, pin=0 */
                      PORTC &= ~(1<<PC5);
                      delay_ms(500);
                      /* set output to 5V, LED off */
                      PORTC|= (1<<PC5);
                      delay_ms(500);
          }
	  return(0);
}


// // old style now depricated:
// int main(void)
// {
// 	// enable  PC5 as output 
// 	sbi(DDRC,PC5);
// 	while (1) {
// 		// led on, pin=0 
// 		cbi(PORTC,PC5);
// 		delay_ms(500);
// 		// set output to 5V, LED off 
// 		sbi(PORTC,PC5);
// 		delay_ms(500);
// 	}
// 	return(0);
// }
// // end of old style
