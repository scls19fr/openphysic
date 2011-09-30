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

// ignition (allumage)
enum engine_mode { engine_two_strokes = 0, engine_four_strokes};

uint8_t get_engine_const(const enum engine_mode my_engine_type) {
   switch(my_engine_type)
   {
      case engine_two_strokes:
        return 1;
        break;
      case engine_four_strokes:
        return 2;
        break;
    default:
        return 1;
        break;
   } 		
}

typedef struct engine_
{
	uint8_t number;
	enum engine_mode type;
   time_typ time;
}
engine;

engine current_engine;

void init_engine(engine* my_engine) {
	my_engine->number = 2;
	my_engine->type = engine_two_strokes;
	init_time(&(my_engine->time));	
}
