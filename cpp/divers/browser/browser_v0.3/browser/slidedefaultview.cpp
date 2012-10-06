#include "slidedefaultview.h"
#include "ui_slidedefaultview.h"

SlideDefaultView::SlideDefaultView(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::SlideDefaultView)
{
    ui->setupUi(this);

    QFont font;
    font.setPointSize(32);
    font.setBold(true);
    ui->lblTitle->setFont(font);
    font.setPointSize(16);
    font.setItalic(true);
    ui->lblMessage->setFont(font);

    ui->lblTitle->setText(QString("Title"));
    ui->webView->setUrl(QUrl("http://www.google.fr"));
    ui->lblMessage->setText(QString("Message"));

}

SlideDefaultView::~SlideDefaultView()
{
    delete ui;
}
