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

#ifndef VEHICULE_H
#define VEHICULE_H

//
#include <QString>
#include <QObject>
#include <QtXml>
//

#include "engine.h"
#include "acceleration.h"

class Vehicule : public QObject
  {
    Q_OBJECT

  public:
    Vehicule( );

    QString name(void) const;
    void setName(const QString name);

    Engine engine;
    Acceleration acceleration;

    QDomElement to_node( QDomDocument &dom_doc );

  private:
    QString m_name;

  };

#endif

