#include <avr/io.h>
#include <avr/pgmspace.h>
#include <avr/interrupt.h>
#include <stdio.h>

#include "UART.h"

int main(void) 
{
    unsigned char s [20];

    UART_first_init ();				// First init UART
	
	sei ();
	
	for (;;) 
	{
		/* Same function as printf() but the format string resides in flash */
		printf_P (PSTR ("Enter text\r\n"));
		
		while (scanf ("%s",s) == 0);
		
		printf_P (PSTR ("You entered '%s'\r\n"),s);
	}
}

