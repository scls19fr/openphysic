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

#include "eeprom.h"

#include <pic.h>

//Ecrire data dans l'EEPROM à partir de l'adresse "n"
void eeprom_write_uint32(unsigned long int n, unsigned long int data) {
   for (unsigned char i = 0; i < 4; i++)
     eeprom_write(i + n, *(((unsigned char*)&data) + i) ) ;
}
 
//Lire depuis l'EEPROM partir de l'adresse "n"
unsigned long int eeprom_read_uint32(unsigned long int n) {
   unsigned long int data=0;
   for (unsigned char i = 0; i < 4; i++)
     *(((unsigned char*)&data) + i) = eeprom_read(i + n);
   return(data);
}

