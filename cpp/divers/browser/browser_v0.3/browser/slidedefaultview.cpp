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
