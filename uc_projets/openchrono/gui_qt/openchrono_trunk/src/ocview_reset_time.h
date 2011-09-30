/*
OpenChrono
Copyright (C) 2008  Sebastien CELLES
 
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

#ifndef OCVIEW_RESET_TIME_H
#define OCVIEW_RESET_TIME_H
//
#include "ocview.h"

#include "ui_question.h"
#include "data.h"

//class OCDocument;

class OCView_Reset_Time : public OCView, public Ui::frmQuestion
  {
//  Q_OBJECT

  public:
    OCView_Reset_Time(Data * data);
    //OCView_Engine(OCDocument * ocdoc);

    virtual ~OCView_Reset_Time(){};

    void keyPressEvent(QKeyEvent *event);

    void init(void);

    void showEvent ( QShowEvent * event ); /* after activating */

  private:
    Data * m_data;

    QListWidgetItem * no;
    QListWidgetItem * yes;


  };
#endif
