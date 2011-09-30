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

uint8_t n_beep_alarm;

/*
 * send a sound (on or more beep(s))
 */
void beep(uint8_t n, double delay)
{
    // TO DO
    uint8_t i;
    for(i = 1; i<=n; i++)
    {
        //TO DO : send a beep
        if (n>1)
        {
            _delay_ms(delay);
        }
    }
}

void set_beep_alarm(uint8_t n) {
    n_beep_alarm = n;
}

void add_beep_alarm(uint8_t n) {
    n_beep_alarm += n;
}


void do_beep_alarm(void) {
    while (n_beep_alarm > 0) {
        n_beep_alarm--;
        // TO DO
        _delay_ms(50);
    }
}


