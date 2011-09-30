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

#ifndef OCVIEW_PLOT_H
#define OCVIEW_PLOT_H
//
#include "ocview.h"

#include <QTimer>
//#include "ui_plot.h"
//
//#include "data.h"
#include "logdata.h"

//class OCDocument;

class OCView_Plot : public OCView //, public Ui::MainWin
  {
    Q_OBJECT

  public:
    OCView_Plot(LogData * logdata);
    virtual ~OCView_Plot();

  private slots:
    void update(void);

  private:
    QTimer timer;
    LogData * m_logdata;
  };
#endif

