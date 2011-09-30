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

#ifndef ENGINE_STATE_H
#define ENGINE_STATE_H

//
#include <QObject>
//

#include <iostream>

class Engine_State : public QObject
  {
    Q_OBJECT

  public:
    Engine_State( );

    bool on(void);
    bool off(void);
    bool idle(void);

    void switch_on(void);
    void switch_off(void);
    void set_to_idle(void);
    void unset_idle(void);

    void show(void);

    int state(void);


  signals:
    void switched_on(void);
    void switched_off(void);
    void was_set_to_idle(void);
    void was_unset_to_idle(void);


    void changed(void); // ?


  public slots:
    void on_changed(void); // ?
    void change(double RPM);

  private:
    bool m_on;
    bool m_idle;
  };

#endif
