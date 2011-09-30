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

#include	"chrono.h"

int ms2timestruct(unsigned long int t, time_struct * ts) {
	unsigned long int time_remain = t;
	ts->hh = time_remain / 3600000;

	time_remain = time_remain % 3600000;
	ts->mm = time_remain / 60000;

	time_remain = time_remain % 60000;
	ts->ss = time_remain / 1000;

	time_remain = time_remain % 1000;
	ts->xx = time_remain;	

	return 0;
}

/*
void reset_time(void) {
	hh=0;
	mm=0;
	ss=0;
	xx=0;

//	hh=23;
//	mm=59;
//	ss=59;
//	xx=990;
}
*/

/*
void increment(void) {
	time++;

	xx++;
	if (xx==1000) {
		xx=0;
		ss++;
		if (ss==60) {
			ss=0;
			mm++;
			if (mm==60) {
				mm=0;
				hh++;
				if (hh==24) {
					hh=0;
					//dd++;
				}
			}
		}
	}
}
*/