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

#ifndef ACCELERATION_H
#define ACCELERATION_H

//
#include <QObject>
#include <QtXml>
//

class Acceleration : public QObject
  {
    Q_OBJECT

  public:
    Acceleration( );

    double GX(void) const;
    void setGX(const double g);

    double GY(void) const;
    void setGY(const double g);

    double GZ(void) const;
    void setGZ(const double g);

    //QDomElement to_node( QDomDocument &dom_doc );

  private:
    double m_GX;
    double m_GY;
    double m_GZ;

  };

#endif

