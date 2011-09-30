#include <avr/io.h>              // Most basic include files
#include <avr/interrupt.h>       // Add the necessary ones

#include <stdbool.h>


// Define here the global static variables
//
bool light_on = false;


void light_on_off(void) {
   if (light_on)
     PORTC = 0x00; // switch on all leds
   else
     PORTC = 0xFF; // switch off all leds
}

ISR(TIMER1_COMPA_vect) {
   light_on = !light_on;

   light_on_off();
}

// init
void init(void) {
      DDRC=0xFF; // set up PORTC pins 0 to 7 as output

      light_on_off();

      OCR1AH=0x00;
      OCR1AL=0x63;

      TCCR1B |=(1<<WGM12)|(1<<CS11)|(1<<CS10); //CTC division F_CPU 1  (1<<WGM12)|(1<<CS11)|(1<<CS10)

      TIMSK|=(1<<OCIE1A);

      sei();
}

// It is recommended to use this coding style to
// follow better the mixed C-assembly code in the
// Program Memory window
//
void my_function(void) {  // Put the open brace '{' here
   // In the loop !

   asm("nop");          // Inline assembly example
}

// ***********************************************************
// Main program
//
int main(void) {
   init();
   while(1) {             // Infinite loop; define here the
      my_function();      // system behaviour
   }
   return 0;
}

