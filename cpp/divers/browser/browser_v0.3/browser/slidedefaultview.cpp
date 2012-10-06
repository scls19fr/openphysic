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

#include <QDebug>

#include <QWebFrame>
#include <QKeyEvent>
#include <QDateTime>

SlideDefaultView::SlideDefaultView(QWidget *parent, Slide *slide) :
    QMainWindow(parent),
    ui(new Ui::SlideDefaultView)
{
    ui->setupUi(this);
    m_slide = slide;

    reload_slide();

    timerW = new QTimer(this);
    connect( timerW, SIGNAL( timeout() ), this, SLOT( update_timerW() ) );
}

void SlideDefaultView::showThisWindow(void) {
  timerW->start(200);
  update_timerW();
  this->show();
}

void SlideDefaultView::hideThisWindow(void) {
  timerW->stop();
  this->setVisible(false);
}

SlideDefaultView::~SlideDefaultView()
{
    delete ui;
}

void SlideDefaultView::update_timerW(void)
{
    refresh_slide();
}

void SlideDefaultView::refresh_slide(void)
{
    //this->show();
    //qDebug() << "refresh_slide" << m_slide->title;

    QString datetimeLastUpdateString = m_slide->lastupdate.toString(QString("dd/MM/yyyy hh:mm:ss"));
    QString datetimeCurrentString = QDateTime::currentDateTime().toString(QString("dd/MM/yyyy hh:mm:ss"));

    ui->lblSystem->setText(QString("MAJ: ")+datetimeLastUpdateString+QString("\tActuel: ")+datetimeCurrentString);

    //ui->lblTest->setText(QString("test"));
    ui->lblTest->setText(QString::number(m_slide->delay));

}

void SlideDefaultView::reload_slide(void)
{
    QFont font;
    font.setPointSize(32);
    font.setBold(true);
    ui->lblTitle->setFont(font);
    font.setPointSize(16);
    font.setItalic(true);
    ui->lblMessage->setFont(font);

    /*
    this->setWindowTitle(QString("Browser"));
    ui->lblTitle->setText(QString("Title"));
    ui->lblMessage->setText(QString("Message"));
    */

    this->setWindowTitle(QString("Browser"));
    ui->lblTitle->setText(this->m_slide->title);

    m_slide->lastupdate = QDateTime::currentDateTime();

    QString datetimeLastUpdateString = m_slide->lastupdate.toString(QString("dd/MM/yyyy hh:mm:ss"));
    QString datetimeCurrentString = QDateTime::currentDateTime().toString(QString("dd/MM/yyyy hh:mm:ss"));

    ui->lblMessage->setText(this->m_slide->message);
    ui->lblSystem->setText(QString("MAJ: ")+datetimeLastUpdateString+QString("\tActuel: ")+datetimeCurrentString);

    // disable vertical scrollbar
    ui->webView->page()->mainFrame()->setScrollBarPolicy(Qt::Vertical,Qt::ScrollBarAlwaysOff);
    ui->webView->page()->mainFrame()->setScrollBarPolicy(Qt::Horizontal,Qt::ScrollBarAlwaysOff);

    //ui->webView->setUrl(QUrl("http://www.google.fr"));
    //ui->webView->setZoomFactor(1.0);

    //ui->webView->setUrl(this->m_slide->url);
    ui->webView->load(this->m_slide->url);
    ui->webView->setZoomFactor(this->m_slide->zoom);

    //setWindowState(Qt::WindowFullScreen);
}

void SlideDefaultView::keyPressEvent(QKeyEvent * event)
{
  switch ( event->key() )
    {
    case Qt::Key_K: /* next */
      //nextpage();
      break;
    case Qt::Key_J: /* previous */
      //previouspage();
      break;
    case Qt::Key_Q: /* quit - just for test */
      //save();
      close();

      break;
    case Qt::Key_R: /* Reload config file - just for test */
      //reload();
      break;
    case Qt::Key_U: /* Reload URL */
      reload_slide();
      break;
    case Qt::Key_P:
      //playpause();
      break;
    case Qt::Key_T: /* just for debug */
      //test();
      break;
    default: // n'importe quelle autre touche
      qDebug() << "UNDEF KEY";
      break;
    }
}
