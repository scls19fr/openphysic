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

//#include <QStyle>
//#include <QPlastiqueStyle> // style
//#include <QWindowsXPStyle>
//#include <QThread>

//#include <QTranslator> // i18n

#include <QDebug>

#include <QSettings>
#include <QFile>
#include <QDir>
#include <QMessageBox>
#include <QPropertyAnimation>

MainApplication::MainApplication(int &argc, char *argv[]) : QApplication(argc, argv)
{
  /* Style */
  //QApplication::setStyle(new QPlastiqueStyle);
  //QApplication::setStyle(new QWindowsStyle);
  //QApplication::setStyle("QPushButton { color: white }");



  m_first_load = true;

  m_playing = true;
  m_page = 0;
  flag_first_shot_timer1 = true;

  delayReloadData = 5*60*1000; // reload data

  //m_fullscreen = true;
  #ifdef DEBUG
  DebugWindow w_debug(NULL, this);
  w_debug.show();

  /*
  QPropertyAnimation animation(&w_debug, "geometry");
  animation.setDuration(3000);
  animation.setStartValue(QRect(500, 500, w_debug.geometry().width(), w_debug.geometry().height()));
  animation.setEndValue(QRect(0, 0, w_debug.geometry().width(), w_debug.geometry().height()));
  animation.setEasingCurve(QEasingCurve::OutBounce);
  animation.start();
  */

  #endif

  arraySDV = new QVector<SlideDefaultView *>();
  //arraySlide = new QVector<Slide *>();

  load_config();

  timer1 = new QTimer(this);
  //timer1->setInterval(1000);
  timer1->start(slide_default.delay);
  connect( timer1, SIGNAL( timeout() ), this, SLOT( update_timer1() ) );

  timer2 = new QTimer(this);
  timer2->start(delayReloadData);
  connect( timer2, SIGNAL( timeout() ), this, SLOT( update_timer2() ) );

  this->exec();

}

