/***************************************************************************
 *   OpenChrono                                                            *
 *   Copyright (C) 2010 by Sebastien CELLES                                *
 *   s.celles@gmail.com                                                    *
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

#include "lcd.h"

#include <stdio.h>
#include <string.h>
#include <stddef.h>

#include "global.h"
#include "track.h"
#include "display.h"
#include "chrono.h"

/*
// Tester le LCD en envoyant
// A2345678901234567890
// B2345678901234567890
// C2345678901234567890
// D2345678901234567890
void test_buffer(void) {
	for (unsigned char i=0 ; i<NB_LINES ; i++) {
		for(unsigned char j=0 ; j<NB_COLS ; j++) {
			if (j!=0) {
				bufferScreen[i][j] = 0b0011<<4 | (j+1)%10 ;
			} else {
				bufferScreen[i][j] = 0b0100<<4 | (i+1)%10 ;
			}
		}
	}
}
*/

/*
// Effacer le buffer
void clear_buffer(void) {
	for (unsigned char i=0 ; i<NB_LINES ; i++) {
		for(unsigned char j=0 ; j<NB_COLS ; j++) {
			bufferScreen[i][j] = 0;
		}
	}
}

void flag2buffer(void) {
	// Drapeau à damier
	for (unsigned char i=0 ; i<NB_LINES ; i++) {
		for(unsigned char j=0 ; j<NB_COLS ; j++) {
			if (((j+i) % 2) == 0) {
				bufferScreen[i][j] = 0b11111111; // nb pair -> pavé plein
			} else {
				bufferScreen[i][j] = 0b11111110; // nb impair -> pavé vide
			}
		}
	}
}

void splashscreen2buffer(void) {
	flag2buffer();

	// Texte
	strcpy(bufferScreen[1]+4, " OpenChrono ");
	strcpy(bufferScreen[2]+5, " S. Celles");
}

void buffer2lcd(void) {
	//lcd_clear();
	for (unsigned char i=0 ; i<NB_LINES ; i++) {
		lcd_goto(L_OFFSET[i]);
		for(unsigned char j=0 ; j<NB_COLS ; j++) {
			lcd_putch(bufferScreen[i][j]);
		}
	}
}
*/

void display_splash(void) {
/*
	for (unsigned char i=0 ; i<NB_LINES ; i++) {
		lcd_goto(L_OFFSET[i]);
		for(unsigned char j=0 ; j<NB_COLS ; j++) {
			if (((j+i) % 2) == 0) {
				lcd_putch(0b11111111); // nb pair -> pavé plein
			} else {
				lcd_putch(0b11111110); // nb impair -> pavé vide
			}
		}
	}
*/
	lcd_goto(L_OFFSET[0]+5);
	lcd_puts("OpenChrono");
	lcd_goto(L_OFFSET[1]+5);
	lcd_puts("   v0.1   ");
	lcd_goto(L_OFFSET[2]+5);
	lcd_puts(" S.Celles ");
	//lcd_goto(L_OFFSET[3]+3);
	//lcd_puts("www.celles.net");
	lcd_goto(L_OFFSET[3]+7);
	nbc = sprintf(buffer, "%06d", cycles);
	lcd_puts(buffer);
}


