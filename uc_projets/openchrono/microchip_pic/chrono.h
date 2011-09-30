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

#ifndef CHRONO_H
#define CHRONO_H

#include "global.h"

/*
unsigned char hh=0; // 0-24
unsigned char mm=0; // 0-60
unsigned char ss=0; // 0-60
unsigned int xx=0; // 0-1000
*/

typedef struct {
	unsigned char hh; /* 0-24 */
	unsigned char mm; /* 0-60 */
	unsigned char ss; /* 0-60 */
	unsigned int xx; /* 0-1000 */
} time_struct;

time_struct laptime_st;


unsigned long int time;
//unsigned long int time_remain;
unsigned long int laptime_evt[MAX_SECTORS];

//unsigned long int laptime_evt2[3][7];
//unsigned long int laptimes[20];

/* Temps en ms */
unsigned long int laptime[3];
// laptime[0] = temps au tour (laptime_current)
// laptime[1] = dernier temps au tour (laptime_last)
// laptime[2] = avant dernier temps au tour (laptime_penultimate)

unsigned long int laptime_best[2];
 // laptime_best[0] = meilleur temps au tour
 // laptime_best[1] = ancien meilleur temps au tour (laptime_best_old)

//unsigned long int timesector[MAX_SECTORS][2]; // memoire des partiels (du tour en cours et du précédent)
//unsigned long int timesector_best[MAX_SECTORS][2]; // memoire des meilleurs partiels

int ms2timestruct(unsigned long int t, time_struct * ts);

#endif //CHRONO_H