/****************************************************************************
 Title:    Debouncing 8 Keys
 Author:   Peter Fleury <pfleury@gmx.ch> http://jump.to/fleury,
           based on algorithm of Peter Dannegger <danni@specs.de>
 Date:     December 2003
 Software: AVR-GCC 3.3 
 Hardware: AT90S8515 at 4 Mhz, STK200 compatible starter kit

 Description:
 Demonstrates debouncing 8 keys. The state of the eight keys is sampled
 four times using a timer interrupt. If a key is pressed longer than
 four seconds, the corresponding bit in the key_press global variable is set.
 The main loop checks if a bit is set in this global variable and resets 
 the bit.
 
 Pressing the key connected to PIND2 increments a counter, while pressing 
 the key connected to PIND3 decrements the counter. 
 The value of this counter is displayed using LEDs on PORTB.
 
*****************************************************************************/

#include <inttypes.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/signal.h>


#ifndef CTC1
#define CTC1 WGM12              // for compatibility with ATmega
#endif


#define XTAL		4000000L    // Crystal frequency in Hz
#define DEBOUNCE	200L		// debounce clock 200Hz = 5msec


/*
 * Module global variable, informs the main programm when a key is pressed.
 * This variable must be declared 'volatile, since it is accessed from
 * both interrupt und main loop.
 */
static volatile uint8_t key_press;	   


SIGNAL (SIG_OUTPUT_COMPARE1A)
{
  static uint8_t key_state;		// debounced and inverted key state:
  static uint8_t ct0, ct1;      // holds two bit counter for each key
  uint8_t i;


  /*
   * read current state of keys (active-low),
   * clear corresponding bit in i when key has changed
   */
  i = key_state ^ ~PIND;   // key changed ?
  
  /* 
   * ct0 and ct1 form a two bit counter for each key,  
   * where ct0 holds LSB and ct1 holds MSB
   * After a key is pressed longer than four times the
   * sampling period, the corresponding bit in key_state is set
   */
  ct0 = ~( ct0 & i );			// reset or count ct0
  ct1 = (ct0 ^ ct1) & i;	    // reset or count ct1  
  i &= ct0 & ct1;			    // count until roll over ?
  key_state ^= i;			    // then toggle debounced state
  
  /*
   * To notify main program of pressed key, the correspondig bit
   * in global variable key_press is set.
   * The main loop needs to clear this bit
   */
  key_press |= key_state & i;	// 0->1: key press detect

}


int main( void )
{
  uint8_t count = 0;
  
  
  TCCR1B = _BV(CTC1) + _BV(CS10);  // clear timer on compare match, no prescaler
  OCR1A  =  XTAL/DEBOUNCE;		   // timer = 5 msec
  TIMSK  = _BV(OCIE1A);            // enable Output Compare 1 overflow interrupt

  DDRB  = 0x00;                    // use all pins on PortD for input
  PORTD = 0xff;                    // with pull-up enabled

  DDRB  = 0xff;                    // use all pins on PortB for output 
  PORTB = 0xff;                    // turn all LED off
  
  sei();                           // enable interrupt

  for(;;)
  {
    if (key_press & _BV(2) )
    {
        // key 2 pressed, increment counter
        count++;
        PORTB = ~count;
        
        key_press = 0;
    }
    else if ( key_press & _BV(3) )  
    {
        // key 3 pressed, decrement counter
        count--;
        PORTB = ~count;
        
        key_press = 0;
    }
  }

}

