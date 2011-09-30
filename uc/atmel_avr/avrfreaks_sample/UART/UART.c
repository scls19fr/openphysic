#include <avr/io.h>
#include <stdio.h>

/* Define Baud and Xtal frequency below (or use the CDEFS macro in makefile) */

#ifndef FOSC
	#define FOSC 3690000UL
#endif

#ifndef BAUD
	#define BAUD 19200UL
#endif

int UART_putchar (char c) 
{
	/* Sends a single char over the UART */
	
	loop_until_bit_is_set (USR,UDRE);	// Wait until the send register is empty
	
	UDR = c;							// Send char to send register
	return 0;
}

int UART_getchar (void) 
{
	unsigned char c;
	/* Holds program execution untill a char is received */
	
	loop_until_bit_is_set (USR,RXC);	// Wait untill a char is received

	c = UDR;
	
	/* This next line echo's the char, comment out if not needed */
	UART_putchar (c);
	
	return c;
}

void UART_first_init (void) 
{
	/* First init for the UART */

	UBRR = FOSC / (16 * BAUD) - 1;		// 19200 BPS
	UCR = (1<<TXEN)|(1<<RXEN);			// 8 Databits
 
	fdevopen (UART_putchar, UART_getchar, 0);
}
