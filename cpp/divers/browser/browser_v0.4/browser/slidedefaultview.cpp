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
#include "mainapplication.h"

#include <QDebug>

#include <QWebFrame>
#include <QKeyEvent>
#include <QDateTime>

SlideDefaultView::SlideDefaultView(QWidget *parent, Slide *slide) :
    QMainWindow(parent),
    ui(new Ui::SlideDefaultView)
{
//    this->setAttribute(Qt::WA_DeleteOnClose, true); // ToFix: QMetaObject::connectSlotsByName: No matching signal for on_SlideDefaultView_destroyed()
    ui->setupUi(this);

    m_slide = slide;

    reload_slide();

    timerW = new QTimer(this);
    connect( timerW, SIGNAL( timeout() ), this, SLOT( update_timerW() ) );

}

void SlideDefaultView::showThisWindow(void) {
  timerW->start(m_slide->delay_refresh); // 200ms
  update_timerW();
  this->show();
  this->ui->centralWidget->setFocus();
//  this->ui->lblTitle->setFocus();
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

//void SlideDefaultView::resizeEvent (QResizeEvent * event ) {
//    qDebug() << "Resize";
//    ui->verticalWidget->setGeometry(ui->Ui_SlideDefaultView.);
//}

void SlideDefaultView::refresh_slide(void)
{
    //this->show();
    //qDebug() << "refresh_slide" << m_slide->title;
    ui->lblMessage->setText(this->m_slide->message);

    QString datetimeLastUpdateString = m_slide->lastupdate.toString(QString("dd/MM/yyyy hh:mm:ss"));
    QString datetimeCurrentString = QDateTime::currentDateTime().toString(QString("dd/MM/yyyy hh:mm:ss"));

    ui->lblSystem->setText(QString("MAJ: "+datetimeLastUpdateString));
    ui->lblSystem2->setText(QString("-"));
    ui->lblSystem3->setText(QString("Actuel: "+datetimeCurrentString));

    //ui->lblTest->setText(QString("test"));
    //ui->lblTest->setText(QString::number(m_slide->delay));

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

    //QString datetimeLastUpdateString = m_slide->lastupdate.toString(QString("dd/MM/yyyy hh:mm:ss"));
    //QString datetimeCurrentString = QDateTime::currentDateTime().toString(QString("dd/MM/yyyy hh:mm:ss"));

    ui->lblMessage->setText(this->m_slide->message);
    //ui->lblSystem->setText(QString("MAJ: ")+datetimeLastUpdateString+QString("\tActuel: ")+datetimeCurrentString);

    // disable vertical scrollbar
    ui->webView->page()->mainFrame()->setScrollBarPolicy(Qt::Vertical,Qt::ScrollBarAlwaysOff);
    ui->webView->page()->mainFrame()->setScrollBarPolicy(Qt::Horizontal,Qt::ScrollBarAlwaysOff);

    //ui->webView->setUrl(QUrl("http://www.google.fr"));
    //ui->webView->setZoomFactor(1.0);

    //ui->webView->setUrl(this->m_slide->url);
    ui->webView->load(this->m_slide->url);
    ui->webView->setZoomFactor(this->m_slide->zoom);

    //ui->lblLogo1->setText("");
    //ui->lblLogo2->setText("");
    //ui->lblLogo3->setText("");
    //ui->lblLogo4->setText("");
    //ui->lblLogo1->setPixmap(QPixmap("/Users/scls/aff_dyn/divers/browser/browser_v0.3/browser/logos/logo1.png"));
    //ui->lblLogo1->setPixmap(QPixmap(":/logos/logo1.png"));
    //ui->lblLogo1->pixmap()->scaledToHeight(100);
    //ui->lblLogo1->pixmap()->scaled(100,100);
    //ui->lblLogo2->setPixmap(QPixmap(":/logos/logo2.png"));
    //ui->lblLogo2->pixmap()->scaledToHeight(10);
    //ui->lblLogo3->setPixmap(QPixmap("logo3.png"));
    //ui->lblLogo4->setPixmap(QPixmap("logo4.png"));

    // set focus

    //if (this->m_display->) {
    #ifndef DEBUG
    setWindowState(Qt::WindowFullScreen);
    #endif

    //}
}

//bool SlideDefaultView::isLoaded(void)
//{
    //return(true);
    //return(ui->webView->loadFinished());
//}

void SlideDefaultView::keyPressEvent(QKeyEvent * event) // ToFix -> pass this to app
{
  switch ( event->key() )
    {
    case Qt::Key_K: /* next */
      //qDebug() << "Next";
      emit NextPressed();
      break;

    case Qt::Key_J: /* previous */
      //qDebug() << "Previous";
      emit PreviousPressed();
      break;

    case Qt::Key_Q: /* quit - just for test */
      //qDebug() << "Quit";
      emit QuitPressed();
      close();
      break;

    case Qt::Key_R: /* Reload config file - just for test */
      //qDebug() << "Reload config file";
      emit ReloadConfigPressed();
      break;

    case Qt::Key_U: /* Reload URL */
      //qDebug() << "Reload URL slide";
      emit ReloadDataPressed();
      reload_slide();
      break;

    case Qt::Key_P:
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

/*
  ToFix: QMetaObject::connectSlotsByName: No matching signal for on_SlideDefaultView_destroyed()
void SlideDefaultView::on_SlideDefaultView_destroyed()
{
    qDebug() << "Destroyed";
}
*/
