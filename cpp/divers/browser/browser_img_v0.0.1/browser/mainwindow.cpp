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
    if ( event->key()==Qt::Key_K || event->key()==Qt::Key_Right ) { // next
        qDebug() << "Next";
        emit NextPressed();

    } else if ( event->key()==Qt::Key_J || event->key()==Qt::Key_Left ) { // previous
        qDebug() << "Previous";
        emit PreviousPressed();

    } else if ( event->key()==Qt::Key_Q ) { // quit - just for test
        qDebug() << "Quit";
        emit QuitPressed();
        close();

    } else if ( event->key()==Qt::Key_T ) { // Reload config file - just for test
        qDebug() << "Reload config file";
        emit ReloadConfigPressed();

    } else if ( event->key()==Qt::Key_U ) { // Reload URL
        qDebug() << "Reload URL slide";
        emit ReloadDataPressed();
        //reload_slide();

    } else if ( event->key()==Qt::Key_P ) { // Pause
        qDebug() << "Pause";
        emit PausePressed();

    } else if ( event->key()==Qt::Key_T ) { // just for debug
        qDebug() << "Debug Test";
        emit TestPressed();

    } else if ( event->key()==Qt::Key_A ) { // about
        qDebug() << "About";
        emit AboutPressed();

    } else { // n'importe quelle autre touche
        qDebug() << "UNDEF KEY" << event->key();
        //event->key()
        emit UndefKeyPressed();

    }

}

void MainWindow::paintEvent(QPaintEvent *) {
    //qDebug() << "paint main_win";
}

void MainWindow::resizeEvent (QResizeEvent*) {
    //qDebug() << "resize main_win";
    //this->arraySlideWidget->at(0)->setGeometry(0,0,this->geometry().width(),this->geometry().height());
    //this->arraySlideWidget->at(1)->setGeometry(0,0,this->geometry().width(),this->geometry().height());
    //this->arraySlideWidget->at(2)->setGeometry(0,0,this->geometry().width(),this->geometry().height());

    for (int i=0;i<this->arraySlideWidget->count();i++) {
        this->arraySlideWidget->at(i)->setGeometry(0,0,this->geometry().width(),this->geometry().height());
    }

}

