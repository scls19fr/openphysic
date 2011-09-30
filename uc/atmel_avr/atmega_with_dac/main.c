#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/signal.h>

int main(void) {
   /* enable PORT Bx as output (led) */
   DDRB = 0xFF;

	/* enable PORT Dx as input (key) */
   DDRD = 0xFF;

   //PORTB = 0x00;
   PORTB = 0xFF; // TO FIX DAC problem

   while(1) {
   	PORTB = PIND; //0xFF;
   }

}


