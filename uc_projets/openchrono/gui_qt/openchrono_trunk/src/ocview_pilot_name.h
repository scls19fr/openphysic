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

#ifndef OCVIEW_PILOT_NAME_H
#define OCVIEW_PILOT_NAME_H
//
#include "ocview.h"

#include "ui_text.h"
#include "data.h"


class OCView_Pilot_Name : public OCView, public Ui::frmText
  {
//  Q_OBJECT

  public:
    OCView_Pilot_Name(Data * data);
    //OCView_Engine(OCDocument * ocdoc);

    virtual ~OCView_Pilot_Name(){};

    void keyPressEvent(QKeyEvent *event);

    void init(void);

    void showEvent ( QShowEvent * event ); /* after activating */

    void write(void);

  private:
    int focus; /* 0=form 1=textbox */

    Data * m_data;

    QString str;
    int pos;
    int size;

    QChar next(QChar chr);
    QChar previous(QChar chr);
  };
#endif
