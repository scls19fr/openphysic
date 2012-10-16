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

#ifndef MAINAPPLICATION_H
#define MAINAPPLICATION_H

#include <Qt>
#include <QApplication>
#include <QNetworkProxy>

#include <QParallelAnimationGroup>

#include "slidedefaultview.h"
#include "slide.h"

//#define DEBUG
//#define WEBKIT_ENABLED // ToDo
#define CFG_FILE QLatin1String("browser.ini")
#define CFG_DIR QDir::homePath()+"/display"

class MainApplication : public QApplication
{
  Q_OBJECT

  public:
    MainApplication(int &argc, char *argv[]);
    //void keyPressEvent(QKeyEvent * event);


    quint8 page(void) const;
    quint8 pageTotal(void) const;
    bool isPlaying(void) const;

    void print(void);

    QVector <Slide*> *arraySlide;
    Slide slide_default;

    //int delayChangeSlide;
    int delayReloadData;

    #ifdef DEBUG
    void debug(void);
    #endif

  public slots:
    void update_timer1(void);
    void update_timer2(void);

    void play(void);
    void pause(void);
    void stop(void);

    void next(void);
    void previous(void);

    void load_config(void);
    void save_config(void);

  private:
    QTimer * timer1; // timer slide change
    QTimer * timer2; // timer refresh data

    void change_slide(void);

    QVector <SlideDefaultView*> *arraySDV;    // list of windows
    QDialog *wblank;

    quint8 m_page;
    quint8 m_page_previous;
    quint8 m_page_next;
    //quint8 m_N;

    //bool m_debug_mode;
    bool m_playing;
    bool m_proxy_enabled;
    QNetworkProxy m_proxy;

    bool flag_first_shot_timer1;

    QParallelAnimationGroup *group_anim_slide;

    //bool m_fullscreen;
    bool m_first_load;

};

#endif
