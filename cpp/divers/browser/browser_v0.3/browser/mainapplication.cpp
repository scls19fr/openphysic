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

void MainApplication::show_slide(quint8 i)
{

}


void MainApplication::update_timer1(void)
{
  disp->next();
  //update_view();
  // ToDo double buffering (next) or triple buffering (next/previous)
  // use an other webView or differents form (with on webView)
  qDebug() << "Timer1 timeout";
  //disp->print();
}

void MainApplication::update_timer2(void)
{
  qDebug() << "Timer2 timeout";
}

MainApplication::MainApplication(int &argc, char *argv[]) : QApplication(argc, argv)
{
  /* Style */
  //QApplication::setStyle(new QPlastiqueStyle);
  //QApplication::setStyle(new QWindowsStyle);
  //QApplication::setStyle("QPushButton { color: white }");

  timer1 = new QTimer(this);
  //timer1->setInterval(1000);
  timer1->start(5000);

  connect( timer1, SIGNAL( timeout() ), this, SLOT( update_timer1() ) );

  //timer2 = new QTimer(this);
  //connect( timer2, SIGNAL( timeout() ), this, SLOT( update_timer2() ) );

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

  //N = 5;

  disp = new Display();

  SlideDefaultView * w;
  for (int i=0;i<disp->pageTotal();i++) {
    w = new SlideDefaultView(NULL, disp->arraySlide->at(i));
    //arraySDV->append(w);
    w->show();
  }

  /*
  Slide * s;
  SlideDefaultView *w;
  */

  /*
  Slide * s;
  s = new Slide();
  s->title = QString("Title of this slide 0");
  s->url = QString("http://www.google.fr?q=test0");
  s->message = QString("Message of this slide");

  SlideDefaultView * w0;
  w0 = new SlideDefaultView(NULL, s);
  w0->show();
  */

  /*
  SlideDefaultView * w1;
  s.init();
  s.title = QString("Title of this slide 1");
  s.url = QString("http://www.google.fr?q=test1");
  s.message = QString("Message of this slide");
  w1 = new SlideDefaultView(NULL, &s);
  w1->show();
  */

  /*
  SlideDefaultView * w2;
  s.init();
  w2 = new SlideDefaultView(NULL, &s);
  w2->show();
  */

  disp->print();



  DebugWindow w_debug(NULL, disp);
  //connect( &w_debug, SIGNAL(destroyed()), this, SLOT(quit()) );
  w_debug.show();

  //QVector<SlideDefaultView> w;

  //SlideDefaultView w0 = new SlideDefaultView();
  //w.append(w0);
  //SlideDefaultView w1;
  //lstSlideWindow.append(w1);
  //SlideDefaultView w2;
  //lstSlideWindow.append(w2);

  /*
  quint8 iv;

  iv = 0;

  for(int i=0 ; i<N ; i++) {
      //(&w[i])->slide = s;
      w[i].setVisible(false);
      //lstSlideWindow[i].setVisible(false);
  }

  w[iv].setVisible(true);

  iv = 1;
  w[iv].setVisible(true);
  w[iv-1].setVisible(false);

  //iv = 2;
  //w[iv].setVisible(true);
  */

  this->exec();

  /*
  delete s;
  delete w;
  delete arraySDV;
  */
}

