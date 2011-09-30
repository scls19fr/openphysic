#include <avr/io.h>
#include <avr/interrupt.h>
#include "RC5.h"

/* This example code is based on Atmels RC5 decoder, the TSOP1638's output is connected to PA0, frequency should be 8MHz */

int main (void) 
{
	struct RC5 IR;
	int success;
	
	PORTB = 0xFF;
	DDRB = 0xFF;
	
	sei();

	for (;;) {
		success = GetRC5 (&IR);
		
		if (success) 
		{
			PORTB |= 0x7F;				/* Switch of led's						*/
			PORTB &= ~(IR.command); 	/* Output command byte to led's			*/
		}
		
		PORTB ^= 0x80;					/* The "I'm alive" led flashes allways 	*/
	}
}
