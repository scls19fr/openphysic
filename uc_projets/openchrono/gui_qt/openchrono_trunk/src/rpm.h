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

#ifndef RPM_H
#define RPM_H

//
#include <QObject>
#include <QtXml>
//

//#include "engine_state.h"

class Rpm : public QObject
  {
    Q_OBJECT

  public:
    Rpm( );

    double value(void) const;
    void set(double const RPM);
    double max(void) const;
    void setMax(double const RPM);
    double min(void) const;
    void setMin(double const RPM);

    //Engine_State * m_engine_state;

    QDomElement to_node( QDomDocument &dom_doc );

  signals:
    void changed(double);

  public slots:
    void on_changed(void);

  private:
    double m_RPM;
    double m_RPMmax;
    double m_RPMmin;

    //double m_RPMoff;
    //double m_RPMidle;

  };

#endif


