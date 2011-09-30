#include "mainwindow.h"

MainWindow::MainWindow(QWidget *parent, Qt::WFlags flags)
    : QMainWindow(parent, flags)
{
    ui.setupUi(this);

    //ui.label->setText("Hello");

    // connexion automatique des signaux aux slots en fonction du nom
    // (dans ui_mainwindow.h)
    // connecte le signal clic sur bouton pushButton
    // au slot on_pushBtton_clicked()
    //QMetaObject::connectSlotsByName (MainWindowClass);

    // connexion manuelle signal/slot
    connect(ui.pushButton, SIGNAL(clicked()), this, SLOT(myslot()));


}


MainWindow::~MainWindow()
{

}

void MainWindow::on_pushButton_clicked()
{
  ui.label->setText("pushButton was clicked !");
}

void MainWindow::myslot()
{
  ui.label_2->setText("this is my slot !");
}
