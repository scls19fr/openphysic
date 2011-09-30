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

#define Nbuts 6
#define B_OK 0 // C
#define B_CANCEL 1 // E
#define B_LEFT 2  // 4
#define B_RIGHT 3 // 6
#define B_UP 4 // 1
#define B_DOWN 5 // 9

void init_hw_keypad(void)
{
    // 1 joystick button (4 directions, up, down, left, right)
    // 2 push buttons (ok, cancel)
    // keypad input
    DDRB=0x00;
    PORTB=0xFF;
    // keypad interrupt with OR output on INT1
    //MCUCR |= (1<<ISC11) | (0<<ISC10); // falling edge ATmega8535
    //EICRA |= (1<<ISC11) | (0<<ISC10); // falling edge ATmega8535 (relachement bouton)
    //EICRA |= (0<<ISC11) | (1<<ISC10); // changement d'état (appui ou relachement bouton)
    //MCUCR |= (0<<ISC11) | (0<<ISC10); // low level (for test)
    EICRA |= (1<<ISC11) | (1<<ISC10); // rising edge ATmega128

    //GICR |= (1<<INT1); // turn on interrupts INT1  (ATmega8535)
    EIMSK |= (1<<INT1); // ATmega128
}


inline void SeekButtons(void)
{
	//switch_on_all_leds();
	//switch_off_all_leds();
   //PORTC = PINB;
	//PORTC = ~PINB;
	//PORTC = 0x00;
	
	// TO FIX !!!!
	
   //~ !
	uint8_t tmpKEY;
	tmpKEY = ~PINB;
	
   //switch(~PINB) { // don't work (PINB is changing)
   switch(tmpKEY) {
      case (1<<B_OK): // Only OK button
         //switch_on_led(B_OK+1);
         (ptr_current_page->on_ok)();
         break;
      case (1<<B_CANCEL): // Only Cancel button
         //switch_on_led(B_CANCEL+1);
         (ptr_current_page->on_cancel)();
         break;
      case (1<<B_LEFT): // Only Left button
         //switch_on_led(B_LEFT+1);
         (ptr_current_page->on_left)();
         break;
      case (1<<B_RIGHT): // Only Right button
         //switch_on_led(B_RIGHT+1);
         (ptr_current_page->on_right)();
         break;
      case (1<<B_UP): // Only Up button
         //switch_on_led(B_UP+1);
         (ptr_current_page->on_up)();
         break;
      case (1<<B_DOWN): // Only Down button
         //switch_on_led(B_DOWN+1);
         (ptr_current_page->on_down)();
         break;
      //case (1<<B_OK)|(1<<B_CANCEL): // combinaison de 2 touches (OK & CANCEL)
      //   break;
      default: // Undefined
         //switch_off_all_leds();
         ptr_page_goto = ptr_current_page;
         break;
   }


// changement de page d'affichage
   if (ptr_page_goto != NULL) {
      ptr_current_page = ptr_page_goto;
   }
}

/*
 * interrupt handler for INT1 (KEYPAD)
 * a OR function is made using diodes
 * and is send to INT1
 */
//SIGNAL(SIG_INTERRUPT1)
ISR(INT1_vect)
{
    //PORTC = 0x00;  // TO FIX
    SeekButtons();
}







