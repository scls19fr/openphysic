/******************************************************************************
    Title:    Philips RC-5 Remote Control Decoder
    Author:   Peter Fleury <pfleury@gmx.ch> http://jump.to/fleury
    Date:     December 2002
    Purpose:  Decodes RC5-commands
    Software: AVR-GCC 3.3
    Hardware: AT90S8515 at 4 Mhz, IR-Receiver SFH506-36

    RC5 data format:
        SB1 SB2 TB AB5 AB4 AB3 AB2 AB1 AB0 CB5 CB5 CB4 CB3 CB2 CB1 CB0
        SB = Start bit, TB = Toggle bit, AB = address bits,  CB = command bits
    
    Program description:
    
    The IR-Receiver SFH506-36 receives and demodulates the IR-signal from the 
    remote control into an active-low signal, which is feed into port PD3.
    
    The rc5decode function first measures the length of the first start bit. 
    If the start bit is recognized as a valid RC5 bi-phase code, the routine 
    synchronizes into the middle of the first half of the second bit. Then the 
    state is stored into variable rc5data. The function uses the edge in the 
    middle of every bit to synchronize the timing. 3/4 bit length after this 
    edge, the state is sampled. This is repeated for the following bits.
    
    The function returns the decoded RC5-command or zero if valid RC5-code 
    not recognized.
    
    Timer0 is used as a time base. The timer0 overflow interrupt sets the 
    global variable timerflag to 1. 
    
    See also Atmel AVR Application Note AVR410
    
*******************************************************************************/
#include <inttypes.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/signal.h>

/* this should be in <avr/io8515.h> !! */
#define TMC8_STOP	0
#define TMC8_CK8	_BV(CS01)

        
/*
** Macros and constants
*/
#define RC5BitHigh()    (bit_is_set(PIND,PD3))
#define RC5BitLow()     (bit_is_clear(PIND,PD3))
#define WAITFORTIMER()  { while ( timerflag == 0); timerflag = 0; }

#define TIMER_0_CNT 0xCA     //  111us with CLK/8 prescale
#define RC5BITREF1  6  
#define RC5BITREF2  11
#define RC5BITREF3  14


/*
** function prototypes
*/
unsigned int rc5decode( void );


/*
** module global variables 
*/
static volatile uint8_t timerflag;  //must be volatile because modified by interrupt handler


SIGNAL(SIG_OVERFLOW0)
/*
**  signal handler for timer0 overflow interrupt
*/
{
    timerflag = 1;               // set global variable 

    TCNT0 = TIMER_0_CNT;         // reset counter to get this interrupt again 
}


unsigned int rc5decode( void )
/*
**  decoded RC5 data is returned, or 0x0000 if RC5 data not recognized
*/
{
    unsigned int    rc5data;
    unsigned char   timer, i;
    

    // init timer/Counter0    
    TCCR0 = TMC8_CK8;                // use CLK/8 prescale
    TCNT0 = TIMER_0_CNT;             // set timer T/16 = 111us 
    TIMSK = _BV(TOIE0);              // enable TCNT0 overflow interrupt
    
    // measure startbit
    timerflag = 0; timer = 0; 
    while ( RC5BitLow() && (timer < RC5BITREF2) ) {
        WAITFORTIMER();
        timer++;
    }
    if ( (timer > RC5BITREF1) && (timer < RC5BITREF2) ) {
        // startbit ok, decode 

        // wait T/4: synchronize in the middle of first half of second bit
        while ( timer < RC5BITREF3 ) {
            WAITFORTIMER();
            timer++;
        }
        
        // read the remaining bits
        rc5data = 1;
        for (i=0; i<13; i++) {
            rc5data <<= 1;  
            if ( RC5BitHigh() ) {
                rc5data |= 0x0001;
                // wait max T/2 for H->L transition (middle of next bit)
                timer = 0;
                while ( RC5BitHigh() && (timer < 16) ) {
                    WAITFORTIMER();
                    timer++;
                }
            }else{ 
                rc5data &= ~0x00001;
                // wait max T/2 for L->H transition (middle of next bit)
                timer = 0;
                while ( RC5BitLow() && (timer < 16) ) {
                    WAITFORTIMER();
                    timer++;
                }
            } 
            if ( timer == 16 ) {
                rc5data = 0x0000;   // error, next bit not found
                break;
            }
            
            // wait 3/4 T: await next bit
            for ( timer=0; timer < 12 ; timer++) WAITFORTIMER();
        }

    }else {
        rc5data = 0x0000;  // error, invalid RC-5 code
    }
    TCCR0 = TMC8_STOP;            // stop timer0    
    
    return (rc5data);

}//rc5decode


int main(void)
{
    unsigned int rc5data;
    
    
    DDRB  = 0xff;               // use all pins on port B for output 
    PORTB = 0xff;
  
    DDRD  = 0x00;               // use all pins on port D for input
    PORTD = 0xff;               // enable internal pull-up resistors
    
    sei();                      // enable interrupts
    
    for(;;)    // loop forever
    {
        while ( RC5BitHigh() );           // wait until RC5 code received
        
        rc5data = rc5decode();
        if ( rc5data & 0x2000 ) {
           PORTB = ~(rc5data & 0x003f);   // output command bits of RC5 command
        }
    }
}
