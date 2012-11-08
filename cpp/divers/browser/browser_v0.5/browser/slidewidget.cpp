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
#include <QWebFrame>

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

    page = new QWebPage();
    connect(
      page->networkAccessManager(), SIGNAL(finished(QNetworkReply *)),
      this, SLOT(httpResponseFinished(QNetworkReply *))
    );

    reload_slide();

    timerW = new QTimer(this);
    timerW->setInterval(slide->delay_refresh);
    timerW->start();
    connect( timerW, SIGNAL( timeout() ), this, SLOT( refresh_slide() ) );

    //this->setStyleSheet("background-color: green;");

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


    QDateTime dt = QDateTime::currentDateTime();

    QFont font_lblCurrentTime;
    font_lblCurrentTime.setPointSize(28);
    //font_lblTitle.setBold(true);
    ui->lblCurrentTime->setFont(font_lblCurrentTime);

    //QString datetimeLastUpdateString = m_slide->lastupdate.toString(QString("dd/MM/yyyy hh:mm:ss"));
    //QString datetimeCurrentString = QDateTime::currentDateTime().toString(QString("dd/MM/yyyy hh:mm:ss"));
    QString timeCurrentString = dt.toString(QString("hh:mm:ss"));

    //QString days[8];
    //days[0] = "undef";
    //days[1] = "lu";
    //days[2] = "ma";
    //days[3] = "me";
    //days[4] = "je";
    //days[5] = "ve";
    //days[6] = "sa";
    //days[7] = "di";

    //days[8] = {"", "Lu", "Ma", "Me", "Je", "Ve", "Sa", "Di"};

    //ui->lblSystem->setText(QString("MAJ: "+datetimeLastUpdateString));
    //ui->lblSystem->setText(QString(""));
    //ui->lblSystem2->setText(QString("-"));
    //ui->lblSystem2->setText(QString(""));
    //ui->lblSystem3->setText(QString("Actuel: "+datetimeCurrentString));
    ui->lblCurrentTime->setText(timeCurrentString);
    //QString dateCurrentString = days[dt.date().dayOfWeek()] + " " + dt.toString(QString("dd/MM/yyyy"));
    QString dateCurrentString = dt.toString(QString("ddd dd MMM yyyy"));

    //qDebug() << QLocale::system().French;


    QFont font_lblCurrentDate;
    font_lblCurrentDate.setPointSize(28);
    ui->lblCurrentDate->setFont(font_lblCurrentDate);
    ui->lblCurrentDate->setText(dateCurrentString);


    //ui->lblTest->setText(QString("test"));
    //ui->lblTest->setText(QString::number(m_slide->delay));

}

void SlideWidget::reload_slide(void)
{
    QFont font_lblTitle;
    font_lblTitle.setPointSize(28);
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

    qDebug() << "Loading URL" << this->m_slide->url << "for " << this->m_slide->title;
    //ui->webView->load(this->m_slide->url);
    //ui->webView->setZoomFactor(this->m_slide->zoom);

    page->mainFrame()->load(QUrl(this->m_slide->url));;
    ui->webView->setZoomFactor(this->m_slide->zoom);
    //ui->webView->setPage(page);

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
    this->m_slide->load_message();
    ui->textBrowser->setText(this->m_slide->getMessage());

    this->setVisible(true);
}

void SlideWidget::hide_slide(void)
{
    this->setVisible(false);
}

void SlideWidget::httpResponseFinished(QNetworkReply * reply)
{
    switch (reply->error())
    {
        case QNetworkReply::NoError:
            //qDebug() << "httpResponseFinished without any error";
            // http://doc.qt.digia.com/qt/qnetworkreply.html
            //no error condition. Note: When the HTTP protocol returns a redirect no error will be reported.
            //You can check if there is a redirect with the QNetworkRequest::RedirectionTargetAttribute attribute.

            // HTTP Status Code
            // 200 OK
            // 302 redirect

            if (reply->attribute(QNetworkRequest::HttpStatusCodeAttribute).toInt()==200) {
                ui->webView->setPage(page);
            }
            break;
        /*
        case QNetworkReply::ContentNotFoundError:
            // 404 Not found
            //failedUrl = reply->request.url();
            //httpStatus = reply->attribute(
            //QNetworkRequest::HttpStatusCodeAttribute).toInt();
            //httpStatusMessage = reply->attribute(
            //QNetworkRequest::HttpReasonPhraseAttribute).toByteArray();
            //break;
        */
        default:
            qDebug() << "!!! httpResponseFinished with error !!!";
            break;
    }
}
