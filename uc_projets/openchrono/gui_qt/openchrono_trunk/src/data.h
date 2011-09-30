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

#ifndef DATA_H
#define DATA_H

//
#include <QObject>
//

#include "chrono.h"
#include "track.h"
#include "position.h"
#include "pilot.h"
#include "vehicule.h"

//#include "logdata.h"
#include "logtime.h"

#include <iostream> // ForTest std::cout << "Test" << std::endl;

class Data : public QObject
  {
    Q_OBJECT

  public:
    Data();
    virtual ~Data();

    Track track;

    Position position;

    Pilot pilot;
    Vehicule vehicule;

    Chrono chrono;

    //LogData logdata;
    LogTime logtime;


    // Alarms / message ToDo
    // Log des données mesurees
    // Log des temps (interm et tour)

    // Speed (calculée avec diametre couronne et RPM)
    // Speed (mesurée avec impulsion sur roue avant)
    // Accelerometre (accélération longitudinal / accélération latérale)

  public slots:
    void start(void);

    void reset(void);

    void on_starting_first_lap(void);
    void on_new_etap(void);
    void on_new_lap(void);
    void on_last_lap(void);
    void on_race_over(void);

    void load(void);
    void save(void);

    void test(void);

  signals:
    void starting_first_lap(void);
    void is_new_etap(void);
    void is_new_lap(void);
    void is_last_lap(void);
    void race_is_over(void);

  private:

  };

#define OC_CFG_FILE QLatin1String("openchrono.xml") // ".openchrono.xml" or "openchrono.xml"
#define OC_CFG_DIR QDir::homePath()


#endif
