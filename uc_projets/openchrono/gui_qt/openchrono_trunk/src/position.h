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

#ifndef POSITION_H
#define POSITION_H

//
#include <QObject>
#include <QtXml>
//

class Position : public QObject
  {
    Q_OBJECT

  public:
    Position( );

    int lap(void) const;
    void setLap(const int lap);
    void clearLap(void);
    void newLap(void);

    int etap(void) const;
    void setEtap(const int etap);
    void clearEtap(void);
    void newEtap(void);

    void reset(void);

    QDomElement to_node( QDomDocument &dom_doc );

  private:
    int m_etap;
    int m_lap;

  };

#endif