void MainApplication::change_slide(void)
{
    SlideDefaultView *w_current;
    SlideDefaultView *w_previous;
    SlideDefaultView *w_next; // ?
    w_next = arraySDV->at(m_page_next); // ?
    w_current = arraySDV->at(m_page);
    w_previous = arraySDV->at(m_page_previous);
    //qDebug()<< "previous:" <<m_page_previous << " page=" << m_page << " next=" << m_page_next;

    timer1->setInterval(arraySlide->at(m_page)->delay); // useful if slides doesn't have same delay

    group_anim_slide = new QParallelAnimationGroup;
    QPropertyAnimation *anim_slide_current;
    QPropertyAnimation *anim_slide_previous;
    QPropertyAnimation *anim_slide_next;

    switch (slide_default.transition_type) {
        case 1: {   // opacity
            anim_slide_current = new QPropertyAnimation(w_current, "windowOpacity");
            anim_slide_current->setDuration(slide_default.transition_duration);
            anim_slide_current->setStartValue(0.0);
            anim_slide_current->setEndValue(1.0);
            anim_slide_current->setEasingCurve(QEasingCurve::Linear);

            anim_slide_previous = new QPropertyAnimation(w_previous, "windowOpacity");
            anim_slide_previous->setDuration(slide_default.transition_duration);
            anim_slide_previous->setStartValue(1.0);
            anim_slide_previous->setEndValue(0.0);
            anim_slide_previous->setEasingCurve(QEasingCurve::Linear);

            group_anim_slide->addAnimation(anim_slide_current);
            group_anim_slide->addAnimation(anim_slide_previous);
            group_anim_slide->start();
            break;
        }
        case 2: {   // scroll
            #ifdef DEBUG
            QRect geom_preenter = QRect(500+2*w_current->geometry().width(), 250, w_current->geometry().width(), w_current->geometry().height());
            QRect geom_enter = QRect(500+w_current->geometry().width(), 250, w_current->geometry().width(), w_current->geometry().height());
            QRect geom_view  = QRect(500, 250, w_current->geometry().width(), w_current->geometry().height());
            QRect geom_exit  = QRect(500-w_current->geometry().width(), 250, w_current->geometry().width(), w_current->geometry().height());
            #else
            QRect geom_preenter = QRect(2*w_current->geometry().width(), 0, w_current->geometry().width(), w_current->geometry().height());
            QRect geom_enter = QRect(w_current->geometry().width(), 0, w_current->geometry().width(), w_current->geometry().height());
            QRect geom_view  = QRect(0, 0, w_current->geometry().width(), w_current->geometry().height());
            QRect geom_exit  = QRect(-w_current->geometry().width(), 0, w_current->geometry().width(), w_current->geometry().height());
            #endif

            if (pageTotal()>=3) {
                anim_slide_next = new QPropertyAnimation(w_next, "geometry");
                anim_slide_next->setDuration(slide_default.transition_duration);
                anim_slide_next->setStartValue(geom_preenter);
                anim_slide_next->setEndValue(geom_enter);
                //anim_slide_next->setEasingCurve(QEasingCurve::Linear);
                anim_slide_next->setEasingCurve(QEasingCurve::OutElastic); // OutElastic  OutBounce
            }

            anim_slide_current = new QPropertyAnimation(w_current, "geometry");
            anim_slide_current->setDuration(slide_default.transition_duration);
            anim_slide_current->setStartValue(geom_enter);
            anim_slide_current->setEndValue(geom_view);
            //anim_slide_current->setEasingCurve(QEasingCurve::Linear);
            anim_slide_current->setEasingCurve(QEasingCurve::OutElastic); // OutElastic  OutBounce

            anim_slide_previous = new QPropertyAnimation(w_previous, "geometry");
            anim_slide_previous->setDuration(slide_default.transition_duration);
            anim_slide_previous->setStartValue(geom_view);
            anim_slide_previous->setEndValue(geom_exit);
            //anim_slide_previous->setEasingCurve(QEasingCurve::Linear);
            anim_slide_previous->setEasingCurve(QEasingCurve::OutElastic);

            group_anim_slide->addAnimation(anim_slide_current);
            group_anim_slide->addAnimation(anim_slide_previous);
            if (pageTotal()>=3) {
                group_anim_slide->addAnimation(anim_slide_next);
            }
            group_anim_slide->start();

            break;
        }
        default: {  // no transition
            w_previous->hideThisWindow();
            break;
        }
    }

    w_current->showThisWindow();
}

void MainApplication::update_timer1(void)
{
    if (flag_first_shot_timer1) {
        flag_first_shot_timer1 = false;
        for (int i=0;i<pageTotal();i++) {
            if (i!=page()) {
                arraySDV->at(i)->hideThisWindow();
            }
        }
        next();
    } else {
        next();
    }
  //timer1->reset ?
  //setSingleShot(true)

  // ToDo double buffering (next) or triple buffering (next/previous)
  // use an other webView or differents form (with on webView)
  //qDebug() << "Timer1 timeout (change slide)";
  //print();
}

void MainApplication::update_timer2(void)
{
  qDebug() << "Timer2 timeout (refresh data)";
  //for (int i=0;i<pageTotal();i++) {
  //  arraySDV->at(i)->; // refresh
  //}

  for (int i=0;i<pageTotal();i++) {
    arraySDV->at(i)->reload_slide();
  }

}

void MainApplication::play(void)
{
  m_playing = true;
  //reset_timer();
  connect( timer1, SIGNAL( timeout() ), this, SLOT( update_timer1() ) );
}

void MainApplication::stop(void)
{
  m_playing = false;
  //reset_timer();
  timer1->disconnect(this, 0);
}

void MainApplication::pause(void)
{
  m_playing = !m_playing;
  //reset_timer();
  if (m_playing) {
    connect( timer1, SIGNAL( timeout() ), this, SLOT( update_timer1() ) );
  } else {
    timer1->disconnect(this, 0);
  }
}

