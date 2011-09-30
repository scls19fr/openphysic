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

#ifndef TRACK_H
#define TRACK_H

typedef struct track_
{
	unsigned char sectors; // Number of sectors on the track (nb of magnetic field)
	unsigned char current_sector;
	unsigned char initial_sector;

	unsigned char lap;
}
track;

track current_track;

void init_track(track* my_track);

/*
void track_new_lap(track* my_track);
*/

void track_new_sect(track* my_track);

unsigned char get_previous_sect(track* my_track);
void modify_sectors(track* my_track);
void set_sectors(track* my_track, unsigned char new_val);

void read_track(track* my_track);
void save_track(track* my_track);

#endif //TRACK_H
