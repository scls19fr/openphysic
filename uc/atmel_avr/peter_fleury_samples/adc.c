/******************************************************************************
 Title:    Analog to digital conversion using the built-in ADC
 Author:   Peter Fleury <pfleury@gmx.ch> http://jump.to/fleury
 Date:     December 2003
 Software: AVR-GCC 3.3 
 Hardware: Any AVR with built-in ADC, tested with ATmega8 at 1Mhz
           
 Description:
 An analog signal applied to analog input ADC0 is converted into a 10 bit 
 digital value using the built-in Analog-to-digital Converter.
 The higher 8 bits of the converted value is output to PORTB.
 
*******************************************************************************/
#include<avr/io.h>

int main (void) 
{
  DDRB = 0xFF;      // port B output
 
  int x = 0;
  
  // Activate ADC with Prescaler 16 --> 1Mhz/16 = 62.5kHz
  ADCSRA = _BV(ADEN) | _BV(ADPS2);
  
  for (;;) {  
    // Select pin ADC0 using MUX
    ADMUX = 0;
    
    //Start conversion
    ADCSRA |= _BV(ADSC);
    
    // wait until converstion completed
    while (ADCSRA & _BV(ADSC) ) {}
    
    // get converted value
    x = ADCW;  
    
    // output the higher 8 bits
    PORTB = ~x>>2;
  }

}

