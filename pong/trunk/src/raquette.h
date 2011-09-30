/**************************************************************************
 *   Copyright (C) 2005 by Sebastien CELLES                                *
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

#ifndef RAQUETTE_HPP
#define RAQUETTE_HPP

#include "espace.h"

class Raquette {
public:
  Raquette(Espace *espace, int player);
  double get_x(void);
  double get_y(void);
  double get_xsize(void);
  double get_ysize(void);
  void move_up(Espace *espace, double delta_t);
  void move_down(Espace *espace, double delta_t);
  void placer(Espace *espace, int player);
private:
  double m_x;
  double m_y;
  double m_vmax; // vitesse en % par s (v>0 && v<1)
  double m_xsize;
  double m_ysize;
  //double m_ecart_bord_vertical; // en %
};

#endif
