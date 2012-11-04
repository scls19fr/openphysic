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

#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QResizeEvent>
#include <QPaintEvent>

#include "slidewidget.h"

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT
    
public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();
    QVector <SlideWidget*> *arraySlideWidget;    // list of slides (widget)
    void keyPressEvent(QKeyEvent *event);
    void paintEvent(QPaintEvent*);
    void resizeEvent (QResizeEvent*);

signals:
    void NextPressed();
    void PreviousPressed();
    void QuitPressed();
    void ReloadConfigPressed();
    void ReloadDataPressed();
    void TestPressed();
    void PausePressed();
    void AboutPressed();
    void UndefKeyPressed();

private:
    Ui::MainWindow *ui;
};

#endif // MAINWINDOW_H