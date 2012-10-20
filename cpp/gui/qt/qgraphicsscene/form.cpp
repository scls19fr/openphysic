#include "form.h"
#include "ui_form.h"

#include <QtGui>
#include <QWebView>

Form::Form(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::Form)
{
    ui->setupUi(this);

    QTimer *timer = new QTimer(this);
    timer->setInterval(40);
    connect(timer, SIGNAL(timeout()), this, SLOT(on_timer_timeout()));
    timer->start();

    m_angle = 0;

    scene = new QGraphicsScene;

    web = new QWebView();
    web->load(QUrl("http://news.google.fr"));
    web->show();

    web2 = new QWebView();
    web2->load(QUrl("http://www.google.com"));
    web2->show();

    scene->setSceneRect(0 , 0, 1000, 800);
    //scene->

    proxy = new QGraphicsProxyWidget();
    proxy->setWidget(web);

    proxy2 = new QGraphicsProxyWidget();
    proxy2->setWidget(web2);

    ui->graphicsView->setScene(scene);
    ui->graphicsView->show();

    this->setWindowTitle("Test QGraphicsScene");

    updateScene();


}

Form::~Form()
{
    delete ui;
}

void Form::updateScene(void) {
    scene->removeItem(proxy);
    scene->removeItem(proxy2);

    if ( m_angle>=90 && m_angle<270) {
        scene->addItem(proxy2);
        scene->addItem(proxy);
    } else {
        scene->addItem(proxy);
        scene->addItem(proxy2);
    }

    QTransform matrix;
    matrix.rotate(180+m_angle, Qt::YAxis);
    matrix.translate(-web->geometry().width()/2,0);
    proxy->setTransform(matrix);

    QTransform matrix2;
    matrix2.rotate(m_angle, Qt::YAxis);
    matrix2.translate(-web->geometry().width()/2,0);
    proxy2->setTransform(matrix2);
}

void Form::on_verticalSlider_valueChanged(int value)
{
    //qDebug() << value;
    //m_angle = qreal(value)*1.8;
    m_angle = qreal(value)*3.6;

    updateScene();
}

void Form::keyPressEvent(QKeyEvent * event)
{
    if ( event->key()==Qt::Key_K || event->key()==Qt::Key_Right ) { // next
        qDebug() << "Next";

    } else if ( event->key()==Qt::Key_Q ) {
        close();

    }
}

void Form::on_timer_timeout(void)
{
    //m_angle = fmod(m_angle + 1,360);
    //ui->verticalSlider->setValue(m_angle/3.6);
    ui->verticalSlider->setValue((ui->verticalSlider->value()+1) % 100);
    //updateScene();
    //qDebug()<< m_angle;
}
