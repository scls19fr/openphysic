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
 * convert from analog to digital (10 bits)
 */
unsigned short adcConvert10bit(uint8_t ch)
{
    //a2dCompleteFlag = 0;				// clear conversion complete flag
    ADMUX = ((ADMUX) & ~0x1F) | (ch & 0x1F);	// set channel ADC_MUX_MASK=0x1F
    ADCSRA |= (_BV(ADIF)); // clear hardware "conversion complete" flag
    ADCSRA |= (_BV(ADSC)); // start conversion

    //while(!a2dCompleteFlag);				// wait until conversion complete
    //while( bit_is_clear(ADCSR, ADIF) );		// wait until conversion complete
    while( bit_is_set(ADCSRA, ADSC) );		// wait until conversion complete

    // CAUTION: MUST READ ADCL BEFORE ADCH!!!
    return ((ADCL) | ((ADCH)<<8));	// read ADC (full 10 bits);
}

/*
 * convert from analog to digital (8 bits)
 * starts conversion, waits until conversion is done, and returns result
 */
unsigned char adcConvert8bit(unsigned char ch)
{
    // do 10-bit conversion and return highest 8 bits
    return adcConvert10bit(ch)>>2;			// return ADC MSB byte
}

