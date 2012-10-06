#ifndef SLIDEDEFAULTVIEW_H
#define SLIDEDEFAULTVIEW_H

#include <QMainWindow>

#include "slide.h"
#include <QTimer>

namespace Ui {
class SlideDefaultView;
}

class SlideDefaultView : public QMainWindow
{
    Q_OBJECT
    
public:
    explicit SlideDefaultView(QWidget *parent = 0);
    ~SlideDefaultView();

    //Slide & slide;

    
private:
    Ui::SlideDefaultView *ui;

};

#endif // SLIDEDEFAULTVIEW_H