void MainApplication::next(void)
{
  //qDebug() << "next";
  m_page_previous = m_page;
  m_page = (m_page+1) % pageTotal();
  m_page_next = (m_page_previous+2) % pageTotal();

  //qDebug()<< "MainApplication::next / previous:" <<m_page_previous << " page=" << m_page << " next=" << m_page_next;

  change_slide();
}

void MainApplication::previous(void)
{
  m_page_previous = m_page;
  m_page = (m_page+pageTotal()-1) % pageTotal();
  m_page_next = (m_page_previous+pageTotal()-2) % pageTotal();;

  //qDebug()<< "MainApplication::previous / previous:" <<m_page_previous << " page=" << m_page << " next=" << m_page_next;

  change_slide();
}

quint8 MainApplication::page(void) const
{
   return m_page;
}

quint8 MainApplication::pageTotal(void) const
{
//   return m_N;
   return arraySlide->count();
}

bool MainApplication::isPlaying(void) const
{
   return m_playing;
}

void MainApplication::print(void)
{
    qDebug() << "page/N =" << m_page+1 << "/" << pageTotal();

    for (int i=0;i<pageTotal();i++) {
        qDebug() << i << ":" << arraySlide->at(i)->title;
    }
}

void MainApplication::load_config(void)
{
    arraySlide = new QVector<Slide *>();

    QString msg;
    //QFile file( CFG_FILE );
    //QDir::setCurrent( CFG_DIR );
    //int m_attribut;
    //m_attribut = settings.value("nomDuParametre").toInt();
    //qDebug()<<m_attribut;

    // ToDo test if settings exists ?
    // ToDo default value

    if( !QFile::exists(CFG_DIR+"/"+CFG_FILE) ) // config file doesn't exist
    {
        //file.open( QIODevice::ReadOnly );
        msg = QObject::tr("Error: can't open configuration file \"")
            + CFG_FILE + "\" in \"" + CFG_DIR + "\" directory!\n"
            + QObject::tr(
                "This is probably the first time\n"
                "you run this application.\n"
                "So just click ok.\n"
                "Next time, this message shouldn't appear.\n"
            );
        qDebug() << msg;
        QMessageBox::warning(0,
            QObject::tr("Loading config file"),
            msg
        );

        Slide *s;
        s = new Slide();

        s->title = QString("Title of this slide 0");
        s->url = QString("C:/Documents and Settings/scelles/display_img/img/slide0.gif");
        // Mac OS /Users/scls/display_img/img/slide0.gif
        // Linux /home/scls/display_img/img/slide0.gif
        //s->message = QString("Message of slide 0");
        s->setMessage(QString("Lorem ipsum dolor sit amet, consectetur adipiscing elit. (slide 0) Sed non risus. (slide 0) Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. (slide 0) Cras elementum ultrices diam. (slide 0) Maecenas ligula massa, varius a, semper congue, euismod non, mi. (slide 0) Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. (slide 0) Duis semper. (slide 0) Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. (slide 0) Pellentesque congue. (slide 0)"));
        s->message_file = QString("C:/Documents and Settings/scelles/display_img/messages/slide0.txt");
        //s->delay = 2000;
        arraySlide->append(s);

        s = new Slide();
        s->title = QString("Title of this slide 1");
        s->url = QString("C:/Documents and Settings/scelles/display_img/img/slide1.gif");
        //s->message = QString("Message of slide 1");
        s->setMessage(QString("Lorem ipsum dolor sit amet, consectetur adipiscing elit. (slide 1) Sed non risus. (slide 1) Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. (slide 1) Cras elementum ultrices diam. (slide 1) Maecenas ligula massa, varius a, semper congue, euismod non, mi. (slide 1) Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. (slide 1) Duis semper. (slide 1) Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. (slide 1) Pellentesque congue. (slide 1)"));
        s->message_file = QString("C:/Documents and Settings/scelles/display_img/messages/slide1.txt");
        //s->delay = 3000;
        arraySlide->append(s);

        s = new Slide();
        s->title = QString("Title of this slide 2");
        s->url = QString("C:/Documents and Settings/scelles/display_img/img/slide2.gif");
        //s->message = QString("Message of slide 2");
        s->setMessage(QString("Lorem ipsum dolor sit amet, consectetur adipiscing elit. (slide 2) Sed non risus. (slide 2) Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. (slide 2) Cras elementum ultrices diam. (slide 2) Maecenas ligula massa, varius a, semper congue, euismod non, mi. (slide 2) Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. (slide 2) Duis semper. (slide 2) Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. (slide 2) Pellentesque congue. (slide 2)"));
        s->message_file = QString("C:/Documents and Settings/scelles/display_img/messages/slide2.txt");
        //s->delay = 4000;
        arraySlide->append(s);


        save_config(); // create a new config file with default keys/values

     } else { // config file exists = loading this config file
        msg = QObject::tr("Loading configuration file from \"") + CFG_FILE + "\" in \"" + CFG_DIR + "\" directory";
        qDebug() << msg;
        qDebug() << "if bug occurs, remove config file";

        QSettings settings(CFG_DIR+"/"+CFG_FILE, QSettings::IniFormat);

        settings.beginGroup("config");
        this->m_playing = settings.value("playing", this->m_playing).toBool();
        if (m_first_load) {
            this->m_page = settings.value("page", this->m_page).toUInt();
        }
        this->delayReloadData = settings.value("delayReloadData", this->delayReloadData).toUInt();
        settings.endGroup();


        settings.beginGroup("slide_default");
        slide_default.title = settings.value("title", slide_default.title).toString();
        slide_default.url = settings.value("url", slide_default.url).toString();
        slide_default.message_file = settings.value("message_file", slide_default.message_file).toString();
        slide_default.setMessage(settings.value("message", slide_default.getMessage()).toString());
        slide_default.delay = settings.value("delay", slide_default.delay).toUInt();
        slide_default.transition_type = settings.value("transition_type", slide_default.transition_type).toUInt();
        slide_default.transition_duration = settings.value("transition_duration", slide_default.transition_duration).toUInt();
        slide_default.zoom = settings.value("zoom", slide_default.zoom).toReal();
        settings.endGroup();

        settings.beginGroup("slides");
        QString show_slides;
        show_slides = settings.value("show_slides", "").toString();
        //qDebug() << show_slides;
        QStringList list;
        list = show_slides.split(",");
        //qDebug() << list;

        QStringList::Iterator stlIter;
        Slide *s;
        for( stlIter = list.begin(); stlIter != list.end(); ++stlIter ) {
            //qDebug() << (*stlIter);
            s = new Slide();
            settings.beginGroup((*stlIter));
            s->title = settings.value("title", slide_default.title).toString();
            s->url = settings.value("url", slide_default.url).toString();
            s->message_file = settings.value("message_file", slide_default.message_file).toString();
            s->setMessage(settings.value("message", slide_default.getMessage()).toString());
            s->delay = settings.value("delay", slide_default.delay).toUInt();
            s->zoom = settings.value("zoom", slide_default.zoom).toReal();
            settings.endGroup();
            arraySlide->append(s);
        }
        settings.endGroup();
     }

     //file.close();
    if (pageTotal()<=0) {
        qDebug() << "Config file error - delete config";
        QFile::copy(CFG_DIR+"/"+CFG_FILE, CFG_DIR+"/"+CFG_FILE+"."+QDateTime::currentDateTime().toString(QString("yyyy-MM-dd_hh-mm-ss"))+".bak");
        QFile::remove(CFG_DIR+"/"+CFG_FILE);
        load_config();
        return;
    }

    for (int i=0;i<arraySDV->size();i++) {
        delete arraySDV->at(i);
    }
    delete arraySDV;

    SlideDefaultView * w;
    arraySDV = new QVector<SlideDefaultView *>();
    for (int i=0;i<pageTotal();i++) {
      w = new SlideDefaultView(NULL, arraySlide->at(i));
      arraySDV->append(w);
      connect(w, SIGNAL( QuitPressed() ), this, SLOT( quit() ));
      connect(w, SIGNAL( NextPressed() ), this, SLOT( next() ));
      connect(w, SIGNAL( PreviousPressed() ), this, SLOT( previous() ));
      connect(w, SIGNAL( ReloadDataPressed() ), this, SLOT( update_timer2() ));
      connect(w, SIGNAL( ReloadConfigPressed() ), this, SLOT( load_config() ));
      //connect(w, SIGNAL( destroyed() ), this, SLOT( quit() ));
    }

    if (m_first_load) {
        wblank = new QDialog(NULL, 0);
    }
    wblank->setStyleSheet("background-color: white;");
    #ifdef DEBUG
    //wblank->setGeometry(arraySDV->at(0)->geometry()); // QRect(100,200,1000,500)
    //wblank->show();
    #else
    //wblank->setWindowState(Qt::WindowMaximized);
    wblank->setWindowState(Qt::WindowFullScreen);
    wblank->show();
    #endif

    main_win = new MainWindow(0);
    main_win->show();
    //main_win->ad

    /*
    for (int i=pageTotal()-1;i>=0;i--) {
        if (i!=m_page) {
            arraySDV->at(i)->showThisWindow(); // ToFix: permet de bien charger les pages au debut
        }
    }

    arraySDV->at(m_page)->showThisWindow();
    */

    if (m_first_load) {
        m_first_load = false;
    }
}

