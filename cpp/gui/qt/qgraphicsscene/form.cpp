#include "form.h"
#include "ui_form.h"

#include <QtGui>
#include <QWebView>

#include "variantanimator.h"

Form::Form(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::Form)
{
    ui->setupUi(this);

    m_transition_duration = 4000;
    m_easing_curve = QEasingCurve::Linear;
    //m_easing_curve = QEasingCurve::InOutBack;

    m_angle = 0;
    m_state = state();

    scene = new QGraphicsScene;

    QWebView *web;
    web = new QWebView();
    web->load(QUrl("http://news.google.fr"));
    //web->load(QUrl("https://upplanning.appli.univ-poitiers.fr/ade/custom/modules/plannings/direct_planning.jsp?login=visu&password=visu&showTree=false&showPianoDays=false&showPianoWeeks=false&showOptions=false&days=0,1,2,3,4&displayConfName=IUTP-Campus%20(GTE)%20affichage%20lim&code=_Z1PT11_TP1,_Z1PT11_TP2,_Z1PT11_TP3,_Z1PT11_TP4,_Z1PT11_TP5,_Z1PT11_TP6&projectId=3"));
    web->show();

    QWebView *web2;
    web2 = new QWebView();
    web2->load(QUrl("http://www.google.com"));
    //web2->load(QUrl("https://upplanning.appli.univ-poitiers.fr/ade/custom/modules/plannings/direct_planning.jsp?login=visu&password=visu&showTree=false&showPianoDays=false&showPianoWeeks=false&showOptions=false&days=0,1,2,3,4&displayConfName=IUTP-Campus%20(GTE)%20affichage%20lim&code=_Z2PT11_S3_TP1,_Z2PT11_S3_TP2,_Z2PT11_S3_TP3,_Z2PT11_S3_TP4,_Z2PT11_S3_TP5&projectId=3"));
    web2->show();

    proxy = new QGraphicsProxyWidget();
    proxy->setWidget(web);

    proxy2 = new QGraphicsProxyWidget();
    proxy2->setWidget(web2);

    scene->setSceneRect(proxy2->geometry().x()-proxy2->geometry().width()/2, proxy2->geometry().y()+proxy2->geometry().height()*0.08, proxy2->geometry().width(),  proxy2->geometry().height()*0.8);

    ui->graphicsView->scale(1.2,1.2);


    QPixmap pm;
    pm.load(QString(":/background/background/background.jpg"));
    //pm.load(QString(":/background/background/abstract-light.jpg"));
    //pm = pm.scaled(ui->graphicsView->geometry().width(),ui->graphicsView->geometry().height(),Qt::KeepAspectRatio,Qt::SmoothTransformation);
    //pm = pm.scaled(640,480,Qt::KeepAspectRatio,Qt::SmoothTransformation);
    QGraphicsPixmapItem* item = scene->addPixmap(pm);
    item->setPos(-proxy2->geometry().width()/2, 0);
    //item->setPos(-proxy2->geometry().width()/2, proxy2->geometry().height()/2);

    ui->graphicsView->setScene(scene);
    ui->graphicsView->show();

    qDebug() << scene;

    this->setWindowTitle("Test QGraphicsScene");

    updateScene(m_angle);

}

Form::~Form()
{
    delete ui;
}

void Form::updateScene(const QVariant& angle) {
    m_angle = fmod(angle.toDouble(), 360.0);

    this->ui->verticalSlider->setValue(m_angle/3.6);

    scene->removeItem(proxy);
    scene->removeItem(proxy2);

    if ( state() ) {
        scene->addItem(proxy2);
        scene->addItem(proxy);
    } else {
        scene->addItem(proxy);
        scene->addItem(proxy2);
    }

    QTransform matrix;
    matrix.rotate(180+m_angle, Qt::YAxis);
    //matrix.rotate(180-m_angle, Qt::YAxis);
    matrix.translate(-proxy->geometry().width()/2,0);
    proxy->setTransform(matrix);

    QTransform matrix2;
    matrix2.rotate(m_angle, Qt::YAxis);
    matrix2.translate(-proxy->geometry().width()/2,0);
    proxy2->setTransform(matrix2);
}

void Form::on_verticalSlider_valueChanged(int value)
{
    m_angle = qreal(value)*3.6;
    updateScene(m_angle);
}

int Form::state(void) const {
    if ( m_angle>=90 && m_angle<270 ) {
        return(1);
    } else {
        return(0);
    }
}

void Form::keyPressEvent(QKeyEvent * event)
{
    switch(event->key()) {
        case Qt::Key_K: {
            next();
            break;
        }
        case Qt::Key_J: {
            previous();
            break;
        }
        case Qt::Key_Q: {
            close();
            break;
        }
    }
}

void Form::next(void) {
    m_state = (state() + 1) % 2;

    if ( m_state==0 ) {
        mAngleAnimator = new variantAnimator;
        //mAngleAnimator->setStartValue(180.0);
        mAngleAnimator->setStartValue(m_angle);
        mAngleAnimator->setEndValue(360.0);

    } else { // m_state==1
        mAngleAnimator = new variantAnimator;
        //mAngleAnimator->setStartValue(0.0);
        mAngleAnimator->setStartValue(m_angle);
        mAngleAnimator->setEndValue(180.0);

    }

    mAngleAnimator->setEasingCurve(m_easing_curve);
    mAngleAnimator->setDuration(m_transition_duration);
    connect(mAngleAnimator, SIGNAL(valueChanged(const QVariant&)), SLOT(updateScene(const QVariant&)));
    mAngleAnimator->start();

}

void Form::previous(void) {
    m_state = (state() + 2 - 1) % 2;

    if ( m_state==0 ) {
        mAngleAnimator = new variantAnimator;
        //mAngleAnimator->setStartValue(180.0);
        mAngleAnimator->setStartValue(m_angle);
        mAngleAnimator->setEndValue(0.0);

    } else { // m_state==1
        mAngleAnimator = new variantAnimator;
        //mAngleAnimator->setStartValue(360.0);
        mAngleAnimator->setStartValue(m_angle+360);
        mAngleAnimator->setEndValue(180.0);

    }

    mAngleAnimator->setEasingCurve(m_easing_curve);
    mAngleAnimator->setDuration(m_transition_duration);
    connect(mAngleAnimator, SIGNAL(valueChanged(const QVariant&)), SLOT(updateScene(const QVariant&)));
    mAngleAnimator->start();

}

void Form::on_pushButton_clicked() // previous
{
    previous();
}

void Form::on_pushButton_2_clicked() // next
{
    next();
}
