// http://www.scienceprog.com/using-vmlab-as-virtual-oscilloscope
#include <avr/io.h>
#include <avr/iom128.h>
int main(void)
{
    #define DELAY 5000
    // variable for pause
    unsigned int pause = 0;
    // set up PORTD 0 and 7 pins as outputs as output
    DDRD|=(_BV(PD0))|(_BV(PD7));
    while(1) {
        PORTD|=_BV(PD0);
        PORTD&=~_BV(PD7);
        while(++pause<DELAY);
        PORTD|=_BV(PD7);
        PORTD&=~_BV(PD0);
        while(--pause>0);
    }
    return 0;
}

