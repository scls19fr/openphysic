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

#ifndef CHRONO_H
#define CHRONO_H

//
#include <QString>
#include <QObject>
#include <QtXml>
//

#include <sys/time.h>
#include <unistd.h>

#include <cstdlib> // memcpy

//#include "logtime.h"

class Chrono : public QObject
  {
    Q_OBJECT

  public:
    Chrono( );

    void start(void);
    void stop(void);
    //void start_and_go(void);
    void start_stop(void);

    void clear(void);
    bool is_running(void);

    void reset(void);

    //void get_current_time(struct timeval * time);
    //void get_string_time(void);



    QString getStrTimeMmSsXxx(struct timeval tv); // mm:ss:xxx
    QString getStrTimeMSsXxx(struct timeval tv); //  m:ss:xxx
    //QString getStrTimeHhMm(struct timeval tv);  // hh:mm

    QString getStrCurrentLapTime(void);
    QString getStrLastLapTime(void);
    QString getStrBestLapTime(void);

    QDomElement to_node( QDomDocument &dom_doc );

    //LogTime logtime;

    static int timeval_subtract (struct timeval *result, const struct timeval *x, struct timeval *y);
    static int timeval_add (struct timeval *result, const struct timeval *x, struct timeval *y);

    void show(void);

  private:

    // Instants
    struct timeval tv_initial, tv_current, tv_interm;
    // initial = instant passage ligne
    // current = instant courant
    // interm = instant de ref temps intermediaire

    // Durées
    struct timeval current_lap_time, best_lap_time, last_lap_time, current_etap_time;

    // Ecart
    struct timeval diff_best, diff_last;

    QVector <struct timeval> t_lap;
    QVector <struct timeval> laptime;
    //QVector <QVector <struct timeval> > etaptime;

    bool running;
    struct tm * ptm;
    char time_string[15];
    long milliseconds;

    struct timeval max_lap_time(void);


    struct timeval get_current_lap_time(void);
    struct timeval get_current_etap_time(void);
    struct timeval get_last_lap_time(void);
    struct timeval get_best_lap_time(void);

    void update_last_and_best_lap_time(void);
  };
#endif