void display_normal() {
/*
  12345678901234567890
  --------------------
1|00000 RPM L00 T 150°|
2| 0:00:000  B0:00:000|
3|L0:00:000  B+:00:000|
4|L+:00:000 1/2:00:000|
  --------------------
*/
	//lcd_clear();

	disp++;
	lcd_goto(L_OFFSET[0]);	// select first line
	if (rpm!=0) {
		nbc = sprintf(buffer, "%05d", 0);
		lcd_puts(buffer);
	} else {
		lcd_puts("_____");
	}
	lcd_putch(' ');
	if ( state==state_run || state==state_stop && (&current_track)->lap!=0 ) {
		nbc = sprintf(buffer, "L%02d", (&current_track)->lap); // lap
		lcd_puts(buffer);
	} else {
		lcd_puts("L__");
	}
	lcd_putch(' ');
	//nbc = sprintf(buffer, "%06u", ticks); // ticks
	//lcd_puts(buffer);
	lcd_puts("OpenChrono");

	lcd_goto(L_OFFSET[1]);	// Select second line
	if (state==state_run) {
		ms2timestruct(time-laptime_evt[0], &laptime_st);
		nbc = sprintf(buffer, " %01u:%02u:%03u", ((&laptime_st)->mm)%10, (&laptime_st)->ss, (&laptime_st)->xx); // temps tour en cours
		lcd_puts(buffer);
	} else {
		lcd_puts(" * STOP *");
		//lcd_puts(" 0:00:000");
	}
	lcd_puts("  ");
	if (laptime_best[0]!=0) {
		ms2timestruct(laptime_best[0], &laptime_st);
		nbc = sprintf(buffer, "B%01u:%02u:%03u", ((&laptime_st)->mm)%10, (&laptime_st)->ss, (&laptime_st)->xx); // meilleur temps au tour
		lcd_puts(buffer);
		//lcd_puts(laptime_best);
	} else {
		lcd_puts("B_:__:___");
	}

	lcd_goto(L_OFFSET[2]);
	if (laptime[1]!=0) {
		ms2timestruct(laptime[1], &laptime_st);
		nbc = sprintf(buffer, "L%01u:%02u:%03u", ((&laptime_st)->mm)%10, (&laptime_st)->ss, (&laptime_st)->xx); // dernier temps tour
		lcd_puts(buffer);
	} else {
		lcd_puts("L_:__:___");
	}
	lcd_puts("  ");
	if (laptime_best[0]!=0 && laptime_best[1]!=0) {
		lcd_putch('B');
		if (laptime[1]>laptime_best[0]) {
			lcd_putch('+');
			ms2timestruct(laptime[1]-laptime_best[0], &laptime_st);
		} else if (laptime_best[1]==laptime_best[0]) {
			lcd_putch('=');
			ms2timestruct(0, &laptime_st);
		} else if (laptime_best[0]<laptime_best[1]) {
			lcd_putch('-');
			ms2timestruct(laptime_best[1]-laptime_best[0], &laptime_st);
		}
		nbc = sprintf(buffer, ":%02u:%03u", (&laptime_st)->ss, (&laptime_st)->xx); // ecart meilleur temps au tour - dernier temps au tour
		lcd_puts(buffer);
	} else {
		lcd_puts("B?:__:___"); // ToFix symbole +/-
	}

	lcd_goto(L_OFFSET[3]);
	if (laptime[2]!=0) {
		lcd_putch('L');
		if (laptime[1]>laptime[2]) {
			lcd_putch('+');
			ms2timestruct(laptime[1]-laptime[2], &laptime_st);
		} else if (laptime[1]==laptime[2]) {
			lcd_putch('=');
			ms2timestruct(0, &laptime_st);
		} else if (laptime[1]<laptime[2]) {
			lcd_putch('-');
			ms2timestruct(laptime[2]-laptime[1], &laptime_st);
		}
		nbc = sprintf(buffer, ":%02u:%03u", (&laptime_st)->ss, (&laptime_st)->xx); // écart dernier temps au tour et avant dernier temps au tour
		lcd_puts(buffer);
	} else {
		lcd_puts("L?:__:___");
	}
	lcd_puts(" ");


	nbc = sprintf(buffer, "%1u/%1u:", ((&current_track)->current_sector)%10, ((&current_track)->sectors)%10); // temps étape
	lcd_puts(buffer);

	if (state==state_run && (&current_track)->sectors!=1) {
		ms2timestruct(time-laptime_evt[(&current_track)->current_sector-1], &laptime_st);
		nbc = sprintf(buffer, "%02u:%03u", (&laptime_st)->ss, (&laptime_st)->xx); // temps étape
		lcd_puts(buffer);
	} else {
		lcd_puts("__:___");
	}
}

void display_sector(void) {
/*
  --------------------      --------------------      --------------------
1|Sect 2/2 (RECORD !) |   1|New sect (Better !) |   1|New sect            |
2|L00        00:00:000|
3|B+0:00:000 00:00:000|
4|L+0:00:000 00:00:000|
  --------------------	
*/
lcd_goto(L_OFFSET[0]);	// Select second line
nbc = sprintf(buffer, "Sect %1u->%1u/%1u (L%02u)", get_previous_sect((&current_track)), ((&current_track)->current_sector)%10, ((&current_track)->sectors)%10, ((&current_track)->lap)%100); // temps étape
lcd_puts(buffer);

lcd_goto(L_OFFSET[1]);	// Select second line
ms2timestruct(laptime_evt[(&current_track)->current_sector-1]-laptime_evt[get_previous_sect((&current_track))-1], &laptime_st);
nbc = sprintf(buffer, " %01u:%02u:%03u", ((&laptime_st)->mm)%10, (&laptime_st)->ss, (&laptime_st)->xx); // temps tour en cours
lcd_puts(buffer);

}

