#include "mainwindow.h"
#include "slider.h"
#include "plot.h"

#include <math.h>

#include <qlayout.h>



MainWindow::MainWindow(QWidget *parent): 
    QWidget(parent)
{
QHBoxLayout *mainLayout = new QHBoxLayout();
Slider *slider = new Slider(parent);
//QLabel *plot = new QLabel("Add a graph here");
Plot *plot = new Plot(parent);

mainLayout->addWidget(slider);
mainLayout->addWidget(plot);

this->setLayout(mainLayout);

//this->setGeometry(0, 0, 600, 400);
this->resize(600, 400);

(void)startTimer(1000); // 1 second

}


//#include <iostream>
//using namespace std;
void MainWindow::timerEvent(QTimerEvent *)
{
//std::cout << "timerEvent" << std::endl;
}
