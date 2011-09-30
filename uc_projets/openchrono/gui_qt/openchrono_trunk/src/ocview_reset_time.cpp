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

#include "ocview_reset_time.h"

#include "keyboard.h"

OCView_Reset_Time::OCView_Reset_Time(Data * data)
{
  setupUi(this);
  setupOCView(this);

  m_data=data;

  //std::cout << "init view reset time" << std::endl;

  setWindowTitle(QApplication::translate("frmResetTime", "Reset time", 0, QApplication::UnicodeUTF8));
  lblTitle->setText(QApplication::translate("frmResetTime", "<img src=\":/icons/openchrono.png\" width=\"32\" height=\"32\"/> Reset time <img src=\":/icons/clock.svg\" width=\"32\" height=\"32\"/>", 0, QApplication::UnicodeUTF8));
  lblQuestion->setText(QApplication::translate("frmResetTime", "Do you really want to reset time ?", 0, QApplication::UnicodeUTF8));

  no = new QListWidgetItem(tr("No"));
  no->setTextAlignment(Qt::AlignCenter|Qt::AlignVCenter);
  //QIcon noIcon("xclock.png");
  //no->setIcon(QIcon(":/icons/openchrono.png"));
  no->setIcon(QIcon(":/icons/home.png"));
  //no->setIcon(QIcon(":/icons/laptop_battery.svg")); /* Qt seems to support .svg files */
  //no->setIcon(QIcon(":/icons/laptop_battery.svgz")); /* Qt doesn't seems to support .svgz files */

  yes = new QListWidgetItem(tr("Yes"));
  yes->setTextAlignment(Qt::AlignCenter|Qt::AlignVCenter);
  yes->setIcon(QIcon(":/icons/eraser.png"));

  answers->clear();

  answers->addItem(no);
  answers->addItem(yes);

  //answers->addItem (tr("No")); // QListWidget
  //answers->addItem (tr("Yes")); // QListWidget
  //answers->

  //cboAnswers->addItem (tr("No"), userData ); // QComboBox
  //cboAnswers->addItem (tr("Yes"), userData );

  /* ToDo : add icon for 
    - yes : a green tick
    - no : a red cross
      http://www.kde-look.org

    See also /usr/share/icons
    See also Qt Ressources .qrc
  */

  init();
}

void OCView_Reset_Time::keyPressEvent(QKeyEvent * event)
{
  switch ( event->key() ) {
    case B_OK: // Ok
      //std::cout << "OK on OCView_Reset_Time" << std::endl;
      //std::cout << answers->currentItem() << std::endl;
      if (answers->currentItem()==no) {
        //std::cout << "no" << std::endl;
	this->activate_parent();
        break;
      }
      else if (answers->currentItem()==yes) {
        //std::cout << "yes" << std::endl;
	this->activate_parent();
        m_data->reset();
        break;
      }
      break;
    case B_UP:
      //std::cout << "UP on OCView_Reset_Time" << std::endl;
      answers->setCurrentItem(yes);
      break;
    case B_DOWN:
      //std::cout << "DOWN on OCView_Reset_Time" << std::endl;
      answers->setCurrentItem(no);
      break;
    default: // n'importe quelle autre touche
      OCView::keyPressEvent(event);
      break;
  }

/*
  switch ( event->key() )
    {
    case B_OK: // Ok
      std::cout << "OK on OCView_Reset_Time" << std::endl;
      //std::cout << answers->currentItem() << std::endl;
      if (answers->currentItem()==no) {
        std::cout << "no" << std::endl;
	this->activate_parent();
        break;
      }
      else if (answers->currentItem()==yes) {
        std::cout << "yes" << std::endl;
	this->activate_parent();
        m_data->reset();
        break;      }
      break;
    case B_CANCEL: // Cancel
      std::cout << "CANCEL on OCView_Reset_Time" << std::endl;
      this->activate_parent();
      break;
    case B_UP:
      std::cout << "UP on OCView_Reset_Time" << std::endl;
      answers->setCurrentItem(yes);
      //
      break;
    case B_DOWN:
      std::cout << "DOWN on OCView_Reset_Time" << std::endl;
      answers->setCurrentItem(no);
      //
      break;
    case B_LEFT:
      std::cout << "LEFT on OCView_Reset_Time" << std::endl;
      this->activate_brother_previous();
      break;
    case B_RIGHT:
      std::cout << "RIGHT on OCView_Reset_Time" << std::endl;
      this->activate_brother_next();
      break;
    default:
      //std::cout << "UNDEF KEY on OCView_Reset_Time" << std::endl;
      //
      break; // n'importe quelle autre touche
    }
*/
}

void OCView_Reset_Time::init(void)
{
  //std::cout << "OCView_Reset_Time::init" << std::endl;
  answers->setCurrentItem(no);
}

void OCView_Reset_Time::showEvent ( QShowEvent * /* event */ )
{
  //std::cout << "OCView_Reset_Time::showEvent" << std::endl;
  init();
}


