#ifndef SLIDE_H
#define SLIDE_H

#include <QObject>

class Slide : public QObject
{
    Q_OBJECT
public:
    explicit Slide(QObject *parent = 0);

    QString title;
    QString url;
    QString message;
    // delay
    // model
    // zoom

signals:
    
public slots:
    
};

#endif // SLIDE_H
