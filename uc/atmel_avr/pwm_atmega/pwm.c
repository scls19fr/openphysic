// from http://www.jelectronique.com/pwm.php

#include <avr/io.h>

// Declare your global variables here

int main(void)
{
// Declare your local variables here

// Input/Output Ports initialization
// Port A initialization
// Func7=In Func6=In Func5=In Func4=In Func3=In Func2=In Func1=In Func0=In
// State7=T State6=T State5=T State4=T State3=T State2=T State1=T State0=T
//PORTA=0x00;
//DDRA=0x00;

// Port B initialization
// Func7=In Func6=In Func5=In Func4=In Func3=In Func2=In Func1=In Func0=In
// State7=T State6=T State5=T State4=T State3=T State2=T State1=T State0=T
//PORTB=0x00;
//DDRB=0x00;

// Port C initialization
// Func7=In Func6=In Func5=In Func4=In Func3=In Func2=In Func1=In Func0=In
// State7=T State6=T State5=T State4=T State3=T State2=T State1=T State0=T
//PORTC=0x00;
//DDRC=0x00;

// Port D initialization
// Func7=In Func6=In Func5=Out Func4=In Func3=In Func2=In Func1=In Func0=In
// State7=T State6=T State5=0 State4=T State3=T State2=T State1=T State0=T
//PORTD=0x00;
//DDRD|=(1<<PD5); // | 1<<PD4 | 1<<PD6 | 1<<PD7; //0x20; //ATmega16 or 32
//DDRB|=(1<<PB1);
//DDRB|=(1<<PB2);

// Timer/Counter 0 initialization
// Clock source: System Clock
// Clock value: Timer 0 Stopped
// Mode: Normal top=FFh
// OC0 output: Disconnected
//TCCR0=0x00;
//TCNT0=0x00;
//OCR0=0x00; // ATmega16 32
//OCR1A=0x00; // ATmega8

// Timer/Counter 1 initialization
// Clock source: System Clock
// Clock value: 62,500 kHz
// Mode: Fast PWM top=ICR1
// OC1A output: Non-Inv.
// OC1B output: Discon.
// Noise Canceler: Off
// Input Capture on Falling Edge
// Timer 1 Overflow Interrupt: Off
// Input Capture Interrupt: Off
// Compare A Match Interrupt: Off
// Compare B Match Interrupt: Off
/*
TCCR1A=0x82;
TCCR1B=0x1B;
TCNT1H=0x00;
TCNT1L=0x00;
ICR1H=0x04;//0x04;
ICR1L=0xE2;//0xE2;
OCR1AH=0x00;//0x02;//0x00;
OCR1AL=0x1F;//0x71;//0x1F;
OCR1BH=0x00;
OCR1BL=0x00;
*/

/* clk=4Mhz */
//DDRB=1<<PB1;
//TCCR1A=(1<<COM1A1) | (0<<COM1A0) | (0<<COM1B1) | (0<<COM1B0) | (0<<FOC1A) | (0<<FOC1B) | (1<<WGM11) | (1<<WGM10); //0x82;
//TCCR1B=(0<<ICNC1) | (0<<ICES1) | (1<<WGM13) | (1<<WGM12) | (0<<CS12) | (1<<CS11) | (1<<CS10); //0x1B; // frq=clk/64

//TCCR1A = (1<<COM1A1) | (0<<COM1A0) | (1<<WGM11);
//TCCR1B = (1<<WGM13) | (1<<WGM12) | (1<<CS11) | (1<<CS10);

/* T=20ms f=50Hz */
//ICR1=0x04E1;//0x04E2; //ICR1H=0x04; //ICR1L=0xE2;
/* alpha=0.5 */
//OCR1A=0x0270;//0x0271; //OCR1AH=0x02; //OCR1AL=0x71;


// OC1A, OC1B outputs
   DDRB |= (1<<PB1)|(1<<PB2);
   // TOP, set for 50Hz (20ms)
   ICR1 = 20000;
   // Center outputs (1.5ms)
   OCR1A = 1500;
//   OCR1B = 1500;
   // Timer 1 fast PWM mode 14
   // Clear on compare, set at TOP
   // /8 prescaler
   TCCR1A = (1<<COM1A1)|(1<<COM1B1)|(1<<WGM11);
   //TCCR1B = (1<<WGM13)|(1<<WGM12)|(1<<CS11); //clk=8Mhz - prescaler=8
   TCCR1B = (1<<WGM13)|(1<<WGM12)|(1<<CS10); // 1Mhz - no prescaling

// 50 Hz alpha=0.5
// TO FIX
//TCCR1A=(0<<COM1A1) | (1<<COM1A0) | (0<<WGM11) | (0<<WGM10); // inv pin on compare match , mode CTC
//TCCR1B=(0<<WGM13) | (1<<WGM12) | (1<<CS12) | (1<<CS11) | (1<<CS10); // mode CTC et prescaler a 1024
//OCR1A=0x0026;  // reg 16b directement accessible sans utiliser les registres hauts et bas
// frequence d'inversion de la pin : 4000000/(1024(1+0x26)

// Timer/Counter 2 initialization
// Clock source: System Clock
// Clock value: Timer 2 Stopped
// Mode: Normal top=FFh
// OC2 output: Disconnected
//ASSR=0x00;
//TCCR2=0x00;
//TCNT2=0x00;
//OCR2=0x00;

// External Interrupt(s) initialization
// INT0: Off
// INT1: Off
// INT2: Off
//MCUCR=0x00;
//MCUCSR=0x00;

// Timer(s)/Counter(s) Interrupt(s) initialization
//TIMSK=0x00;

// Analog Comparator initialization
// Analog Comparator: Off
// Analog Comparator Input Capture by Timer/Counter 1: Off
//ACSR=0x80;
//SFIOR=0x00;

while (1)
      {
      //asm("nop");          // Inline assembly example
      //asm("nop");          // Inline assembly example
      };

return 0;
}








