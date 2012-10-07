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

#ifndef SLIDEDEFAULTVIEW_H
#define SLIDEDEFAULTVIEW_H

#include <QMainWindow>

#include "slide.h"
#include <QTimer>

namespace Ui {
class SlideDefaultView;
}

class SlideDefaultView : public QMainWindow
{
    Q_OBJECT
    
public:
    explicit SlideDefaultView(QWidget *parent = 0, Slide * slide = 0);
    ~SlideDefaultView();

    void keyPressEvent(QKeyEvent *event);

    void showThisWindow(void);
    void hideThisWindow(void);
    //bool isLoaded(void);

signals:
    void NextPressed();
    void PreviousPressed();

public slots:
    void reload_slide(void); // load data (long)
    void refresh_slide(void); // show + update date (short)
    void update_timerW(void);

    //void resizeEvent (QResizeEvent * event );

private:
    Ui::SlideDefaultView *ui;
    Slide * m_slide;

    QTimer * timerW;

};

#endif // SLIDEDEFAULTVIEW_H
