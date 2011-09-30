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

/*
 *  Chronometer mode
 */
bool running_chronometer;

/*
typedef enum { stop = 0, start} chronometer_mode;
chronometer_mode my_chronometer_mode = stop;
*/

void init_hw_timer(void)
{
    //FPWM=Fquartz/(N.256) with N={1,8,64,256,1024}
    //N=Fquartz/(FPWM.256)
    //http://www.jelectronique.com/pwm.php
    // here Fquartz = F_CPU = 1MHz
    // here T = 0.1ms so FPWM = 10 000 Hz  = 10 kHZ
    // That's a  bab idea because
    // we need a variable number of step in the timer TCNT1=ICR1
    //FPWM=Fquartz/((N.(1+TOP))
    //TOP=Fquartz/(FPWM.N)-1
    // N=1 SO TOP=99=Ox63=ICR1 (2 registres de 8 bits)

    OCR1AH=0x03; //Ox00
    OCR1AL=0x20; //0x63

    TCCR1B |=(1<<WGM12)|(0<<CS11)|(1<<CS10); //CTC division F_CPU 1  (1<<WGM12)|(1<<CS11)|(1<<CS10)

    TIMSK|=(1<<OCIE1A);
}

/*
 * start or stop chronometer
 */
inline void StartStopChronometer(void)
{
    add_beep_alarm(1);
    add_led_alarm(1);

    //beep(1,100);
    //led_alarm(1,50);  // led_alarm(3,50) (à diminuer pour ne pas ralentir traitement interruption)
    if (running_chronometer)
    {
        //copy_time(&src_time, &dest_time);
        copy_time(&last_time, &before_last_time);
        copy_time(&current_time, &last_time);

        //running_chronometer = false; // false = 0
        if (compare_time(&last_time, &best_time) == 1) // meilleur temps
        {
            // better time them the best time
            copy_time(&last_time, &best_time);
            //led_alarm(3,50);
            add_led_alarm(3);
            add_beep_alarm(3);
        }
        if (compare_time(&last_time, &before_last_time) == 1) // meilleur que le dernier tour
        {
            // better time them the last time
            //led_alarm(1,50);
            add_led_alarm(1);
            add_beep_alarm(1);
        }

        init_time(&current_time);
    }
    else
    {
        // this is before first lap (start from pit)
        running_chronometer = true; // true = -1
        // this is after first lap
    }
}


void TestRunningChronometer(void)
{
    if (running_chronometer)
    {
        switch_on_led(8);
        _delay_ms(100);
        switch_off_led(8);
        _delay_ms(100);
    }
}


/*
 * interrupt handler for INT0 (HALL PROBE)
 */
//SIGNAL(SIG_INTERRUPT0)
ISR(INT0_vect)
{
    StartStopChronometer();
}



/*
 * interrupt handler for TIMER
 */
//SIGNAL(SIG_OUTPUT_COMPARE1A)
//ISR(TIM1_COMPA_vect)
ISR(SIG_OUTPUT_COMPARE1A)
{
    if (running_chronometer)
    {
    	inc_time(&current_time);
    }
}








