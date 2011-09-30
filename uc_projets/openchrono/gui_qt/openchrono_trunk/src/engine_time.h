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

#ifndef ENGINE_TIME_H
#define ENGINE_TIME_H

#include <QObject>
#include <QTime>
//

#include <iostream>

#include <sys/time.h>
#include <unistd.h>

#include <cstdlib> // memcpy

class Engine_Time : public QObject // public QTime
  {
    Q_OBJECT

  public:
    Engine_Time( );

    void start(void);
    void stop(void);
    void reset(void);

    QString toString(void);

    bool is_running(void);

  private:
    bool m_running;

    /* QTime are limited to 24 hours ! */
    QTime time;
    QTime t;

    // Instants
    struct timeval tv_start, tv_stop;

    // Durées
    struct timeval total_engine_time, session_engine_time;


  };

#endif
