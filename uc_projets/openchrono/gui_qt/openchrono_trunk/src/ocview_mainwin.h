/*
OpenChrono
Copyright (C) 2007  Sebastien CELLES
 
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

#ifndef OCVIEW_MAINWIN_H
#define OCVIEW_MAINWIN_H
//
#include "ocview.h"

#include "ui_mainwin.h"
//
#include "data.h"
#include <QKeyEvent>

//class OCDocument;

class OCView_MainWin : public OCView, public Ui::MainWin
  {
    Q_OBJECT

  public:
    //OCView_MainWin();
    OCView_MainWin(Data * data);

    virtual ~OCView_MainWin();

    void test(void);

    void keyPressEvent(QKeyEvent *event);


  private slots:
    void UpdateData();

  private:
    void showMsg(void);
    void showRPM(void);
    void showT1(void);
    void showT2(void);
    void showCurrentLapTime(void);
    void showLastLapTime(void);
    void showBestLapTime(void);
    void showLap(void);
    void showEtap(void);
    void showG(void);

    Data * m_data;


  };
#endif


