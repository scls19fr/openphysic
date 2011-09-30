/******************************************************************************
 Title:    External memory interface
 Author:   Peter Fleury <pfleury@gmx.ch> http://jump.to/fleury
 Date:     December 2003
 Software: AVR-GCC 3.3 
 Hardware: tested with AT90S8515 at 4 MHz with external SRAM memory,
           any AVR with SRAM interface can be used.
           
 Description:
 This example shows how external devices such as external SRAM and FLASH, and
 peripherals such as LCD-display, A/D, and D/A can be access with the 
 External Memory Interface.
 
 To enable the External Memory Interface, the SRE bit must be set in the 
 MCUCR register and optionally one or more wait states.
 
 When the AT90S8515 is operated in the external SRAM mode, port A is used as 
 a multiplexed low-order address bus and data bus while port C is is used as 
 high order address bus. 
 
 In this example data is written to external memory location $4000 and read
 back and output to LED connected to port B.

 Note:
 When using AVR Studio 4 for simulation, External Memory Interface must be 
 enabled using the menu Option 
 "Debug -> AVR Simulator Options -> Device Selection and select check box 
 "External Memory Interface"

*******************************************************************************/
#include <inttypes.h>
#include <avr/io.h>


/*
 *  Using this definition, this function will be called by before main()
 */
void init_memory_mapped (void) __attribute__ ((naked)) __attribute__ ((section (".init1")));


/*
 * Setup the External Memory Interface early during device initialization
 */
void init_memory_mapped(void)
{    
    
#if defined(__AVR_AT90S4414__) || defined(__AVR_AT90S8515__) \
 || defined(__AVR_ATmega64__)  || defined(__AVR_ATmega128__) || defined(__AVR_ATmega103__) 
    /* enable external memory mapped interface with one wait state */
    MCUCR = _BV(SRE) | _BV(SRW);
#elif defined(__AVR_ATmega161__) || defined(__AVR_ATmega162__) || defined(__AVR_ATmega8515__)
    /* enable external memory mapped interface with one wait state for the entire external address space*/
    MCUCR = _BV(SRE) | _BV(SRW10);
#else
    #error "external memory mapped interface not available for this device"
#endif
}


int main(void)
{
    uint8_t  *p;
    
    DDRB  = 0xff;   /* PortB output */
    PORTB = 0xff;   /* turn active-low LED off */
    
    /* pointer to address 0x4000 in external memory */
    p = (uint8_t *)0x4000;
    
    /* set external memory location to 1 */
    *p = 1;
    
    /* get value from external location and output to PORTB */     
    PORTB = ~(*p);
    
    for(;;);
}
