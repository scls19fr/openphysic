#include <avr/io.h>
int main(void)
{
	DDRB = 0x00; /* PORTB as input */
	DDRC = 0xFF; /* PORT C as output */
	while(1)
	{
		PORTC = PINB;
	}
	return 0;
}

