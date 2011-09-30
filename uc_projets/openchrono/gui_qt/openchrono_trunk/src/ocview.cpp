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

#include "ocview.h"
//#include "OCView.h"

#include "keyboard.h"
#include "screen.h"


OCView::OCView(void)
{
  // contruct
  //std::cout << "init view" << std::endl;

  // in case of error : segfault
  page_parent = NULL;
  page_brother_next = NULL;
  page_brother_previous = NULL;
  page_child_first = NULL; //this; // null


/*
  // in case of error : no segfault but always on 
  page_parent = this;
  page_brother_next = this;
  page_brother_previous = this;
  page_child_first = this;
*/

  //m_data = NULL;

  this->set_no_child();

}

//void OCView::init(void)

void OCView::setupOCView(QDialog * win)
{
// This method must be loaded after setupUi(this)

//  setGeometry(WIN_POS_X,WIN_POS_Y,WIN_WIDTH,WIN_HEIGHT);
  //std::cout << "post init view" << std::endl;

  win->setGeometry(0,0,320,240);
  //win->setWindowFlags(Qt::SplashScreen);
  //win->setWindowFlags(Qt::Popup);
}



/*
OCView::OCView(Data * data)
{
  std::cout << "OCView contructor with data" << std::endl;
  //m_data = data;
  //OCView();
}
*/

/*
void OCView::set_data(Data * data)
{
  m_data = data;
}
*/


/*
void OCView::set_view(OCView * ocview)
{
  view = ocview;
  //view->init();
}
*/


void OCView::set_parent(OCView * ocdoc)
{
  page_parent = ocdoc;
}

void OCView::set_brother_next(OCView * ocdoc)
{
  page_brother_next = ocdoc;

}

void OCView::set_brother_previous(OCView * ocdoc)
{
  page_brother_previous = ocdoc;

}

void OCView::set_child_first(OCView * ocdoc)
{
  page_child_first = ocdoc;
}

void OCView::set_no_child(void)
{
  page_child_first = this;
}



void OCView::activate_parent(void)
{
  if (page_parent != this)
    {
      page_parent->activate();
      this->desactivate();
    }
}

void OCView::activate_brother_next(void)
{
  if (page_brother_next != this)
    {
      page_brother_next->activate();
      this->desactivate();
    }
}

void OCView::activate_brother_previous(void)
{
  if (page_brother_previous != this)
    {
      page_brother_previous->activate();
      this->desactivate();
    }
}

void OCView::activate_child_first(void)
{
  if (page_child_first != this)
    {
      page_child_first->activate();
      this->desactivate();
    }
}


void OCView::is_brother_of(OCView * ocview)
{
  /* liens de fraternite */
  this->set_brother_previous(ocview);
  ocview->set_brother_next(this);
  //ocview=NULL;

  /* des freres ont le même pere */
  this->set_parent(ocview->page_parent);
}


void OCView::is_last_child()
{
  this->set_brother_next(page_parent);
  page_parent->set_brother_previous(this);
}


/* ToTest */
void OCView::is_first_child_of(OCView * ocview)
{
  this->page_parent=ocview;
  ocview->set_child_first(this);
}


void OCView::activate(void)
{
/*
  if (NULL != view)
    {
      view->init();
      view->show();
    }
*/
  this->show();
}

void OCView::desactivate(void)
{
/*
  if (NULL != view)
    {
      view->hide();
    }
*/
  this->hide();

}




/*
void OCView::navigate_on_ok(void)
{
  //ptr_current_page = &page_engine_menu;
  //ptr_page_goto = ptr_current_page->page_child_first;
}
 
void OCView::navigate_on_cancel(void)
{
  //ptr_page_goto = ptr_current_page->page_parent;
}
 
void OCView::navigate_on_left(void)
{
  //ptr_page_goto = ptr_current_page->page_brother_previous;
}
 
void OCView::navigate_on_right(void)
{
  //ptr_page_goto = ptr_current_page->page_brother_next;
}
*/


OCView::~OCView(void)
{
  // destruct
}

/*
void OCView::init_view(QDialog * win)
{

}
*/

void OCView::keyPressEvent(QKeyEvent * event)
{
  //std::cout << "KeyPressed OCView " << event->key() << std::endl;

  switch ( event->key() )
    {
    case B_OK: // Ok
      //std::cout << "OK on OCView" << std::endl;
      this->activate_child_first();
      break;
    case B_CANCEL: // Cancel
      //std::cout << "CANCEL on OCView" << std::endl;
      this->activate_parent();
      break;
    case B_UP:
      //std::cout << "UP on OCView" << std::endl;
      //
      break;
    case B_DOWN:
      //std::cout << "DOWN on OCView" << std::endl;
      //
      break;
    case B_LEFT:
      //std::cout << "LEFT on OCView" << std::endl;
      this->activate_brother_previous();
      break;
    case B_RIGHT:
      //std::cout << "RIGHT on OCView" << std::endl;
      this->activate_brother_next();
      break;
    case B_TEST:
      //std::cout << "TEST on OCView" << std::endl;
      break;
    default:
      //std::cout << "UNDEF KEY" << std::endl;
      //
      break; // n'importe quelle autre touche
    }
}


/*
void OCView::setTitle(QString str)
{
  this->setWindowTitle(str);
}

void OCView_Message::setMessage(QString str)
{
  lblMessage->setText(str);
}

void OCView_Message::setTitle(QString str)
{
  lblTitle->setText(str);
  this->setWindowTitle(str);
}
*/
