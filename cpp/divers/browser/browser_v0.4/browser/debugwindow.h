#ifndef DEBUGWINDOW_H
#define DEBUGWINDOW_H



#include <QDialog>
#include "mainapplication.h"

namespace Ui {
class DebugWindow;
}

class DebugWindow : public QDialog
{
    Q_OBJECT
    
public:
    explicit DebugWindow(QWidget *parent = 0, MainApplication *app=0);
    ~DebugWindow();
    
private slots:
    void on_cmdNext_clicked();

    void on_cmdPause_clicked();

    void on_cmdDebug_clicked();

    void on_cmdPrevious_clicked();

    void on_cmdPlay_clicked();

    void on_cmdStop_clicked();

    //void on_DebugWindow_destroyed();

    //void on_DebugWindow_accepted();

    //void on_DebugWindow_finished(int result);

    void on_cmdQuit_clicked();


private:
    Ui::DebugWindow *ui;
    MainApplication *m_app;
};

#endif // DEBUGWINDOW_H
