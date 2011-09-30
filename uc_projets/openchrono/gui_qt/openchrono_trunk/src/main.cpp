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

// Test
//#include <iostream> // cout << "Test" << endl;
//using namespace std;

#include "openchrono.h"

// Application (QT / QTopia ...)
#include <Qt>
#include <QApplication> // QT
#include <QTranslator> // i18n

//#include <qtopiaapplication> // QTopia

// Test GUI
//#include "dialogimpl.h"

// GUI
//#include "mainwinimpl.h"
//#include "aboutimpl.h"
//#include "testwinimpl.h"
//#include "messageimpl.h"
//#include "questionsimpl.h"
//
#include "data.h"
#include "logdata.h"
//#include "logtime.h"
//
//#include "ocdocument.h" // ocview ocdocument (ex ocwindows)
//#include "ocview.h"

#include "ocview_mainwin.h"
#include "ocview_reset_time.h"
#include "ocview_engine.h"
#include "ocview_about.h"
#include "ocview_pilot_name.h"
#include "ocview_plot.h"
#include "ocview_recall_laptime.h"

#include "testwinimpl.h"

#include "qaccelerometer.h"
#include "qrpmmeter.h"
#include "ticker.h"
#include "qtemperature.h"

#include "engine_state.h"


#include <QLineEdit>
#include <QPainter>
//#include <QString>

int main(int argc, char ** argv)
{
  std::cout << "Running OpenChrono" << std::endl;

  /* Application */
  OpenChrono app( argc, argv );


  /* Traduction openchrono.qrc translations/openchrono_fr_FR.qm */
  QTranslator appTranslator;
  QString strTrans = QLatin1String("openchrono_")+QLocale::system().name(); // To Fix
  //QString strTrans = QLatin1String("openchrono_fr_FR.qm");

  std::cout << ("Translation : ") << qPrintable(strTrans) << std::endl;
  //appTranslator.load(strTrans, qApp->applicationDirPath()+QLatin1String("/translations")); // sans ressource
  appTranslator.load(QLatin1String(":translations/")+strTrans); // avec ressource openchrono.qrc
  app.installTranslator(&appTranslator);


  QDateTime datetime;
  datetime = QDateTime::currentDateTime();
  //QString strFormat ="YY";
  std::cout << qPrintable(datetime.toString("yyyy-MM-dd hh:mm:ss.zzz")) << std::endl;
/* see also
file:///usr/share/qt4/doc/html/qtime.html
int QTime::restart ()
*/

/*
 QTime t, t2;
 t.start();
 t2 = t;
 //some_lengthy_task();
 qDebug("Time elapsed: %d ms", t.elapsed());
std::cout << qPrintable(t2.toString("yyyy-MM-dd hh:mm:ss.zzz")) << std::endl;
*/

/*
QTime t(0,0,0,0);
t=t.addMSecs(86400000-1);
std::cout << qPrintable(t.toString("mm:ss.zzz")) << std::endl;
*/

  //std::cout << "OpenChrono1" << std::endl;

  //Engine_State es;
  //es.show();

  //std::cout << "OpenChrono2" << std::endl;


  //QWidget win;
  //win.show();

  /* Données */
  Data myCurrentData;
  //myCurrentData = new Data();

  /* Log Data */
  LogData logdata(&myCurrentData);

  /* Log Time */
  //LogTime logtime(&myCurrentData);

  //std::cout << "OpenChrono3" << std::endl;

  /* Fenêtres de l'application */
  OCView_MainWin winMain(&myCurrentData);
  OCView_Reset_Time winResetTime(&myCurrentData);
  OCView_Engine winEngine; //(&myCurrentData);

  OCView_Pilot_Name winPilotName(&myCurrentData);
/*
  OCView_Engine_Select winEngineSelect(&myCurrentData);
  OCView_Engine_Stroke winEngineStroke(&myCurrentData);
  OCView_Engine_Reset_Time winEngineResetTime(&myCurrentData);
  OCView_Track winTrack;
  OCView_Track_Select winTrackSelect(&myCurrentData);
  OCView_Track_Name winTrackEtap(&myCurrentData);
  OCView_Track_Etap winTrackEtap(&myCurrentData);
  OCView_Track_Laps winTrackEtap(&myCurrentData);
  OCView_Recall winRecall;
  OCView_Recall_Laps winRecallLaps(&myCurrentData);
  OCView_Recall_Laps_Etaps winRecallLapsEtaps(&myCurrentData);
*/
  OCView_Recall_Laptime winRecallLaptime;

  OCView_About winAbout;
  //OCView_Plot winPlot(&LogData);


  winMain.set_parent(&winMain); /* page par defaut */
  winPilotName.is_brother_of(&winMain);
  winResetTime.is_brother_of(&winPilotName);
  //winEngine.is_brother_of(&winMain);
  winEngine.is_brother_of(&winResetTime);
    //winEngineMenu1.is_first_child_of(&winEngine);
    //winEngineMenu2.is_brother_of(&winEngineMenu1);
    //winEngineMenu2.is_last_child();

  winRecallLaptime.is_brother_of(&winEngine);
  winAbout.is_brother_of(&winRecallLaptime);
  winAbout.is_last_child();


  //winPlot.activate();

  /* Fenêtre de test */
  //TestWinImpl winTest(0, 0, &myCurrentData, &logdata);
  TestWinImpl winTest(0, 0, &myCurrentData);
  winTest.show();


  winMain.activate();

  winMain.setFocus();

  //app.connect( &winTest, SIGNAL( accepted() ), &app, SLOT( quit() ) );
  app.connect( &app, SIGNAL( lastWindowClosed() ), &app, SLOT( quit() ) );


  //QWidget accel;
  //QAccelerometer accel;
  //accel.show();

  //QRPMMeter rpm;
  //rpm.set(10000);
  //rpm.setMax(16000);
  //rpm.setMin(0);
  //rpm.show();

  //Ticker ticker("OpenChrono");
  //ticker.show();
  //QString str = "test";
  //str = QString("bla bla");
  //ticker.setText(str);

  //winTest.close();

  /* Dégradé froid-chaud */
  //QTemperature temp;
  //temp.show();

  //QLineEdit txt;
  //txt.show();

  int exit;
  exit = app.exec();

  return exit;
}

