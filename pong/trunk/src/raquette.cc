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

#include "raquette.h"

#include <iostream>
using namespace std;

Raquette::Raquette(Espace *espace, int player)
{
  m_xsize = 5;
  m_ysize = 50;
  //m_ecart_bord_vertical = 0.10; // en %

  //cout << "Nouvelle Raquette" << endl;
  placer(espace,player);

  m_vmax = 0.5;
}

void Raquette::placer(Espace *espace, int player)
{
  double m_ecart_bord_vertical = 0.10;

  if (player==1)
    {
      m_x = espace->get_x()*m_ecart_bord_vertical;
    }
  else if (player==2)
    {
      m_x = espace->get_x()*(1-m_ecart_bord_vertical);
    }
  else
    {
      m_x = espace->get_x()/2.0;    
    }

  m_y = espace->get_y()/2.0;
}

double Raquette::get_x(void)
{
  return m_x;
}

double Raquette::get_y(void)
{
  return m_y;
}


double Raquette::get_xsize(void)
{
  return m_xsize;
}

double Raquette::get_ysize(void)
{
  return m_ysize;
}

void Raquette::move_up(Espace *espace, double delta_t)
{
  if (m_y - m_vmax*delta_t - m_ysize/2.0 > 0 )
    {
      m_y -= m_vmax*delta_t;
    }
}

void Raquette::move_down(Espace *espace, double delta_t)
{
  if (m_y + m_vmax*delta_t + m_ysize/2.0 < espace->get_y() )
    {
      m_y += m_vmax*delta_t;
    }
}
