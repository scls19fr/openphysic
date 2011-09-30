#include <avr/io.h>
#define F_CPU 1000000UL  // 1 MHz

int main(void)
{
   /* OC1A */
   // OC1A as output
   DDRB |= (1<<PB1);

   // TOP, set for 50Hz (20ms=20000us)
   ICR1 = 20000;

   TCCR1A = (1<<COM1A1)|(1<<WGM11);
   TCCR1B = (1<<WGM13)|(1<<WGM12)|(0<<CS12)|(0<<CS11)|(1<<CS10); // clk=1Mhz - no prescaler

   OCR1A = 15000;

   /* OC1B */
   // OC1B as output
   DDRB |= (1<<PB2);
   TCCR1A |= (1<<COM1B1);

   OCR1B = 5000;

   /* OC2 */
   // OC2 as output
   DDRB |= (1<<PB3);

   // clk=1Mhz - no prescaler
   TCCR2 = (0<<FOC2)|(1<<WGM20)|(1<<COM21)|(0<<COM20)|(1<<WGM21)|(0<<CS22)|(0<<CS21)|(1<<CS20);
   OCR2=200; // 128

   while (1) {
      }
   return(0);
}





