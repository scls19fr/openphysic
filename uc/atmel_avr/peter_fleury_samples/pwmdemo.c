/******************************************************************************
 Title:    Pulse Width Modulation (PWM) example
 Author:   Peter Fleury <pfleury@gmx.ch> http://jump.to/fleury
 Date:     December 2003
 Software: AVR-GCC 3.3 
 Hardware: AT90S8515 at 4 Mhz, ATmega8 with 1 Mhz
           
 Description:
 This example shows how to generate voltages between VCC and GND using 
 Pulse Width Modulation (PWM).

 A LED with a series resistor should be connected from PD5 to GND.
 
 See also Atmel AVR Application Note AVR130
 
*******************************************************************************/
#include <inttypes.h>
#include <avr/io.h>


/*
 * constants
 */

#if __AVR_AT90S8515__

#define XTAL		  4000000L    // Crystal frequency in Hz
#define OC1A_PIN PD5              // OC1A pin (for AT90S8515 use PD5, for ATmega8 use PB1)
#define OC1A_DDR DDRD             // OC1A DDR (for AT90S8515 use DDRD, for ATmega8 use DDRB)
#define WGM12 CTC1                // for compatibility with AT90S8515
#define WGM10 PWM10               // for compatibility with AT90S8515

#elif __AVR_ATmega8__

#define XTAL		  1000000L    // Crystal frequency in Hz
#define OC1A_PIN PB1              // OC1A pin (for AT90S8515 use PD5, for ATmega8 use PB1)
#define OC1A_DDR DDRB             // OC1A DDR (for AT90S8515 use DDRD, for ATmega8 use DDRB)

#else
#error "Adapt pin definitions to your MCU"
#endif



/*
 * function prototypes
 */
static void delay(uint16_t us);


/*
 * function definitions
 */
static void delay(uint16_t us)
/* delay for a minimum of <us> microseconds    */
/* with a 4Mhz crystal, the resolution is 1 us */
{
    while ( us ) us--;
}


int main(void)
{
    uint8_t i = 0;


    DDRB  = 0xff;                  // use all pins on PortB for output 
    PORTB = 0xff;                  // set output high -> turn all LEDs off


    // set OC1A pin as output, required for output toggling
    OC1A_DDR |= _BV(OC1A_PIN);
    

    // enable 8 bit PWM, select inverted PWM
    TCCR1A =  _BV(WGM10) | _BV(COM1A1) | _BV(COM1A0);
    
    // timer1 running on 1/8 MCU clock with clear timer/counter1 on Compare Match
    // PWM frequency will be MCU clock / 8 / 512, e.g. with 4Mhz Crystal 977 Hz.
    TCCR1B = _BV(CS11) | _BV(WGM12);
 
    
    /*
     *  Dimm LED on and off in interval of 2.5 seconds
     */
    for (;;)
    {   
        /* dimm LED on */
        for (i=0; i<255; i++)
        {
            OCR1AL = i;
            delay(XTAL/400);   // delay 10 ms
        }
        
        /* dimm LED off */
        for( i=255; i>0; i--)
        {
            OCR1AL = i;            
            delay(XTAL/400);    // delay 10 ms
        }
    }
}
