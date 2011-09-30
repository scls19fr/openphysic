#include "testpattern.h"
#include "ui_testpattern.h"
#include "qpainter.h"

using namespace std;
#include <iostream>

Testpattern::Testpattern(QWidget *parent)
    : QDialog(parent), ui(new Ui::Dialog)
{
    ui->setupUi(this);

    this->setWindowState(Qt::WindowFullScreen);

    QPalette palette;
    palette.setColor(QPalette::Window, Qt::white); // QColor(0,255,0,255)
    this->setPalette(palette);

    //testpattern1();
}

void Testpattern::paintEvent(QPaintEvent * event)
{
    //int w = 640;
    //int h = 480;

    testpattern1();
}

void Testpattern::testpattern1(void)
{
    QPainter painter(this);
    QRect dim = painter.window();

    //painter.drawLine(dim.topLeft(), dim.bottomRight()); // diag

    dim.getRect(&x,&y,&w,&h);
    //w = 640;
    //h = 480;

    QColor color;
    //QVector<QColor> colors(w*h);
    colors.resize(w*h);

    cout << "w=" << w << " h=" << h << endl;

    int i, j, k=0;
    for (i=0 ; i<h ; i++) {
        for (j=0 ; j<w ; j++) {
            if (i%2==1 && j%2==1) {
                color=Qt::black;
                painter.setPen(QPen(color, 1));
            } else {
                color=Qt::white;
                painter.setPen(QPen(color, 1));
            }

            colors[k]=color;
            painter.drawPoint(j,i);

            k=k+1;
        }
    }
}

Testpattern::~Testpattern()
{
    //print_colors();

    delete ui;
}

void Testpattern::print_colors(void)
{
    int r,g,b,a;
    cout << "k" <<  "\t" << "R"<< "\t" << "G" << "\t" << "B" << endl;
    for (int k=0 ; k<h*w ; k++) {
        colors[k].getRgb(&r,&g,&b,&a);
        cout << k <<  "\t" << r << "\t" << g << "\t" <<  b << endl;
    }
}
