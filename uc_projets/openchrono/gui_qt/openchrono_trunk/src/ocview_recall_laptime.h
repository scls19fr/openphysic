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

#ifndef OCVIEW_RECALL_LAPTIME_H
#define OCVIEW_RECALL_LAPTIME_H
//
#include "ocview.h"

#include "ui_recall_laptime.h"

#include <QTreeWidget>

class OCView_Recall_Laptime : public OCView, public Ui::frmRecallLaptime
  {

  public:
    OCView_Recall_Laptime();

    virtual ~OCView_Recall_Laptime(){};

    void init(void);
    void showEvent ( QShowEvent * /* event */ );

  private:
    //QTreeWidget * laptimeWidget;
    void keyPressEvent(QKeyEvent * event);

    void test();

    int focus;
  };
#endif