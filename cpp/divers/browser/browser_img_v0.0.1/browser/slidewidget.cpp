#include "slidewidget.h"
#include "ui_slidewidget.h"

#include <QDebug>

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
}

SlideWidget::~SlideWidget()
{
    delete ui;
}

void SlideWidget::refresh_slide(void)
{
    //qDebug() << "refresh_slide" << m_slide->title;

    ui->lblMessage->setText(this->m_slide->getMessage());

    QString datetimeLastUpdateString = m_slide->lastupdate.toString(QString("dd/MM/yyyy hh:mm:ss"));
    QString datetimeCurrentString = QDateTime::currentDateTime().toString(QString("dd/MM/yyyy hh:mm:ss"));

    ui->lblSystem->setText(QString("MAJ: "+datetimeLastUpdateString));
    ui->lblSystem2->setText(QString("-"));
    ui->lblSystem3->setText(QString("Actuel: "+datetimeCurrentString));

    //ui->lblTest->setText(QString("test"));
    //ui->lblTest->setText(QString::number(m_slide->delay));

}

void SlideWidget::reload_slide(void)
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

    this->m_slide->load_message();
    ui->lblMessage->setText(this->m_slide->getMessage());
    //ui->lblSystem->setText(QString("MAJ: ")+datetimeLastUpdateString+QString("\tActuel: ")+datetimeCurrentString);

    // disable vertical scrollbar
    //ui->webView->page()->mainFrame()->setScrollBarPolicy(Qt::Vertical,Qt::ScrollBarAlwaysOff);
    //ui->webView->page()->mainFrame()->setScrollBarPolicy(Qt::Horizontal,Qt::ScrollBarAlwaysOff);

    //ui->webView->setUrl(QUrl("http://www.google.fr"));
    //ui->webView->setZoomFactor(1.0);

    //ui->webView->setUrl(this->m_slide->url);
    //ui->webView->load(this->m_slide->url);
    //ui->webView->setZoomFactor(this->m_slide->zoom);

    qDebug() << this->m_slide->url;
    ui->labelView->setPixmap(QPixmap(this->m_slide->url));

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
