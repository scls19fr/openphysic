/*
OpenChrono
Copyright (C) 2007  Sebastien CELLES
 
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

#include "position.h"
//


Position::Position(  )
{
  reset();
//    setLap(0);
//    setEtap(1);
}

int Position::lap(void) const
  {
    return m_lap;
  }

void Position::setLap(const int lap)
{
  m_lap = lap;
}

void Position::clearLap(void)
{
  m_lap = 0;
}

void Position::newLap(void)
{
  m_lap++;
}

int Position::etap(void) const
  {
    return m_etap;
  }

void Position::setEtap(const int etap)
{
  m_etap = etap;
}

void Position::clearEtap(void)
{
  m_etap = 1;
}

void Position::newEtap(void)
{
  m_etap++;
}

QDomElement Position::to_node( QDomDocument &dom_doc )
{
  // Using attributes

  QDomElement dom_elt = dom_doc.createElement( QLatin1String("position") );

  QString strBuf;

  dom_elt.setAttribute( QLatin1String("lap"), strBuf.setNum( lap() ) );
  dom_elt.setAttribute( QLatin1String("etap"), strBuf.setNum( etap() ) );

  return dom_elt;
}

void Position::reset(void)
{
  clearLap();
  clearEtap();
}

