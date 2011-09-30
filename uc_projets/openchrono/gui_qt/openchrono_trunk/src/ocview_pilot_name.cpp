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

#include "ocview_pilot_name.h"

#include "keyboard.h"

OCView_Pilot_Name::OCView_Pilot_Name(Data * data)
{
  setupUi(this);
  setupOCView(this);

  //this->setLayout(verticalLayout);

  m_data=data;

  //std::cout << "init view pilot name" << std::endl;

  setWindowTitle(QApplication::translate("frmPilotName", "Pilot name", 0, QApplication::UnicodeUTF8));
  lblTitle->setText(QApplication::translate("frmPilotName", "<img src=\":/icons/openchrono.png\" width=\"32\" height=\"32\"/>  Pilot name <img src=\":/icons/pilot.png\" width=\"32\" height=\"32\"/>", 0, QApplication::UnicodeUTF8));
  lblQuestion->setText(QApplication::translate("frmPilotName", "What is your name ?", 0, QApplication::UnicodeUTF8));

  init();
}

void OCView_Pilot_Name::write(void) {

  QString chr;
  //QChar chr;

  //int size=str.count();
  QString strText;

  for (int i = 0 ; i<size ; i++) {
    if (i!=0)
      strText += tr(" ");
    if (i>str.count()-1) {
      chr = "_";
    } else {
      chr = str[i]; //tr("*");
    }
    if (i==pos && focus==1) {
      strText += "<u>" + chr + "</u>";
    } else {
      strText += chr;
    }
  }

  strText = tr("<center>") + strText + tr("</center>");
  text->setText(strText);
}

QChar OCView_Pilot_Name::next(QChar chr) {
  QChar new_chr;
  new_chr=chr;
  if (new_chr.unicode()==QChar(' ')) {
    new_chr=QChar('A');
  } else if (
             new_chr.unicode()>=QChar('A') && new_chr.unicode()<QChar('Z')
          || new_chr.unicode()>=QChar('0') && new_chr.unicode()<QChar('9')
            ) {
    new_chr.unicode()++;
  } else if (new_chr.unicode()==QChar('Z')) {
    new_chr=QChar('0');
  } else if (new_chr.unicode()==QChar('9')) {
    new_chr=QChar('\'');
  } else {
    new_chr=QChar(' ');
  }
  //new_chr++;
  return new_chr; //chr
}

/* _ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'- */

QChar OCView_Pilot_Name::previous(QChar chr) {
  QChar new_chr; 
  new_chr=chr;
  if (
             new_chr.unicode()>QChar('A') && new_chr.unicode()<=QChar('Z')
          || new_chr.unicode()>QChar('0') && new_chr.unicode()<=QChar('9')
            ) {
    new_chr.unicode()--;
  } else if (new_chr.unicode()==QChar('A')) {
    new_chr=QChar(' ');
  } else if (new_chr.unicode()==QChar('0')) {
    new_chr=QChar('Z');
  } else if (new_chr.unicode()==QChar('-')) {
    new_chr=QChar('\'');
  } else if (new_chr.unicode()==QChar('\'')) {
    new_chr=QChar('9');
  } else {
    new_chr=QChar('-');
  }
  return new_chr; //chr
}

/*
Focus
cf QWidget
this.focus() : QApplication::focusWidget() == this.
*/

void OCView_Pilot_Name::keyPressEvent(QKeyEvent * event)
{
  switch ( event->key() )
    {
    case B_OK: // Ok
      //std::cout << "OK on OCView_Pilot_Name" << std::endl;
      if (focus==0) {
        focus=1;
        //text->setFocus(Qt::OtherFocusReason);
      }
      else if (focus==1) {
        //std::cout << "set pilot name" << std::endl;
        m_data->pilot.setName(str);
      }
      write();
      break;
    case B_CANCEL: // Cancel
      //std::cout << "CANCEL on OCView_Pilot_Name" << std::endl;
      if (focus==0) {
        this->activate_parent();
      }
      else if (focus==1) {
        focus=0;
      }
      write();
      break;
    case B_UP:
      //std::cout << "UP on OCView_Pilot_Name" << std::endl;
      if (focus==0) {
      }
      else if (focus==1) {
        str[pos]=next(str[pos]);
      }      
      write();
      //
      break;
    case B_DOWN:
      //std::cout << "DOWN on OCView_Pilot_Name" << std::endl;
      if (focus==0) {
      }
      else if (focus==1) {
        str[pos]=previous(str[pos]);
      }      
      write();
      //
      break;
    case B_LEFT:
      //std::cout << "LEFT on OCView_Pilot_Name" << std::endl;
      if (focus==0) {
        this->activate_brother_previous();
      }
      else if (focus==1) {
        if (pos!=0) {
          pos=pos-1;
        } else {
          pos=0;
        }
      }
      write();
      break;
    case B_RIGHT:
      //std::cout << "RIGHT on OCView_Pilot_Name" << std::endl;
      if (focus==0) {
        this->activate_brother_next();
      }
      else if (focus==1) {
        if (pos!=size-1) {
          pos=pos+1;
        } else {
          pos=size-1;
        }
      }
      write();
      break;
    default:
      //std::cout << "UNDEF KEY on OCView_Reset_Time" << std::endl;
      //
      //std::cout << focus << std::endl;
      write();
      break; // n'importe quelle autre touche
    }
}

void OCView_Pilot_Name::init(void)
{
  //std::cout << " OCView_Pilot_Name::init" << std::endl;
  focus=0;
  //str=tr("AZTEST");
  str=m_data->pilot.name();
  pos=0;
  size=10;
  write();
}

void OCView_Pilot_Name::showEvent ( QShowEvent * /* event */ )
{
  //std::cout << "OCView_Reset_Time::showEvent" << std::endl;
  init();
}


