#include <avr/io.h>
//#include <inttypes.h>
#define F_CPU 1000000UL  // 1 MHz
#include <util/delay.h>

int main(void)
{
   /* INITIALIZE */
   /* enable PC5 as output */
   DDRC|= (1<<DDC5);

   while (1) {
      /* led on, pin=0 */
      PORTC &= ~(1<<PC5);
      _delay_ms(100);
      /* set output to 5V, LED off */
      PORTC|= (1<<PC5);
      _delay_ms(100);
      }
   return(0);
}





