/*
Browser
Copyright (C) 2012  Sebastien Celles
 
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


// Application (QT / QTopia ...)
#include <Qt>
#include <QApplication> // QT

/*
  ToDo:
 
  ~/browser.xml
 
  <browser timer="">
    <url>http://...</url>
  </browser>
 
  <browser>
 
  <browser>
    <default_slide>
      <title>Default title<title>
      <url>http://...</url>
      <delay>5000</delay>
      <model></model>
    </default_slide>

    <slides>
      <slide>
        <title>Titre</title>
        <url>http://...</url>
        <delay></delay>
      </slide>

      <slide>
        <title>Titre</title>
        <url>http://...</url>
        <delay></delay>
      </slide>
    </slides>
  <browser>
 
 
  Serialization
  http://qt.onyou.ch/2010/10/19/62/
  QTextStream
  QDataStream
  QHash<QString,QVariant> options;
  http://stackoverflow.com/questions/2570679/serialization-with-qt
 
 
 
 */


//#include <qtopiaapplication> // QTopia


//#include "mainapplication.h"
#include "browser.h"

#include <iostream>

//#include <QtDBus> // ToDo : DBus for reloading config file

//#include "mainapplicationadaptor.h"

int main(int argc, char ** argv)
{
  //std::cout << "Running browser" << std::endl;

  /* Application */
  QApplication app( argc, argv );
  //MainApplication app( argc, argv );



  /* D-Bus */
  // create the MainApplication adaptor:
  //new MainApplicationAdaptor(app);

  // connect to D-Bus and register as an object:
  //QDBusConnection::sessionBus().registerObject("/MainApplication", app);


  Browser browser;
  //Browser browser_next;
  //browser.webView->setUrl(QUrl("http://www.google.fr"));
  //browser_next.webView->setUrl(QUrl("http://www.orange.fr"));

  browser.show();
  //browser.showFullScreen(); /* full screen without border */
  //browser.showMaximized(); /* full screen maximized (with border) */

  //browser_next.show();

  app.connect( &app, SIGNAL( lastWindowClosed() ), &app, SLOT( quit() ) );

  int exit;
  exit = app.exec();

  return exit;
}

