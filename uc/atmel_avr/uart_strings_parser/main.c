#include "global.h"		// include our global settings

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include <avr/io.h>
#include <inttypes.h>
#include <util/delay.h>

#include "uart.h"		// include uart function library
#include "rprintf.h"	// include printf function library

#include "main.tab.h"

#include "main.h"

/*
Envoyer sur la liaison série des caractères
En réception on retrouve ces caractères
Remarque : pour les caractères ASCII codés sur 8 bits
il faut penser à modifier le terminal "Data bits=8"
 */
 
 void yyerror(const char *str) {
  fprintf(stderr,"yyerror: %s\n",str);
}
 
int yywrap() {
  return 1;
}

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
	//rprintf("AVR - UART echo\r\n");
}

/*
volatile int c;

inline void echo(void) {
   while (1) {
		//rprintf("Running\r\n");

		c=-1;
		while(c==-1) {
			c=uartGetByte();
		}
		uartSendByte(c);
	}
}

inline void echoV2(void) {
   while (1) {
		char myReceivedByte;
		u08 res;
		res=FALSE;
		while(!res) {
 			res=uartReceiveByte( &myReceivedByte );
	 	}
 		uartSendByte(myReceivedByte);
 	}
}
*/

int main(void)
{
	value=0;
	state=off;
  
	/* command to parse */
	//yy_scan_string("*IDN?\n");
	//yyparse();
  
	uart_init();
	rprintf("Running\r\n");

	//echo();
	
	while(1) {
	}
	
	return(0);
}











