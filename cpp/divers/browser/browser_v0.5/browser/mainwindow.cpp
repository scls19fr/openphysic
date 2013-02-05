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

    //this->setStyleSheet("background-color: white;");
    //this->setStyleSheet("background-color: yellow;");

}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::keyPressEvent(QKeyEvent * event) // ToFix -> pass this to app
{
    if ( event->key()==Qt::Key_K || event->key()==Qt::Key_Right ) { // next
        qDebug() << QDateTime::currentDateTime().toString("yyyy-mm-dd hh:mm:ss") << "Next";
        emit NextPressed();

    } else if ( event->key()==Qt::Key_J || event->key()==Qt::Key_Left ) { // previous
        qDebug() << QDateTime::currentDateTime().toString("yyyy-mm-dd hh:mm:ss") << "Previous";
        emit PreviousPressed();

    } else if ( event->key()==Qt::Key_Q ) { // quit - just for test
        qDebug() << QDateTime::currentDateTime().toString("yyyy-mm-dd hh:mm:ss") << "Quit";
        emit QuitPressed();
        close();

    } else if ( event->key()==Qt::Key_C ) { // Reload config file - just for test
        qDebug() << QDateTime::currentDateTime().toString("yyyy-mm-dd hh:mm:ss") << "Reload config file";
        emit ReloadConfigPressed();

    } else if ( event->key()==Qt::Key_U ) { // Reload URL
        qDebug() << QDateTime::currentDateTime().toString("yyyy-mm-dd hh:mm:ss") << "Reload URL slide";
        emit ReloadDataPressed();
        //reload_slide();

    } else if ( event->key()==Qt::Key_P ) { // Pause
        qDebug() << QDateTime::currentDateTime().toString("yyyy-mm-dd hh:mm:ss") << "Pause";
        emit PausePressed();

    } else if ( event->key()==Qt::Key_D ) { // just for debug
        qDebug() << QDateTime::currentDateTime().toString("yyyy-mm-dd hh:mm:ss") << "Debug Test";
        emit TestPressed();

    } else if ( event->key()==Qt::Key_A ) { // about
        qDebug() << QDateTime::currentDateTime().toString("yyyy-mm-dd hh:mm:ss") << "About";
        emit AboutPressed();

    } else { // n'importe quelle autre touche
        qDebug() << QDateTime::currentDateTime().toString("yyyy-mm-dd hh:mm:ss");
        qDebug() << "UNDEF KEY" << event->key();
        qDebug() << "K : next";
        qDebug() << "J : previous";
        qDebug() << "Q : quit";
        qDebug() << "C : reload config file";
        qDebug() << "U : reload URL";
        qDebug() << "P : pause";
        qDebug() << "D : debug";
        qDebug() << "A : about";

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

