/******************************************************************************
 Title:    Read input port using external Interrupt
 Author:   Peter Fleury <pfleury@gmx.ch> http://jump.to/fleury
 Date:     December 2002
 Software: AVR-GCC 3.3 
 Hardware: AT90S8515 at 4 Mhz, STK200 compatible starter kit

 Description:
 Demonstrates use of external interrupts.
 Each time a push button is pressed, the external interrupt INT0 is called, which 
 increments the global variable led and outputs its value to port B.
 For simplicity, no de-bouncing is implemented.
  
*******************************************************************************/
#include <inttypes.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/signal.h>


/*
**  module global variables (note: global variables are automatically initialized to zero)
*/
static volatile uint8_t led;     // use volatile when variable is accessed from interrupts


/*
** functions
*/

SIGNAL(SIG_INTERRUPT0)     
/* signal handler for external interrupt int0 */
{
    led++;
    PORTB = ~led;
}


int main(void)
{    
    DDRB  = 0xff;                // use all pins on PortB for output 
    PORTB = 0xff;                // and turn off all LEDs

    DDRD  = 0x00;                // use all pins on port D for input
    PORTD = 0xff;                // activate internal pull-up
    
    GIMSK = _BV(INT0);           // enable external int0
    MCUCR = _BV(ISC01);          // falling egde: int0
    
    sei();                       // enable interrupts 
    
    for (;;) {}                  // loop forever   
}
