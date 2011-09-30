/*
Browser
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

#include "mainapplication.h"

#include <QStyle>
#include <QPlastiqueStyle> // style
//#include <QWindowsXPStyle>

//#include <QTranslator> // i18n

#include <iostream> // std::cout

#include "browser.h"

MainApplication::MainApplication(int &argc, char *argv[]) : QApplication(argc, argv)
{
  /* Style */
  QApplication::setStyle(new QPlastiqueStyle);

  //QApplication::setStyle(new QWindowsStyle); 
  //QApplication::setStyle("QPushButton { color: white }");

  /* Traduction openchrono.qrc translations/openchrono_fr_FR.qm */
  /*
  QTranslator appTranslator;
  QString strTrans = QLatin1String("browser_")+QLocale::system().name();
  std::cout << ("Translation : ") << qPrintable(strTrans) << std::endl;
  //appTranslator.load(strTrans, qApp->applicationDirPath()+QLatin1String("/translations")); // sans ressource
  appTranslator.load(QLatin1String(":translations/")+strTrans); // avec ressource browser.qrc
  app.installTranslator(&appTranslator);
  */

/*
  Browser browser;
  //Browser browser_next;
  //browser.webView->setUrl(QUrl("http://www.google.fr"));
  //browser_next.webView->setUrl(QUrl("http://www.orange.fr"));

  browser.show();
  //browser.showFullScreen();

  //browser_next.show();
*/
}

