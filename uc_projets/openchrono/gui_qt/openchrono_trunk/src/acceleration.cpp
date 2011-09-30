/*
OpenChrono
Copyright (C) 2008  Sebastien CELLES
 
This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.
 
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
 
You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
*/

#include "acceleration.h"
//


Acceleration::Acceleration(  )
{
  setGX(0.0);
  setGY(0.0);
  setGZ(0.0);
}

double Acceleration::GX(void) const
{
  return m_GX;
}

void Acceleration::setGX(const double g)
{
  m_GX = g;
}

double Acceleration::GY(void) const
{
  return m_GY;
}

void Acceleration::setGY(const double g)
{
  m_GY = g;
}

double Acceleration::GZ(void) const
{
  return m_GZ;
}

void Acceleration::setGZ(const double g)
{
  m_GZ = g;
}

