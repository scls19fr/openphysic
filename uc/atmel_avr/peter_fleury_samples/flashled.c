/******************************************************************************
 Title:    Timer/Counter Output Compare Mode: OC1A pin toggles with 1Hz
 Author:   Peter Fleury <pfleury@gmx.ch> http://jump.to/fleury
 Date:     December 2003
 Software: AVR-GCC 3.3 
 Hardware: Tested with AT90S8515 at 4 Mhz and ATmega8 at 1 Mhz
 
 Description:
 Timer1 support the possibility to react on timer interrupt events on a purely
 hardware basis without the need to execute code. Related output pins can be 
 configured to be set, cleared or toggled automatically on a compare match.
 
 This examples shows how to toggle an output pin and flashing a LED with 1 Hz.
 After initialization, the LED flashes on OC1A output pin without code execution.

 A LED with a series resistor should be connected from OC1A pin to GND.
 
 See also Atmel AVR Application Note AVR130
 
 Note:
 Adapt XTAL, OC1A_PIN, OC1A_DDR to your target
 
*******************************************************************************/
#include <inttypes.h>
#include <avr/io.h>


/*
** constant definitions
*/
#if __AVR_AT90S8515__

#define XTAL		  4000000L    // Crystal frequency in Hz
#define OC1A_PIN PD5              // OC1A pin (for AT90S8515 use PD5, for ATmega8 use PB1)
#define OC1A_DDR DDRD             // OC1A DDR (for AT90S8515 use DDRD, for ATmega8 use DDRB)
#define WGM12 CTC1                // for compatibility with AT90S8515

#elif __AVR_ATmega8__

#define XTAL		  1000000L    // Crystal frequency in Hz
#define OC1A_PIN PB1              // OC1A pin (for AT90S8515 use PD5, for ATmega8 use PB1)
#define OC1A_DDR DDRB             // OC1A DDR (for AT90S8515 use DDRD, for ATmega8 use DDRB)

#else
#error "Adapt pin definitions to your MCU"
#endif


#define TIMER_CLOCK     1         // LED flashing frequency in 1Hz

                                   

int main(void)
{    
    /*
     * Initialisation
     */
    
    // set OC1A pin as output, required for output toggling
    OC1A_DDR |= _BV(OC1A_PIN);

    // enable toggle OC1A output on compare match
    TCCR1A = _BV(COM1A0);

    // use CLK/64 prescale value, clear timer/counter on compareA match                               
    TCCR1B = _BV(CS10) | _BV(CS11)  | _BV(WGM12);
    
    // preset timer1 high/low byte
    OCR1A = (XTAL/2/64/TIMER_CLOCK) - 1; 
    
    /*
     * Initialisation done, LED will now flash without executing any code !
     */
    for(;;){}    // loop forever
}
