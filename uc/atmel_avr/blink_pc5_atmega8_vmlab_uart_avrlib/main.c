#include "global.h"		// include our global settings

#include <avr/io.h>
//#include <inttypes.h>
#include <util/delay.h>

#include "uart.h"		// include uart function library
#include "rprintf.h"	// include printf function library
#include "a2d.h"		// include A/D converter function library
#include "timer.h"		// include timer function library (timing, PWM, etc)
#include "vt100.h"		// include VT100 terminal library

int uart_init(void)
{
	// initialize our libraries
	// initialize the UART (serial port)
	uartInit();
	// set the baud rate of the UART for our debug/reporting output
	uartSetBaudRate(9600);
	// set uartSendByte as the output for all rprintf statements
	rprintfInit(uartSendByte);
	// initialize the timer system
	timerInit();
	// initialize vt100 library
	vt100Init();
	vt100ClearScreen();
	// print a little intro message so we know things are working
	rprintf("\r\nHello AVR!\r\n");
}

int main(void)
{
	uart_init();

   /* INITIALIZE */
   /* enable PC5 as output */
   DDRC|= (1<<DDC5);

   while (1) {
      /* led on, pin=0 */
      PORTC &= ~(1<<PC5);
      rprintf("ON\r\n");
      //uartSendByte(PORTC);
      _delay_ms(100);

      /* set output to 5V, LED off */
      PORTC|= (1<<PC5);
      rprintf("OFF\r\n");
      //uartSendByte(PORTC);
		_delay_ms(100);
      }
   return(0);
}







