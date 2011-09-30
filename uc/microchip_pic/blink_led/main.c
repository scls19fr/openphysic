 /* Header for the PIC 18F452 */
#include "p18f452.h"

 /* Disable watchdog timer */
#pragma config WDT = OFF

int main(void) {
	/* */
	TRISB = 0;

	while(1) {
 		/* Switch off led */
		PORTB = 0x0;

		 /* Switch on led */
		PORTB = 0x5A;
	}

	return 0;
}