void display_lap(void) {
/*
  --------------------      --------------------      --------------------
1|LAP 00  (! RECORD !)|   1|NEW LAP (! Better !)|   1|NEW LAP             |
2|           00:00:000|
3|B+0:00:000 00:00:000|
4|L+0:00:000 00:00:000|
  --------------------
*/

	lcd_goto(L_OFFSET[0]);	// Select second line
	lcd_puts("LAP   ");
	nbc = sprintf(buffer, "L%02d", (&current_track)->lap); // lap
	lcd_puts(buffer);


	lcd_goto(L_OFFSET[1]);	// Select second line
	ms2timestruct(laptime[1], &laptime_st);
	nbc = sprintf(buffer, " %01u:%02u:%03u", ((&laptime_st)->mm)%10, (&laptime_st)->ss, (&laptime_st)->xx); // dernier temps tour
	lcd_puts(buffer);
	lcd_puts("  ");
	if (laptime_best!=0) {
		ms2timestruct(laptime_best[0], &laptime_st);
		nbc = sprintf(buffer, "B%01u:%02u:%03u", ((&laptime_st)->mm)%10, (&laptime_st)->ss, (&laptime_st)->xx); // meilleur temps au tour
		lcd_puts(buffer);
	} else {
		lcd_puts("B_:__:___");
	}

	lcd_goto(L_OFFSET[2]);
	if (laptime[2]!=0) {
		ms2timestruct(laptime[2], &laptime_st);
		nbc = sprintf(buffer, "L%01u:%02u:%03u", ((&laptime_st)->mm)%10, (&laptime_st)->ss, (&laptime_st)->xx); // dernier temps tour
		lcd_puts(buffer);
	} else {
		lcd_puts("L_:__:___");
	}
	lcd_puts("  ");
	if (laptime_best[0]!=0 && laptime_best[1]!=0) {
		lcd_putch('B');
		if (laptime[1]>laptime_best[0]) {
			lcd_putch('+');
			ms2timestruct(laptime[1]-laptime_best[0], &laptime_st);
		} else if (laptime_best[1]==laptime_best[0]) {
			lcd_putch('=');
			ms2timestruct(0, &laptime_st);
		} else if (laptime_best[0]<laptime_best[1]) {
			lcd_putch('-');
			ms2timestruct(laptime_best[1]-laptime_best[0], &laptime_st);
		}
		nbc = sprintf(buffer, ":%02u:%03u", (&laptime_st)->ss, (&laptime_st)->xx); // ecart meilleur temps au tour - dernier temps au tour
		lcd_puts(buffer);
	} else {
		lcd_puts("B?:__:___"); // ToFix symbole +/-
	}

	lcd_goto(L_OFFSET[3]);
	if (laptime[2]!=0) {
		lcd_putch('L');
		if (laptime[1]>laptime[2]) {
			lcd_putch('+');
			ms2timestruct(laptime[1]-laptime[2], &laptime_st);
		} else if (laptime[1]==laptime[2]) {
			lcd_putch('=');
			ms2timestruct(0, &laptime_st);
		} else if (laptime[1]<laptime[2]) {
			lcd_putch('-');
			ms2timestruct(laptime[2]-laptime[1], &laptime_st);
		}
		nbc = sprintf(buffer, ":%02u:%03u", (&laptime_st)->ss, (&laptime_st)->xx); // écart dernier temps au tour et avant dernier temps au tour
		lcd_puts(buffer);
	} else {
		lcd_puts("L?:__:___");
	}

}

#define DISP_SECT_DELAY 2000
#define DISP_LAP_DELAY 3000
#define DISP_LAST_SECT_DELAY 1000

void display_config_sectors(void) {
	lcd_goto(L_OFFSET[0]);
	lcd_puts("====== CONFIG ======");	

	lcd_goto(L_OFFSET[1]);
	lcd_puts("   Sectors number   ");	

	lcd_goto(L_OFFSET[2]);
	nbc = sprintf(buffer, "       > %02u <       ", (&current_track)->sectors); // dernier temps tour
	lcd_puts(buffer);

	lcd_goto(L_OFFSET[3]);
	lcd_puts("Next          Modify");	
}

void display_main(void) {
	if (flag_sector || flag_lap) {

		if (!flag_lap) {
			display_sector();
			if (time-laptime_evt[(&current_track)->current_sector-1]>=DISP_SECT_DELAY) {
				flag_sector = 0;
				new_page_flag = 1;
			}
		} else {
			if (flag_sector) {
				display_lap();
				if (time-laptime_evt[0]>=DISP_LAP_DELAY) {
					flag_sector = 0;
					new_page_flag = 1;
				}
			} else {
				if ((&current_track)->sectors>1) {
					display_sector();
					if (time-laptime_evt[(&current_track)->current_sector-1]>=DISP_LAP_DELAY+DISP_LAST_SECT_DELAY) {
						flag_lap = 0;
					}
				} else {
					flag_lap = 0;
					new_page_flag = 1;
				}
			}
		}
	} else {
		display_normal();
	}
}

void goto_next_page(void) {
	if (!new_page_flag) {
		ptr_current_page = ptr_current_page->page_next;
		new_page_flag = 1;
	}
}

void click_left(void) {
	lcd_puts("LEFT");
}

void click_right_config_sectors(void) {
	modify_sectors(&current_track);
	flag_save = 1;
}

void click_right_normal(void) {
	if (state == state_run) {
		state = state_stop;
	}
}

void init_pages(void) {
	page_splash.display = &display_splash;
	page_splash.page_next = &page_normal;
	//page_splash.on_left = NULL;
	page_splash.on_right = NULL;

	page_normal.display = &display_main;
	page_normal.page_next = &page_config_sectors;
	//page_normal.on_left = NULL;
	page_normal.on_right = &click_right_normal;
	
	page_config_sectors.display = &display_config_sectors;
	page_config_sectors.page_next = &page_normal;
	//page_config_sectors.on_left = NULL;
	page_config_sectors.on_right = &click_right_config_sectors;

	ptr_current_page = &page_splash;
	//ptr_current_page = &page_normal;
}