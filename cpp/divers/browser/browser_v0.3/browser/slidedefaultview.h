#ifndef SLIDEDEFAULTVIEW_H
#define SLIDEDEFAULTVIEW_H

#include <QMainWindow>

namespace Ui {
class SlideDefaultView;
}

class SlideDefaultView : public QMainWindow
{
    Q_OBJECT
    
public:
    explicit SlideDefaultView(QWidget *parent = 0);
    ~SlideDefaultView();
    
private:
    Ui::SlideDefaultView *ui;
};

#endif // SLIDEDEFAULTVIEW_H
