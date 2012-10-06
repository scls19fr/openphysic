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

#include "slidedefaultview.h"
#include "ui_slidedefaultview.h"

#include "iostream.h"
#include <QWebFrame>

SlideDefaultView::SlideDefaultView(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::SlideDefaultView)
{
    ui->setupUi(this);

    //timer->setInterval(1000);

    //timer = new QTimer(this);
    //connect( timer, SIGNAL( timeout() ), this, SLOT( update() ) );


    QFont font;
    font.setPointSize(32);
    font.setBold(true);
    ui->lblTitle->setFont(font);
    font.setPointSize(16);
    font.setItalic(true);
    ui->lblMessage->setFont(font);


    this->setWindowTitle(QString("Browser"));
    ui->lblTitle->setText(QString("Title"));
    //ui->lblTitle->setText(this->slide->message);
    ui->lblMessage->setText(QString("Message"));

    // disable vertical scrollbar
    ui->webView->page()->mainFrame()->setScrollBarPolicy(Qt::Vertical,Qt::ScrollBarAlwaysOff);
    ui->webView->page()->mainFrame()->setScrollBarPolicy(Qt::Horizontal,Qt::ScrollBarAlwaysOff);

    ui->webView->setUrl(QUrl("http://www.google.fr"));
    ui->webView->setZoomFactor(1.0);

    //this->setWindowState(Qt::WindowFullScreen);
}

SlideDefaultView::~SlideDefaultView()
{
    delete ui;
}
