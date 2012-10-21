/*
Browser
Copyright (C) 2012  Sebastien Celles

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
*/

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
