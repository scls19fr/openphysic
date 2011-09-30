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

#ifndef GLOBAL_H
#define GLOBAL_H

unsigned long int cycles;

unsigned char state;
enum state_value { state_off = 0, state_splash, state_stop, state_run};

unsigned int ticks;
unsigned int disp;
int nbc;

#define LINE RB1
#define B_LEFT RB2
#define B_RIGHT RB3

unsigned int rpm;

char flag_sector;
char flag_lap;

char flag_save;

#define MAX_SECTORS 3



#endif //GLOBAL_H