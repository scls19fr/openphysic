#include "splash.h"
#include "ui_splash.h"

splash::splash(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::splash)
{
    ui->setupUi(this);
}

splash::~splash()
{
    delete ui;
}
