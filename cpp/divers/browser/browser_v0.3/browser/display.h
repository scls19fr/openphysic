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

#ifndef DISPLAY_H
#define DISPLAY_H

#include <QObject>

#include "slide.h"
#include <QNetworkProxy>

class Display : public QObject
{
    Q_OBJECT
public:
    explicit Display(QObject *parent = 0);

    void play(void);
    void pause(void);
    void playpause(void);

    void next(void);
    void previous(void);

    quint8 page(void) const;
    quint8 pageTotal(void) const;
    bool isPlaying(void) const;

    void load_config(void);
    void save_config(void);

    void print(void);

    QVector <Slide*> *arraySlide;
    const Slide slide_default;

    //int delayChangeSlide;
    int delayReloadData;

signals:
    
public slots:

private:
    quint8 m_page;
    //quint8 m_N;

    bool m_playing;
    bool m_proxy_enabled;
    QNetworkProxy m_proxy;

    //bool m_fullscreen;


};

#endif // DISPLAY_H
