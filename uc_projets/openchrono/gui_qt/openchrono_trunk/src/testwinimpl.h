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

#ifndef TESTWINIMPL_H
#define TESTWINIMPL_H
//
#include "ui_testwin.h"
//
#include "data.h"
//#include "mainwinimpl.h"
#include "logdata.h"

class TestWinImpl : public QDialog, public Ui::TestWin
  {
    Q_OBJECT

  public:
    //TestWinImpl( QWidget * parent = 0, Qt::WFlags f = 0, Data * data = 0, LogData * logdata = 0  );
    TestWinImpl( QWidget * parent = 0, Qt::WFlags f = 0, Data * data = 0 );
    ~TestWinImpl();

  private slots:
    void test(void);
    void update(void);
    void updateGlabels(void);

  private:
    Data * m_data;
    LogData * m_logdata;


    void init(void);

    void keyPressEvent(QKeyEvent * event);


    //MainWinImpl * m_win;

  };
#endif

