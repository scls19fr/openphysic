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

#ifndef ENGINE_H
#define ENGINE_H

//
#include <QObject>
#include <QString>
#include <QtXml>
//
#include "rpm.h"
#include "temperature.h"
#include "engine_state.h"
#include "engine_time.h"

class Engine : public QObject
  {
    Q_OBJECT

  public:
    Engine( );

    QString name(void) const;
    void setName(const QString name);

    void set_two_strokes(void);
    void set_four_stroke(void);

    int strokes(void) const;

    int rpm_factor(void);

    Engine_State state;

    Engine_Time time;
    //QTime time;
    //QTime t;

    Rpm rpm;

    //Temperature temperature_1;
    //Temperature temperature_2;
    QVector <Temperature> temperature;


    QDomElement to_node( QDomDocument &dom_doc );

  public slots:
    void on_state_changed(void);

  private:
    QString m_name;

    enum Engine_mode { engine_two_strokes = 0, engine_four_strokes};

    Engine_mode m_mode;

  };

#endif
