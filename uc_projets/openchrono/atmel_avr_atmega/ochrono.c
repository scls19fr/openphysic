/***************************************************************************
 * Project: OpenChrono                                                     *
 * Author: Sebastien CELLES                                                *
 * Module description: an handhelds device for karts, bikes or sport cars  *
 ***************************************************************************/

/***************************************************************************
 *   Copyright (C) 2006 by Sebastien CELLES                                *
 *   s.cls@laposte.net                                                     *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ***************************************************************************/

#define F_CPU 8000000UL  // 8 MHz

#include <stdio.h> // TO FIX (LCD)

#include "lcd.h"	//Fonction de gestion LCD (Fleury)
#include "lcd.c"
//static FILE lcdout = FDEV_SETUP_STREAM( (void *)lcd_putc, NULL,_FDEV_SETUP_WRITE );
//stdout = &lcdout;

#include <avr/io.h> // Most basic include files

#include <stdint.h> // uint8_t = unsigned char

//#include <stdarg.h>
//#include <string.h>

#include <math.h>

#include <util/delay.h>

//#include <avr/io.h>              // Most basic include files
#include <avr/interrupt.h>       // Add the necessary ones
//#include <avr/signal.h>          // here

#include <stdbool.h>           // boolean

//volatile unsigned char a2dCompleteFlag;

//int channel;
//unsigned short analog_result;
//int analog_busy;

//#define N 50 // number between 0 and 255
//#define Nmax 0xFF

#define CHR_PRECISION 4 // precision 1/10000eme = 1/(10^4)
#define CHR_DISPLAY 3 // display 1/1000  = 1/(10^3)

#include "ledmeter.c"
#include "sound.c"
#include "a2d.c"
#include "time_op.c"
#include "chrono.c"

#include "engine.c"
#include "rpm.c"
#include "track.c"
#include "temperature.c"
#include "display.c"
#include "keypad.c"
/*
 * software init function
 */
void init_sf(void)
{
    // Leds
    //test_leds_up_off(); // uncomment for release or comment for debug
    n_led_alarm = 0;

    // Sound
    //beep(3,100); // uncomment for release or comment for debug
    n_beep_alarm = 0;

    // Time
    running_chronometer = false;
    init_time(&current_time);
    init_time(&last_time);
    init_time(&before_last_time);
    init_time(&best_time);

    // Track
    init_track(&current_track);	
	 	
    // Engine
    init_engine(&current_engine);
    
    // Pilot
	
    // LCD
    init_all_the_pages();
    ptr_current_page = &page_title;
    display();
    //_delay_ms(500);	
    ptr_current_page = &page_time;
    //display();	
}

void init_hw_chrono(void) {
    // Set Pin 6 (PD2) as the pin to use for this example
    //PCMSK |= (1<<PIND2); // TO FIX
    //PIND |= (1<<PIND2); // try scls:Error : read-only !!!

    // interrupt on INT0 pin (sensor triggered)
    //MCUCR |= (1<<ISC01) | (1<<ISC00); // rising edge ATmega8535
    EICRA |= (1<<ISC01) | (1<<ISC00); // rising edge  ATmega128

    // turn on interrupts!

    //GICR |= (1<<INT0); //INT0  ATmega8535
    EIMSK |= (1<<INT0); // ATmega128

    //sei(); // enable interrupts
}

void init_hw_led(void) {
    DDRC=0xFF; // set up PORT C pins 0 to 7 as output
    //switch_on_all_leds();
    switch_off_all_leds();
}


/*
 *  hardware init function
 */
void init_hw(void)
{
    // **************
    // * Oscillator *
    // **************
    // internal oscillator set as 8MHz
    // CKSEL

    // ******************
    // * WatchDog Timer *
    // ******************
    // disable by default

    // ********
    // * LEDs *
    // ********
    init_hw_led();

    // *********************************
    // * Start/Stop chronometer (INT0) *
    // *********************************
    init_hw_chrono();

    // *****************************************
    // * Conv Analog to Digital (CAN for Temp) *
    // *****************************************

    //volatile static int analog_result;
    //volatile static unsigned char analog_busy;

    //analog_busy=1; // busy mark the ADC function
    uint8_t channel = 0; // measure ADC0

    // use internal 2.56V ref  REFS1=1 & REFS0=1 (11)
    // use external ref (01)
    ADMUX=(0<<REFS1)|(1<<REFS0)|(channel & 0x07); // channel & 0x07

    //ADCSRA=(1<<ADEN)|(1<<ADIE)|(1<<ADIF)|(1<<ADPS2); // interrupt ADIE=1
    ADCSR=(1<<ADEN)|(0<<ADIE)|(1<<ADIF)|(1<<ADPS2); // no interrupt ADIE=0

    ADCSR |= (1 << (ADSC)); // start conversion

    DDRA=0x00;
    // make sure pull-up resistors are turned off
    PORTA = 0x00;

    init_temperature();


    // **********
    // * Keypad *
    // **********
    init_hw_keypad();


    // ***********
    // * Display *
    // ***********
    init_hw_display();

    // *********
    // * Timer *
    // *********
    init_hw_timer();

    // *******
    // * RPM *
    // *******
    init_tachometer_16bits();

    // Sound

    // Time

    sei(); // enable interrupts
}

/*
 * init function
 */
void init(void)
{
    init_hw();
    init_sf();
    //sei();
}


/*
 *  this is the main loop
 */
void loop(void)
{
    //SeekButtons(); // use INT1 instead

    // Temp
    volatile double ch0 = adcConvert10bit(0);
    ch0 *= 0.09765625; // 0.09765625 = 100 / 2^10
    show_percent(ch0);

    // display (LCD)
    display();

    // alarm are in the main loop
    // because in the interrupt
    // it could make the counter
    // count slower...
    //do_led_alarm(); // TODO : Uncomment this for RELEASE
    //do_beep_alarm();

    /*
      _delay_ms(500);

      double ch1 = adcConvert10bit(1);
      ch1 *= 0.09765625; // 0.09765625 = 100 / 2^10
      show_percent(ch1);

      _delay_ms(500);
    */

    //TestRunningChronometer();

    //inc_time(&current_time);
}


/*
 * main program
 */
int main(void)
{
    init();
    while(1)
    { // Infinite loop; define here the
        loop(); // system behaviour
        asm("nop");          // Inline assembly example
        asm("nop");          // Inline assembly example
    }
    return 0;
}









