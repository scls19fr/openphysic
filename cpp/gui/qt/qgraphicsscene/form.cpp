#include "form.h"
#include "ui_form.h"

#include <QtGui>
#include <QWebView>

Form::Form(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::Form)
{
    ui->setupUi(this);

    QWebView *web = new QWebView();
    web->load(QUrl("http://www.siteduzero.com"));
    web->show();

    QWebView *web2 = new QWebView();
    web2->load(QUrl("http://www.google.com"));
    web2->show();

    scene.setSceneRect(0 , 0, 1000, 800);
    //scene.setSceneRect(-500 , -400, 2000, 1600);

    QGraphicsProxyWidget *proxy = new QGraphicsProxyWidget();
    proxy->setWidget(web);
    scene.addItem(proxy);

    QGraphicsProxyWidget *proxy2 = new QGraphicsProxyWidget();
    proxy2->setWidget(web2);
    scene.addItem(proxy2);

    //proxy->setOpacity(0.5);

    QTransform matrix;
    matrix.rotate(180, Qt::YAxis);
    matrix.translate(-web->geometry().width()/2,0);
    //matrix.rotate(-30, Qt::XAxis);
    proxy->setTransform(matrix);

    QTransform matrix2;
    matrix2.rotate(0, Qt::YAxis);
    matrix2.translate(-web->geometry().width()/2,0);
    proxy2->setTransform(matrix2);

    //QGraphicsView view(&scene);
    //view.show();

    ui->graphicsView->setScene(&scene);
    ui->graphicsView->show();

    //view.setWindowTitle("Ma première scène");

}

Form::~Form()
{
    delete ui;
}
