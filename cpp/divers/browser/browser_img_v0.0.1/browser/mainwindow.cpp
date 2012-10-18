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

#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QKeyEvent>
#include <QDebug>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    //arraySlideWidget = new QVector<SlideWidget *>();

    this->setStyleSheet("background-color: white;");
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::keyPressEvent(QKeyEvent * event) // ToFix -> pass this to app
{
  switch ( event->key() )
    {
    case Qt::Key_K: /* next */
      qDebug() << "Next";
      emit NextPressed();
      break;

    case Qt::Key_J: /* previous */
      qDebug() << "Previous";
      emit PreviousPressed();
      break;

    case Qt::Key_Q: /* quit - just for test */
      qDebug() << "Quit";
      emit QuitPressed();
      close();
      break;

    case Qt::Key_R: /* Reload config file - just for test */
      qDebug() << "Reload config file";
      emit ReloadConfigPressed();
      break;

    case Qt::Key_U: /* Reload URL */
      qDebug() << "Reload URL slide";
      emit ReloadDataPressed();
      //reload_slide();
      break;

    case Qt::Key_P:
      qDebug() << "Pause";
      emit PausePressed();
      break;

    case Qt::Key_T: /* just for debug */
      qDebug() << "Debug Test";
      emit TestPressed();
      break;

    default: // n'importe quelle autre touche
      qDebug() << "UNDEF KEY";
      emit UndefKeyPressed();
      break;
    }
}
