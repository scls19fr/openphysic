#define F_CPU 8000000UL

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/signal.h>
#include <avr/delay.h>

#define KEY0 0
#define KEY1 1
#define KEY2 2
#define KEY3 3
#define KEY4 4
#define KEY5 5
#define KEY6 6
#define KEY7 7


void multiple_key(void)
{
	if ( (PINC>>KEY0) & 0x01 ) {
	   PORTB |= (1<<KEY0);
	}
	else {
	   PORTB &= (~(1<<KEY0));
	}

	if ( (PINC>>KEY1) & 0x01 ) {
	   PORTB |= (1<<KEY1);
	}
	else {
	   PORTB &= (~(1<<KEY1));
	}
	
	if ( (PINC>>KEY2) & 0x01 ) {
	   PORTB |= (1<<KEY2);
	}
	else {
	   PORTB &= (~(1<<KEY2));
	}

	if ( (PINC>>KEY3) & 0x01 ) {
	   PORTB |= (1<<KEY3);
	}
	else {
	   PORTB &= (~(1<<KEY3));
	}

	if ( (PINC>>KEY4) & 0x01 ) {
	   PORTB |= (1<<KEY4);
	}
	else {
	   PORTB &= (~(1<<KEY4));
	}
	
	if ( (PINC>>KEY5) & 0x01 ) {
	   PORTB |= (1<<KEY5);
	}
	else {
	   PORTB &= (~(1<<KEY5));
	}

	if ( (PINC>>KEY6) & 0x01 ) {
	   PORTB |= (1<<KEY6);
	}
	else {
	   PORTB &= (~(1<<KEY6));
	}

	if ( (PINC>>KEY7) & 0x01 ) {
	   PORTB |= (1<<KEY7);
	}
	else {
	   PORTB &= (~(1<<KEY7));
	}
}

void only_one_key(void)
{
	uint8_t tmpKEY;
	tmpKEY = ~PINC;
	
   //switch(~PINC) {  // ATTENTION PINC change pendant l'exécution
   switch(tmpKEY) {
      case (1<<KEY0):
         PORTB = ~(1<<KEY0);
         break;
      case (1<<KEY1):
         PORTB = ~(1<<KEY2);
         break;
      case (1<<KEY2):
         PORTB = ~(1<<KEY2);
         break;
      case (1<<KEY3):
         PORTB = ~(1<<KEY3);
         break;
      case (1<<KEY4):
         PORTB = ~(1<<KEY4);
         break;
      case (1<<KEY5):
         PORTB = ~(1<<KEY5);
         break;
      case (1<<KEY6):
         PORTB = ~(1<<KEY6);
         break;
      case (1<<KEY7):
         PORTB = ~(1<<KEY7);
         break;
      default:
         break;
   }
}

ISR(SIG_INTERRUPT0) {	
   //PORTB = PINC;	
   //multiple_key();
   only_one_key();	
}

int main(void) {
   // PORTD INPUT (INT)
   DDRD = 0x00;
   PORTD = 0xFF;

   //MCUCR = (1<<ISC01) | (1<<ISC00); // Interruption sur appui d'une touche (front montant INT0)
   MCUCR = (0<<ISC01) | (1<<ISC00); // Interruption sur appui ou relachement de touche

   GICR = (1<<INT0);

   sei();

   // PORTC (KEY)
   DDRC = 0x00;
   PORTC = 0xFF;

   // PORTB OUTPUT (LED)
   DDRB = 0xFF;
   PORTB = 0xFF; // LED OFF

   while(1) {
   }

}





