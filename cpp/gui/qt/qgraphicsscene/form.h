#ifndef FORM_H
#define FORM_H

#include <QWidget>
#include <QtGui>
#include <QWebView>
#include "variantanimator.h"

namespace Ui {
class Form;
}

class Form : public QWidget
{
    Q_OBJECT
    
public:
    explicit Form(QWidget *parent = 0);
    ~Form();

public slots:
    void on_verticalSlider_valueChanged(int value);
    void updateScene(const QVariant& angle);

private slots:
    void on_pushButton_clicked();
    void on_pushButton_2_clicked();

signals:
    void nextPressed(void);
    void previousPressed(void);

private:
    Ui::Form *ui;
    QGraphicsScene *scene;

    qreal m_angle;
    int m_state;
    int state(void) const; // getter
    //void setState(const int state); // setter

    QGraphicsProxyWidget *proxy2;
    QGraphicsProxyWidget *proxy;

    void keyPressEvent(QKeyEvent * event);

    variantAnimator *mAngleAnimator;

    void next(void);
    void previous(void);


    int m_transition_duration;
    QEasingCurve m_easing_curve;

    //QStateMachine machine;

};

#endif // FORM_H
