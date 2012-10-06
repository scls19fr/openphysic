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

#include "mainapplication.h"

#include "debugwindow.h"
#include "slide.h"

#include <QStyle>
#include <QPlastiqueStyle> // style
//#include <QWindowsXPStyle>

//#include <QTranslator> // i18n

#include <QDebug>


void MainApplication::change_slide(void)
{
    for (int i=0;i<disp->pageTotal();i++) {
        if (i==disp->page()) {
            arraySDV->at(i)->showThisWindow();
            timer1->setInterval(disp->arraySlide->at(i)->delay);
        }
    }

    for (int i=0;i<disp->pageTotal();i++) {
        if (i!=disp->page()) {
            arraySDV->at(i)->hideThisWindow();
        }
    }
}

void MainApplication::update_timer1(void)
{
  disp->next();
  change_slide();
  // ToDo double buffering (next) or triple buffering (next/previous)
  // use an other webView or differents form (with on webView)
  //qDebug() << "Timer1 timeout (change slide)";
  //disp->print();


}

void MainApplication::update_timer2(void)
{
  qDebug() << "Timer2 timeout (refresh data)";
  //for (int i=0;i<disp->pageTotal();i++) {
  //  arraySDV->at(i)->; // refresh
  //}

  for (int i=0;i<disp->pageTotal();i++) {
    arraySDV->at(i)->reload_slide();
  }

}

MainApplication::MainApplication(int &argc, char *argv[]) : QApplication(argc, argv)
{
  /* Style */
  //QApplication::setStyle(new QPlastiqueStyle);
  //QApplication::setStyle(new QWindowsStyle);
  //QApplication::setStyle("QPushButton { color: white }");

  timer1 = new QTimer(this);
  //timer1->setInterval(1000);
  timer1->start(1*1000);

  connect( timer1, SIGNAL( timeout() ), this, SLOT( update_timer1() ) );

  timer2 = new QTimer(this);
  timer2->start(2*60*1000);
  connect( timer2, SIGNAL( timeout() ), this, SLOT( update_timer2() ) );

  /*
    QNetworkProxy proxy;
    proxy.setType(QNetworkProxy::Socks5Proxy);
    proxy.setType(QNetworkProxy::HttpProxy);
    proxy.setHostName("proxy.example.com");
    proxy.setPort(1080);
    // proxy.setUser("username");
    // proxy.setPassword("password");
    QNetworkProxy::setApplicationProxy(proxy);
  */

  disp = new Display();

  SlideDefaultView * w;
  arraySDV = new QVector<SlideDefaultView *>();
  for (int i=0;i<disp->pageTotal();i++) {
    w = new SlideDefaultView(NULL, disp->arraySlide->at(i));
    w->refresh_slide(); // ToFix: permet de bien charger les pages au debut
    arraySDV->append(w);
  }

  //disp->print();

  //DebugWindow w_debug(NULL, this);
  //?connect( &w_debug, SIGNAL(destroyed()), this, SLOT(quit()) );
  //w_debug.show();

  if (disp->isPlaying()) {
    change_slide();
  }

  this->exec();

  /*
  delete s;
  delete w;
  delete arraySDV;
  */
}

