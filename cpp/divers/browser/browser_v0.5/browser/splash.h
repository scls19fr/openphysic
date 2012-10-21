#ifndef SPLASH_H
#define SPLASH_H

#include <QWidget>

namespace Ui {
class splash;
}

class splash : public QWidget
{
    Q_OBJECT
    
public:
    explicit splash(QWidget *parent = 0);
    ~splash();
    
private:
    Ui::splash *ui;
};

#endif // SPLASH_H
