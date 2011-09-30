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

#ifndef OCVIEW_H
#define OCVIEW_H
//

#include <QDialog>
#include <QKeyEvent>
//#include <QIcon>

#include <iostream>

//class OCDocument;

class OCView : public QDialog
  {
  public:
    OCView();
    virtual ~OCView();

    //void init(void);
    //void init(QDialog * win);
    //void init_view(QDialog * win);
    void setupOCView(QDialog * win);

/*
    void setOCIcon(QIcon & icon);
    void setOCTitle(QString str);
*/

    void set_parent(OCView * ocview);
    void set_brother_next(OCView * ocview);
    void set_brother_previous(OCView * ocview);
    void set_child_first(OCView * ocview);
    void set_no_child(void);

    void activate(void);

    void activate_parent(void);
    void activate_brother_next(void);
    void activate_brother_previous(void);
    void activate_child_first(void);

    void is_brother_of(OCView * ocview);
    void is_first_child_of(OCView * ocview);
    void is_last_child();

  protected:
    void keyPressEvent(QKeyEvent *event);
    //OCDocument * document;

    //Data * m_data;

    void desactivate(void);

    OCView * page_parent;
    OCView * page_brother_next;
    OCView * page_brother_previous;
    OCView * page_child_first;

    //QString m_title;
    //QIcon m_icon;

  private:

  };
#endif
