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

#include "display.h"
#include "slidedefaultview.h"

class MainApplication : public QApplication
{
  Q_OBJECT

  public:
    MainApplication(int &argc, char *argv[]);

  private slots:
    void update_timer1(void);
    void update_timer2(void);

  private:
    //Display * display;

    QTimer * timer1; // timer slide change
    //QTimer * timer2; // timer refresh data

    quint8 N; // nb de slides

    // list of windows

    void change_slide(void);

    Display * disp;
    QVector <SlideDefaultView*> *arraySDV;
};

#endif
