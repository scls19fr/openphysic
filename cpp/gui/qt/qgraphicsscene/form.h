#ifndef FORM_H
#define FORM_H

#include <QWidget>
#include <QtGui>
#include <QWebView>

namespace Ui {
class Form;
}

class Form : public QWidget
{
    Q_OBJECT
    
public:
    explicit Form(QWidget *parent = 0);
    ~Form();

private slots:
    void on_verticalSlider_valueChanged(int value);
    void on_timer_timeout(void);

private:
    Ui::Form *ui;
    QGraphicsScene *scene;

    qreal m_angle;

    QWebView *web;
    QWebView *web2;

    QGraphicsProxyWidget *proxy2;
    QGraphicsProxyWidget *proxy;

    void updateScene(void);

    void keyPressEvent(QKeyEvent * event);

};

#endif // FORM_H
