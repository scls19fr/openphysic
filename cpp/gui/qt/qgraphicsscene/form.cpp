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

    transition_duration = 400;

    m_angle = 0;
    m_state = 0;

    scene = new QGraphicsScene;

    web = new QWebView();
    //web->load(QUrl("http://news.google.fr"));
    web->load(QUrl("https://upplanning.appli.univ-poitiers.fr/ade/custom/modules/plannings/direct_planning.jsp?login=visu&password=visu&showTree=false&showPianoDays=false&showPianoWeeks=false&showOptions=false&days=0,1,2,3,4&displayConfName=IUTP-Campus%20(GTE)%20affichage%20lim&code=_Z1PT11_TP1,_Z1PT11_TP2,_Z1PT11_TP3,_Z1PT11_TP4,_Z1PT11_TP5,_Z1PT11_TP6&projectId=3"));
    web->show();

    web2 = new QWebView();
    //web2->load(QUrl("http://www.google.com"));
    web2->load(QUrl("https://upplanning.appli.univ-poitiers.fr/ade/custom/modules/plannings/direct_planning.jsp?login=visu&password=visu&showTree=false&showPianoDays=false&showPianoWeeks=false&showOptions=false&days=0,1,2,3,4&displayConfName=IUTP-Campus%20(GTE)%20affichage%20lim&code=_Z2PT11_S3_TP1,_Z2PT11_S3_TP2,_Z2PT11_S3_TP3,_Z2PT11_S3_TP4,_Z2PT11_S3_TP5&projectId=3"));
    web2->show();

    scene->setSceneRect(0 , 0, 1000, 800);

    proxy = new QGraphicsProxyWidget();
    proxy->setWidget(web);

    proxy2 = new QGraphicsProxyWidget();
    proxy2->setWidget(web2);

    ui->graphicsView->setScene(scene);
    ui->graphicsView->show();

    this->setWindowTitle("Test QGraphicsScene");

    updateScene(m_angle);
}

Form::~Form()
{
    delete ui;
}

//void Form::updateScene(qreal m_angle) {
void Form::updateScene(const QVariant& angle) {
    qreal _angle = angle.toDouble();

    scene->removeItem(proxy);
    scene->removeItem(proxy2);

    if ( _angle>=90 && _angle<270 ) {
        scene->addItem(proxy2);
        scene->addItem(proxy);
    } else {
        scene->addItem(proxy);
        scene->addItem(proxy2);
    }

    QTransform matrix;
    matrix.rotate(180+_angle, Qt::YAxis);
    matrix.translate(-web->geometry().width()/2,0);
    proxy->setTransform(matrix);

    QTransform matrix2;
    matrix2.rotate(_angle, Qt::YAxis);
    matrix2.translate(-web->geometry().width()/2,0);
    proxy2->setTransform(matrix2);
}

void Form::on_verticalSlider_valueChanged(int value)
{
    m_angle = qreal(value)*3.6;

    updateScene(m_angle);
}

int Form::getState(void) {
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
    m_state = (m_state + 1) % 2;

    if (m_state==0) {
        mAngleAnimator = new variantAnimator;
        mAngleAnimator->setStartValue(180.0);
        mAngleAnimator->setEasingCurve(QEasingCurve::Linear);
        mAngleAnimator->setEndValue(360.0);
        mAngleAnimator->setDuration(transition_duration);

    } else { // m_state==1
        mAngleAnimator = new variantAnimator;
        mAngleAnimator->setStartValue(0.0);
        mAngleAnimator->setEasingCurve(QEasingCurve::Linear);
        mAngleAnimator->setEndValue(180.0);
        mAngleAnimator->setDuration(transition_duration);

    }

    connect(mAngleAnimator, SIGNAL(valueChanged(const QVariant&)), SLOT(updateScene(const QVariant&)));
    mAngleAnimator->start();

}

void Form::previous(void) {
    m_state = (m_state + 2 - 1) % 2;

    if (m_state==0) {
        mAngleAnimator = new variantAnimator;
        mAngleAnimator->setStartValue(180.0);
        mAngleAnimator->setEasingCurve(QEasingCurve::Linear);
        mAngleAnimator->setEndValue(0.0);
        mAngleAnimator->setDuration(transition_duration);

    } else { // m_state==1
        mAngleAnimator = new variantAnimator;
        mAngleAnimator->setStartValue(360.0);
        mAngleAnimator->setEasingCurve(QEasingCurve::Linear);
        mAngleAnimator->setEndValue(180.0);
        mAngleAnimator->setDuration(transition_duration);

    }

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
