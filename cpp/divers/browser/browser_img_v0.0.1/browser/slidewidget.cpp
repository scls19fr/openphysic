#include "slidewidget.h"
#include "ui_slidewidget.h"

slidewidget::slidewidget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::slidewidget)
{
    ui->setupUi(this);
}

slidewidget::~slidewidget()
{
    delete ui;
}
