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

#include "slidewidget.h"
#include "ui_slidewidget.h"

#include <QDebug>
#include <QPainter>

//#include <QPropertyAnimation>

SlideWidget::SlideWidget(QWidget *parent, Slide *slide) :
    QWidget(parent),
    ui(new Ui::SlideWidget)
{
    ui->setupUi(this);

    m_slide = slide;

    if (m_slide==0) {
        qDebug() << "Error: slide pointer not initialized";
        return;
    }

    reload_slide();

    timerW = new QTimer(this);
    timerW->setInterval(slide->delay_refresh);
    timerW->start();
    connect( timerW, SIGNAL( timeout() ), this, SLOT( refresh_slide() ) );

    //this->setStyleSheet("background-color: green;");

    this->reload_slide();

}

SlideWidget::~SlideWidget()
{
    delete ui;
}

void SlideWidget::refresh_slide(void)
{
    //qDebug() << "refresh_slide" << m_slide->title;

    //ui->lblMessage->setText(this->m_slide->getMessage());
    //ui->marqueeLabel->setText(this->m_slide->getMessage());
    ui->textBrowser->setText(this->m_slide->getMessage());


    //QString datetimeLastUpdateString = m_slide->lastupdate.toString(QString("dd/MM/yyyy hh:mm:ss"));
    QString datetimeCurrentString = QDateTime::currentDateTime().toString(QString("dd/MM/yyyy hh:mm:ss"));

    //ui->lblSystem->setText(QString("MAJ: "+datetimeLastUpdateString));
    //ui->lblSystem->setText(QString(""));
    //ui->lblSystem2->setText(QString("-"));
    //ui->lblSystem2->setText(QString(""));
    //ui->lblSystem3->setText(QString("Actuel: "+datetimeCurrentString));
    ui->lblCurrentTime->setText(QString(datetimeCurrentString));

    //ui->lblTest->setText(QString("test"));
    //ui->lblTest->setText(QString::number(m_slide->delay));

}

void SlideWidget::reload_slide(void)
{
    QFont font_lblTitle;
    font_lblTitle.setPointSize(32);
    font_lblTitle.setBold(true);
    ui->lblTitle->setFont(font_lblTitle);

    /*
    QFont font_lblMessage;
    font_lblMessage.setPointSize(16);
    font_lblMessage.setItalic(true);
    ui->lblMessage->setFont(font_lblMessage);
    */

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

    this->m_slide->load_message();
    //ui->lblMessage->setText(this->m_slide->getMessage());

    QFont font_textBrowser;
    font_textBrowser.setPointSize(16);
    ui->textBrowser->setFont(font_textBrowser);
    ui->textBrowser->setText(this->m_slide->getMessage());

    /*
    QFont font_marqueeLabel;
    font_marqueeLabel.setPointSize(16);
    ui->marqueeLabel->setFont(font_marqueeLabel);
    ui->marqueeLabel->setText(this->m_slide->getMessage());
    */

    //ui->lblSystem->setText(QString("MAJ: ")+datetimeLastUpdateString+QString("\tActuel: ")+datetimeCurrentString);

    // disable vertical scrollbar
    //ui->webView->page()->mainFrame()->setScrollBarPolicy(Qt::Vertical,Qt::ScrollBarAlwaysOff);
    //ui->webView->page()->mainFrame()->setScrollBarPolicy(Qt::Horizontal,Qt::ScrollBarAlwaysOff);

    //ui->webView->setUrl(QUrl("http://www.google.fr"));
    //ui->webView->setZoomFactor(1.0);

    qDebug() << "Loading URL" << this->m_slide->url;
    //ui->webView->setUrl(this->m_slide->url);
    ui->webView->load(this->m_slide->url);
    ui->webView->setZoomFactor(this->m_slide->zoom);

    // ToFix: scale
    //qDebug() << this->m_slide->url;
    //QPixmap pm(this->m_slide->url);
    //QPixmap pm;
    //pm.load(this->m_slide->url);
    //pm = pm.scaledToWidth(ui->labelView->geometry().width());
    //pm = pm.scaledToHeight(ui->labelView->geometry().height());
    //pm = pm.scaled(ui->labelView->geometry().size(), Qt::KeepAspectRatio, Qt::SmoothTransformation);
    //ui->labelView->setPixmap(pm);
    //ui->labelView->pixmap.scaledToHeight()
    //ui->labelView->pixmap()->scaled(ui->labelView->size(), Qt::KeepAspectRatio);

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

void SlideWidget::show_slide(void)
{
    this->setVisible(true);
}

void SlideWidget::hide_slide(void)
{
    this->setVisible(false);
}

