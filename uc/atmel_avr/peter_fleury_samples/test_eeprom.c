/******************************************************************************
Title:    Accessing variable stored in internal EEPROM of AVR
Author:   Peter Fleury  <pfleury@gmx.ch> http://jump.to/fleury
Date:     19-Oct-2003
Purpose:  access variabled stored in EEPROM with AVR-GCC
Software: AVR-GCC 3.3
Hardware: Tested with AT90S8515 (4Mhz), any AVR device can be used

Program description:
This example explains how global variables can be initialized at compile-time 
and stored into the internal EEPROM. The program can now refer to these variables 
using the symbolic name without knowing the address.

The ISP-Programmer must download both the rom-file and the eeprom-file.
For debugging with AVR Studio, the eeprom file is not automatically loaded,
it must be loaded separatly with the menu option 
"File->Up/Download Memories" (AVR Studio 3) or 
"Debug->Up/Download Memories" (AVR Studio 4)
******************************************************************************/
#include <inttypes.h>
#include <avr/io.h>
#include <avr/eeprom.h>



#define EEPROM_SECTION  __attribute__ ((section (".eeprom")))


/*
** this global variables are stored in EEPROM
*/
uint16_t  dummy        EEPROM_SECTION  = 0;       // avoid using lowest addresses
uint8_t   eeprom_var1  EEPROM_SECTION  = 1;       // EEPROM address 0002
uint8_t   eeprom_var2  EEPROM_SECTION  = 2;       // EEPROM address 0003
uint16_t  eeprom_var3  EEPROM_SECTION  = 1027;    // low byte = 0003, high = 0004  
float     eeprom_var4  EEPROM_SECTION  = 1.3456;  // four byte float 

int main(void)
{
    uint8_t   state1;
    uint16_t  state2;
    float     floatVar;
    
    DDRB   = 0xff;               // use all pins on port B for output 
    PORTB  = 0xff;   
            
    state1 = eeprom_read_byte( &eeprom_var1 );	//read variable from EEPROM addr 0002
    PORTB = ~state1;			                //and output value (1) to port B
    eeprom_write_byte( &eeprom_var2, state1 );	//and write value to EEPROM addr 0003

    state2 = eeprom_read_word( &eeprom_var3 );	//read 16 bit variable from EEPROM
    PORTB = ~(state2 & 0x00FF);		            //output lower byte (3) to port B

                                                // read float value (1.3456) from EEPROM
    eeprom_read_block( &floatVar, &eeprom_var4, sizeof(eeprom_var4) );
    if ( floatVar == 1.3456 ) PORTB = ~1; 

    
    for(;;) {}    // loop forever
}
