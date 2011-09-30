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

#define N 256UL // CS (prescaler for timer)

uint16_t FRQ_COUNT = 0x00; //0x1866;
//uint16_t FREQ = 0;
double FREQ = 0.0;
double RPM = 0.0;
double RPMpc = 0.0;

#define RPMpc_Min 0.0
#define RPMpc_Max 100.0

#define RPM_Min 0.0
#define RPM_Max 15000.0

#define EngineOnRPMminimal 100.0 // en dessous de cette valeur le moteur est considéré comme éteint

#define N_Bar 10 /* nombre de barres du RPMmetre */

inline uint16_t roundp16(double n)
{
    return floor(n+0.5);
}

void init_tachometer_16bits(void) {
EICRA |= (1<<ISC21) | (1<<ISC20); // rising edge INT0 ATmega32
EIMSK |= (1<<INT2);
//sei(); // enable interrupts

// init the counter
TCNT3H=0x00; // initial value
TCNT3L=0x00;

TCCR3A = (0<<WGM31)|(0<<WGM30); //0x00;
TCCR3B = (0<<WGM33)|(0<<WGM32)|(1<<CS32)|(0<<CS31)|(0<<CS30);
// prescaler (shared with TIMER/COUNTER1 on ATmega32)
//TCCR1A=(1<<CS02)|(0<<CS01)|(1<<CS00);
//TCCR0=(1<<CS02)|(0<<CS01)|(1<<CS00); // prédiv de 1024
//TCCR0=(1<<CS02)|(0<<CS01)|(0<<CS00); // prédiv de 256
//TCCR0=(0<<CS02)|(1<<CS01)|(1<<CS00); // prédiv de 64
//TCCR0=(0<<CS02)|(1<<CS01)|(0<<CS00); // prédiv de 8
//TCCR0=(0<<CS02)|(0<<CS01)|(1<<CS00); // pas de prédiv
}

void calc_rpm(void) {
   if ( FRQ_COUNT != 0) {
      FREQ = ((double) F_CPU) / (((double) N) * ((double) (FRQ_COUNT+0.5)));
   } else {
      FREQ = 0; // évite d'afficher n'importe quoi au départ
   }
   RPM = FREQ * 60.0 * get_engine_const(current_engine.type);
}


void print_rpm_char_line(void) {
   calc_rpm();

   double RPMdisp = RPM;

   if ( RPM < EngineOnRPMminimal ) {
      RPMdisp = 0.0;
   }

   printf("%5dRPM",(uint16_t) roundp16(RPMdisp/10.0)*10);

   printf(" ");

   printf("%d",current_engine.number);

   RPMpc = (RPMdisp - RPM_Min) / (RPM_Max - RPM_Min) * 100;
   if ( RPMpc < 0 ) {
      RPMpc = 0;
   }
   if (RPMpc > 100) {
      RPMpc = 100;
   }
   uint8_t i;
   uint8_t Nbar_todisp;
   Nbar_todisp = floor(RPMpc/10+0.5);
   for ( i=0 ; i < Nbar_todisp ; i++ )
   {
      printf("|");
   }
   for ( i=Nbar_todisp ; i < N_Bar ; i++ )
   {
      printf("-");
   }
}

/*
 * interrupt handler for tachometer (RPM) INT2
 * an induction tension (a sort of peak)
 */
//SIGNAL(SIG_INTERRUPT0)
ISR(INT2_vect)
{
   FRQ_COUNT = (TCNT3L)|(TCNT3H<<8); // 16 bits timer (lower bit must be read before)

   TCNT3H=0x00; // initialize counter 16bits
   TCNT3L=0x00;
}






