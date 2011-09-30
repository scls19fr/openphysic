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

#ifndef DISPLAY_H
#define DISPLAY_H

char L_OFFSET[] = {0x00, 0x40, 0x14, 0x54};
/*	i=0 -> L1 0x00=0
	i=1 -> L1 0x40=64
	i=2 -> L1 0x14=0x40-22*2
	i=3 -> L1 0x54=0x40+20
*/

#define NB_COLS 20
#define NB_LINES 4

char buffer[NB_COLS+1];
//char bufferScreen[NB_LINES][NB_COLS+1];

/*
void clear_buffer(void);
void flag2buffer(void);
void splashscreen2buffer(void);
void buffer2lcd(void);
void display_normal(void);
*/

typedef struct page_typ
{
	void (*display) (void); // pointeur de fonction sur fonction d'affichage

	struct page_typ * page_next;

	void (*on_left) (void);     // ptr de fct sur evenement appui touche ok
	void (*on_right) (void); // ptr de fct sur evenement appui touche cancel
};

struct page_typ * ptr_current_page;

struct page_typ page_splash;
struct page_typ page_normal;
struct page_typ page_config_sectors;

void init_pages(void);



void goto_next_page(void);

char new_page_flag;

/*
fncall fp__click_left, click_left
*/

/*
#asm
fncall _main, _click_left
#endasm
*/

#endif //DISPLAY_H