#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/signal.h>
#include <stdio.h>

#include "uart.h"

/* Define Baud and Xtal frequency below (or use the CDEFS macro in makefile) */

#ifndef FOSC
	#define FOSC 3690000UL
#endif

#ifndef BAUD
	#define BAUD 19200UL
#endif

SIGNAL (SIG_UART_RECV) 
{
	/* Receive interrupt */
	char c;
	
	c = UDR;											// Get received char

	/* Echo */
	UART_putchar (c);
	
	rbuf [r_in & RMASK] = c;
	r_in++;
}

SIGNAL (SIG_UART_DATA) 
{
	/* Data register empty indicating next char can be transmitted */
	if (t_in != t_out) 
	{
		UDR = tbuf [t_out & TMASK];
		t_out++;	
	}
	else {
		UCR &= ~(1<<UDRIE);
	}
}

int UART_putchar (char c) 
{
	/* Fills the transmit buffer, if it is full wait */
	while((TBUFSIZE - TBUFLEN) <= 2);
	
	/* Add data to the transmit buffer, enable TXCIE */
	tbuf [t_in & TMASK] = c;
	t_in++;
	
	UCR |= (1<<UDRIE);									// Enable UDR empty interrupt
	
	return(0);
}

int UART_getchar (void) 
{
	unsigned char c;

	while (RBUFLEN == 0);
	
	c = rbuf [r_out & RMASK];
	r_out++;
	
	return(c);
}

void UART_first_init (void) 
{
	/* First init for the UART */
	
	UBRR = FOSC / (16 * BAUD) - 1;						// Set baudrate
	UCR = (1<<RXCIE)|(1<<TXEN)|(1<<RXEN);				// 8 Databits, receive and transmit enabled, receive complete interrupt enabled
	
	fdevopen (UART_putchar, UART_getchar, 0);
}