void MainApplication::save_config(void)
{
    qDebug() << "Save config";

    QSettings settings(CFG_DIR+"/"+CFG_FILE, QSettings::IniFormat);

    settings.beginGroup("config");
    settings.setValue("playing", this->m_playing);
    settings.setValue("page", this->m_page);
//    settings.setValue("delayRefreshSlide", ...); // 200ms
//    settings.setValue("delayChangeSlide", ...); // 5s = 5*60
    settings.setValue("delayReloadData", this->delayReloadData);
    settings.endGroup();


    settings.beginGroup("slide_default");
    settings.setValue("title", slide_default.title);
    settings.setValue("url", slide_default.url);
    settings.setValue("message_file", slide_default.message_file);
    settings.setValue("message", slide_default.getMessage());
    settings.setValue("delay", slide_default.delay);
    settings.setValue("transition_type", slide_default.transition_type);
    settings.setValue("transition_duration", slide_default.transition_duration);
    settings.setValue("zoom", slide_default.zoom);
    settings.endGroup();

    settings.beginGroup("slides");

    QString show_slides = "";
    for (int i=0;i<this->pageTotal();i++) {
        if (i!=pageTotal()-1) {
            show_slides += QString::number(i) + ",";
        } else {
            show_slides += QString::number(i);
        }
    }
    settings.setValue("show_slides", show_slides);

    for (int i=0;i<this->pageTotal();i++) {
        settings.beginGroup(QString::number(i));
        settings.setValue("title", arraySlide->at(i)->title);
        settings.setValue("url", arraySlide->at(i)->url);
        settings.setValue("message_file", arraySlide->at(i)->message_file);
        settings.setValue("message", arraySlide->at(i)->getMessage());
        //qDebug()<< arraySlide->at(i)->getMessage(); // ToFix
        settings.setValue("delay", arraySlide->at(i)->delay);
        settings.setValue("zoom", arraySlide->at(i)->zoom);
        settings.endGroup();
    }

    settings.endGroup();
}

#ifdef DEBUG
void MainApplication::debug(void) {
    qDebug() << "Debug MainApplication";
}
#endif
