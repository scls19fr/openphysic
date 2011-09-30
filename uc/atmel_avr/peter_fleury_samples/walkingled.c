/******************************************************************************
 Title:    Walking LEDs using timer interrupt
 Author:   Peter Fleury <pfleury@gmx.ch> http://jump.to/fleury
 Date:     December 2003
 Software: AVR-GCC 3.3 
 Hardware: Tested with AT90S8515 at 4 Mhz and ATmega8 at 1 Mhz

 Description:
 Demonstrates use of timer/counter interrupts.
 Turns on one LED on port B which walks from bit 0 to bit 7 in intervals of 0.5 sec
 Uses AVR Timer/Counter1 interrupt to generate the 0.5 sec delay.
 
 See also Atmel AVR Application Note AVR130
 
*******************************************************************************/
#include <inttypes.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/signal.h>


/*
** constant definitions
*/
#define XTAL		4000000L    // Crystal frequency in Hz
#define TIMER_CLOCK       2     // LED flashing frequency in 1Hz


#ifndef WGM12
#define WGM12 CTC1              // for compatibility with AT90S8515
#endif



/*
**  module global variables
*/
static volatile uint8_t led;     // use volatile when variable is accessed from interrupts


/*
** functions
*/
SIGNAL (SIG_OUTPUT_COMPARE1A)    // handler for Output Compare 1 overflow interrupt
{
    PORTB = ~led;                // invert the output since a zero means: LED on 
    led <<= 1;                   // move to next LED 
    if (!led)                    // overflow: start with bit 0 again 
        led = 1;
}


int main(void)
{    
    DDRB  = 0xff;                // use all pins on PortB for output 
    PORTB = 0xff;                // and turn off all LEDs
    
    
    // use CLK/64 prescale value, clear timer/counter on compareA match                               
    TCCR1B = _BV(CS10) | _BV(CS11)  | _BV(WGM12);
    
    // preset timer1 high/low byte
    OCR1A = ((XTAL/2/64/TIMER_CLOCK) - 1 );   


    // enable Output Compare 1 overflow interrupt
    TIMSK  = _BV(OCIE1A);            
        
    led = 1;                     // init variable representing the LED state 
    sei();                       // enable interrupts 
    
    for (;;) {}                  // loop forever   
}
