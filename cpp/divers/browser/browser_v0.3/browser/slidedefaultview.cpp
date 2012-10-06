#include "slidedefaultview.h"
#include "ui_slidedefaultview.h"

#include "iostream.h"

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
    ui->webView->setUrl(QUrl("http://www.google.fr"));
    ui->lblMessage->setText(QString("Message"));

}

SlideDefaultView::~SlideDefaultView()
{
    delete ui;
}
