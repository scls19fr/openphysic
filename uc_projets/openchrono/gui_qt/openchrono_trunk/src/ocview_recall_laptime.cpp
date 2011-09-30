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

#include "ocview_recall_laptime.h"

#include "keyboard.h"

OCView_Recall_Laptime::OCView_Recall_Laptime()
{
  setupUi(this);
  setupOCView(this);


  //laptimeWidget = new QTreeWidget();
  laptimeWidget->setColumnCount(3);
  laptimeWidget->setHeaderLabels(
    QStringList() << tr("Date / lap / etap") << tr("Time") << tr("Diff")
  );

  //laptimeWidget->header()->setResizeMode(0,1); // QHeaderView::Stretch
  //laptimeWidget->header()->setResizeMode(1,1);

  laptimeWidget->setColumnWidth(0, 165);
  laptimeWidget->setColumnWidth(1, 74);
  laptimeWidget->setColumnWidth(2, 74);

  test();

  //mylayout->addWidget(laptimeWidget);

  //verticalLayout->setSpacing(0);

  //std::cout << "init recall laptime" << std::endl;

  setWindowTitle(QApplication::translate("frmMessage", "Recall laptime", 0, QApplication::UnicodeUTF8));
  lblTitle->setText(QApplication::translate("frmMessage", "<img src=\":/icons/openchrono.png\" width=\"32\" height=\"32\"/> Laptime <img src=\":/icons/clock.svg\" width=\"32\" height=\"32\"/>", 0, QApplication::UnicodeUTF8));

}


/*
Focus
cf QWidget
this.focus() : QApplication::focusWidget() == this.
*/

void OCView_Recall_Laptime::keyPressEvent(QKeyEvent * event)
{
  switch ( event->key() ) {
    case B_OK: // Ok
      std::cout << "OK" << std::endl;
      //std::cout << QApplication::focusWidget() << std::endl;

/*
      if (QApplication::focusWidget() == NULL) { // form
        laptimeWidget->setFocus(Qt::OtherFocusReason);
      } else { // QApplication::focusWidget() == laptimeWidget
        std::cout << "expand" << std::endl;
      }
*/
/*
      if (focus==0) {
        focus=1;
      } else if (focus==1) {
        //expand
      }
*/
      break;
//    case B_CANCEL:
//      std::cout << "CANCEL" << std::endl;

/*
      if (QApplication::focusWidget() == NULL) { // form
        this->activate_parent();
      } else { // QApplication::focusWidget() == laptimeWidget
        laptimeWidget->clearFocus();
        this->setFocus(Qt::OtherFocusReason);
      }
*/

/*
      if (focus==0) {
        this->activate_parent();
      } else if (focus==1) {
        focus=0;
      }
*/
//      break;
    case B_UP:
      //std::cout << "UP" << std::endl;
      break;
    case B_DOWN:
      //std::cout << "DOWN" << std::endl;
      break;
    default: // n'importe quelle autre touche
      OCView::keyPressEvent(event);
      break;
  }
}

void OCView_Recall_Laptime::test()
{
laptimeWidget->header();

  laptimeWidget->clear();

  QTreeWidgetItem * day = new QTreeWidgetItem(laptimeWidget);
  day->setText(0, tr("2008-08-01")); // date/time when starting lap
  day->setIcon(0, QIcon(":/icons/best_lap.png")); // best lap icon
  //day->setIcon(0, QIcon(":/icons/best_etap.svg")); // best etap icon

  QTreeWidgetItem * laptime = new QTreeWidgetItem(day);
  laptime->setTextAlignment(1,Qt::AlignHCenter);
  laptime->setTextAlignment(2,Qt::AlignHCenter);

  laptime->setText(0, tr("PM 04:30:00.000")); // date/time when starting lap
  laptime->setIcon(0, QIcon(":/icons/best_lap.png")); // best lap icon
  //laptime->setIcon(0, QIcon(":/icons/best_etap.svg")); // best etap icon
  laptime->setText(1, tr("01:05.450")); // laptime
  laptime->setText(2, tr("+00:00.000"));// diff with best time

  QTreeWidgetItem * etap;
  etap = new QTreeWidgetItem(laptime);
  //etap->setTextAlignment(1,Qt::AlignHCenter);
  etap->setTextAlignment(1,Qt::AlignHCenter);
  etap->setTextAlignment(2,Qt::AlignHCenter);
  etap->setText(0, tr("etap 1")); // time for etap number 1
  etap->setText(1, tr("00:20.250")); // time for etap number 1
  etap->setText(2, tr("+00:00.000"));// diff with best time for etap number 1

  etap = new QTreeWidgetItem(laptime);
  etap->setTextAlignment(1,Qt::AlignHCenter);
  etap->setTextAlignment(2,Qt::AlignHCenter);
  etap->setText(0, tr("etap 2")); // time for etap number 1
  etap->setText(1, tr("00:20.250")); // time for etap number 1
  etap->setText(2, tr("+00:00.000"));// diff with best time for etap number 1
  etap->setIcon(0, QIcon(":/icons/best_etap.svg")); // best lap icon
}

void OCView_Recall_Laptime::init(void)
{
  focus=0;

  laptimeWidget->expandAll();
  
  //laptimeWidget->collapseAll();
  //expand only lap of the current day
}

void OCView_Recall_Laptime::showEvent ( QShowEvent * /* event */ )
{
  init();
}
