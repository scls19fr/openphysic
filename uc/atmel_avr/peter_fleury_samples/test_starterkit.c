/******************************************************************************
 Title:    AVR Starter Kit testprogram
 Author:   Peter Fleury  pfleury@gmx.ch http://jump.to/fleury
 Date:     December 2002
 Purpose:  testprogram for a STK200 compatible starter kit
 Software: AVR-GCC 3.3 
 Hardware: AT90S8515 at 4 Mhz

 Program description
 Turns on one LED on port B which walks from bit 0 to bit 7 in intervals of 1 sec
 If one of the keys is pressed, the corresponding LED is turned on.
  
*******************************************************************************/
#include <inttypes.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/signal.h>


/*
** constant definitions
*/
#define TIMER_1_CNT     0xf0be  // 1 sec, use AVRcalc to calculate these values
                                // ((TCNT1H=0xf0, TCNT1L=0xbe)

/* this constants should be in <avr/io8515.h> !! */
#define TMC16_CK1024	(_BV(CS12)+_BV(CS10))

/*
**  module global variables
*/
static volatile uint8_t led; // use volatile when variable is accessed from interrupts


/*
** functions
*/
SIGNAL(SIG_OVERFLOW1)            // signal handler for tcnt1 overflow interrupt
{
    PORTB = ~led;                // invert the output since a zero means: LED on 
    led <<= 1;                   // move to next LED 
    if (!led)                    // overflow: start with bit 0 again 
        led = 1;
    TCNT1 = TIMER_1_CNT;         // reset counter to get this interrupt again
}


int main(void)
{
    unsigned char keys;
    
    
    DDRB  = 0xff;                // use all pins on PortB for output 
    PORTB = 0xff;
    
    DDRD  = 0x00;                // use all pins on port D for input
    PORTD = 0xff;                // activate internal pull-up

    TCCR1A = 0x00;               // disable PWM and Compare Output Mode
    TCCR1B = TMC16_CK1024;       // use CLK/1024 prescale value
    TCNT1  = TIMER_1_CNT;        // reset TCNT1
    
    TIMSK  = _BV(TOIE1);         // enable TCNT1 overflow 
    
    led = 1;                     // init variable representing the LED state 
    sei();                       // enable interrupts 
    
    for (;;) {                   // loop forever   
        keys = ~PIND;            // read input port with keys (active-low)
        if ( keys & 1 )
            led = 1;
        else if ( keys & 2 )     // priority encoder: if multiple keys are pressed,
            led = 2;             // only the lowest key is recognized
        else if ( keys & 4 )
            led = 4;
        else if ( keys & 8 )
            led = 8;
        else if ( keys & 0x10 )
            led = 0x10;
        else if ( keys & 0x20 )
            led = 0x20;
        else if ( keys & 0x40 )     
            led = 0x40;             
        else if ( keys & 0x80 )      
            led = 0x80;
        if ( keys ) 
            PORTB = ~led;        // Set corresponding LED if key pressed
    }
}
