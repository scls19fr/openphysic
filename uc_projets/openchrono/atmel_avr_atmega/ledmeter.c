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

#define Nleds 8  // number of leds connected to the uC

uint8_t n_led_alarm;

// 1=off
// 0=on

/*
 * switch on all leds
 */
void switch_on_all_leds(void)
{
    PORTC = 0x00;
}

/*
 * switch off all leds
 */
void switch_off_all_leds(void)
{
    PORTC = 0xFF;
}

// led from 1 to 8 (LEDSNUM)
// PCx with w from 0 to 7

/*
 * switch on the led with the number called "led"
 */
void switch_on_led(uint8_t led)
{
    uint8_t pin = led - 1;
    uint8_t mask = ~(1<<pin);
    PORTC&=mask;
}

/*
 * switch off the led with the number called "led"
 */
void switch_off_led(uint8_t led)
{
    uint8_t pin = led - 1;
    uint8_t mask = (1<<pin);
    PORTC|=mask;
}

/*
 * switch on every leds one after one with a delay (called "delay")
 */
void switch_on_leds_with_delay(double delay)
{
    uint8_t i;
    for(i = 1; i<=Nleds; i++)
    {
        _delay_ms(delay);
        switch_on_led(i);
    }
}

/*
 * switch off every leds on after one with a delay (called "delay")
 */
void switch_off_leds_with_delay(double delay)
{
    uint8_t i;
    for(i = Nleds; i>=1; i--)
    {
        _delay_ms(delay);
        switch_off_led(i);
    }
}

/*
 * a function for testing leds that switch on every leds and switch off every leds (one after one)
 */
void test_leds_up_down(void)
{
    switch_on_leds_with_delay(50); //100
    _delay_ms(50); //50
    switch_off_leds_with_delay(50); //100
}

void test_leds_up_off(void)
{
    switch_on_leds_with_delay(50); //100
    _delay_ms(50); //50
    switch_off_all_leds();
}

/*
 *  switch on every leds (from 0 to n)  (and switch off others)
 */
void switch_on_min_dels(uint8_t n)
{
    uint8_t i;
    for(i = 1; i<=Nleds; i++)
    {
        if (i<=n)
        {
            switch_on_led(i);
        }
        else
        {
            switch_off_led(i);
        }
    }
}

/*
 *  switch on every leds (from Nleds to n)
 */
void switch_on_max_dels(uint8_t n)
{
    uint8_t i;
    for(i = Nleds; i>=1; i--)
    {
        if (i>=Nleds-n)
        {
            switch_on_led(i);
        }
        else
        {
            switch_off_led(i);
        }
    }
    // TO TEST (switch off)
}

/*
 * switch off every leds, wait and swith them all, n times (a sort of visual alarm)
 */
void led_alarm(uint8_t n, double delay)
{
    uint8_t i;
    for(i = 1; i<=n; i++)
    {
        switch_off_all_leds();
        _delay_ms(delay);
        switch_on_all_leds();
        _delay_ms(delay);
    }
    switch_off_all_leds();
}

/*
 * switch on every dels depending of the percentage p
 */
//#define roundp floor
inline uint8_t roundp(double n)
{
    return floor(n+0.5);
}

// roundp = round for positive number
void show_percent(double p)
{
    // p pourcent
    uint8_t n;
    //n = 4;
    n = roundp(p / 100.0 * Nleds); // TO FIX (math.h ceil floor ... round en Java !)
    // TO FIX : +0.5 is a very dirty hack
    switch_on_min_dels(n);
}


void set_led_alarm(uint8_t n) {
    n_led_alarm = n;
}

void add_led_alarm(uint8_t n) {
    n_led_alarm += n;
}


void do_led_alarm(void) {
    while (n_led_alarm > 0) {
        n_led_alarm--;
        switch_off_all_leds();
        _delay_ms(100);
        switch_on_all_leds();
        _delay_ms(100);
    }
    switch_off_all_leds();
}




