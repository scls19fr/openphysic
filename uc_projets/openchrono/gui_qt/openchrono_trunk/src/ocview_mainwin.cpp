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

#include "ocview_mainwin.h"
//#include "ocdocument.h"

#include <iostream>
#include <cmath>

#include "keyboard.h"

//
#include <QTimer>

OCView_MainWin::OCView_MainWin(Data * data) 
{
  m_data = data;

  setupUi(this);
  setupOCView(this);

  //setIcon(QIcon(":/icons/openchrono.png"));

  setWindowTitle(QLatin1String("OpenChrono main window"));

  //test();

  //UpdateData();

  // update RPM
  //std::cout << qPrintable(tr("RPMmin:")) <<  m_data->vehicule.engine.rpm.max() << std::endl;
  //std::cout << qPrintable(tr("RPMmax:")) <<  m_data->vehicule.engine.rpm.min() << std::endl;

  GraphicRPM->setMaximum((int) m_data->vehicule.engine.rpm.max());
  GraphicRPM->setMinimum((int) m_data->vehicule.engine.rpm.min());
  //GraphicRPM->setMaximum(15000);
  //GraphicRPM->setMinimum(1000);

  //delete layout();
  //setLayout(vboxLayout);

  QTimer * timer = new QTimer(this);
  connect( timer, SIGNAL(timeout()), this, SLOT(UpdateData()) );
  timer->start(25); //

  //lblMessage->setText(QLatin1String("OpenChrono - Copyright (c) 2008 S. Celles - under GNU General Public License --- "));
  //lblMessage->setText(QLatin1String("OpenChrono   ***   "));

}

OCView_MainWin::~OCView_MainWin()
{
  
}


void OCView_MainWin::test(void)
{
  lblMessage->setText(QLatin1String("XXXXXXXXXXXXXXXXXX"));

  GraphicRPM->setValue(16000);

  lblCurrLapTime->setText(QLatin1String("XX:XX:XXX"));
  lblBestLapTime->setText(QLatin1String("XX:XX:XXX"));
  lblLastLapTime->setText(QLatin1String("XX:XX:XXX"));

  lblLap->setText(QLatin1String("XXX"));
  lblEtap->setText(QLatin1String("XX / XX"));

  lblTemp1->setText(QLatin1String("XXXXX"));
  lblTemp2->setText(QLatin1String("XXXXX"));
}


void OCView_MainWin::showRPM(void)
{
  double rpm = m_data->vehicule.engine.rpm.value();
  double rpmMax = m_data->vehicule.engine.rpm.max();
  int value;

  if ( rpm <= rpmMax )
    {
      value = (int) (round(rpm/10)*10);
    }
  else
    {
      value = (int) rpmMax;
    }

  //std::cout << "value:" << value << std::endl;

  GraphicRPM->setValue(value);

}

void OCView_MainWin::showT1(void)
{
  QPalette palette = lblTemp1->palette();;
  QColor colorTxt;//(0,0,0,0);
  QColor colorBack;//(255,255,255,0);

  //QGradient gradient;
  //QLinearGradient gradient(0, 0, width(), 0);
  //gradient.setColorAt(0.0, Qt::green);
  //gradient.setColorAt(0.8, Qt::yellow);
  //gradient.setColorAt(1.0, Qt::red);
  /* ToDo : a better gradient that fit with temperature measurements
    cold is blue - hot/warm is red
    see colormap (in geography / maps)
   */
  //QPen pen(gradient, 0); // no contour
  //color = gradient.getColorAt(0.5); // unfortunately it doesn't exist ! ToDo
  /* Look into the QT source for gradient qt4/src/gui/painting/brush.h & .cpp */

  if (m_data->vehicule.engine.temperature[0].value()>=100) {
    //colorTxt = Qt::black;
    colorBack = Qt::red;
    colorBack = colorBack.darker(120);
  } else {
    //colorTxt = Qt::black;
    //colorBack = Qt::white;
    colorBack = this->palette().color(QPalette::Window);
  }

  colorTxt = QColor(255-colorBack.red(),255-colorBack.green(),255-colorBack.blue());

  palette.setColor(QPalette::WindowText, colorTxt); // text (setBrush or setColor)
  palette.setColor(lblTemp1->backgroundRole(), colorBack); // background
  lblTemp1->setAutoFillBackground( true );
  lblTemp1->setPalette(palette); // apply the palette to the label


  //lblTemp1->setText(m_data->vehicule.engine.temperature_1.getStr());
  lblTemp1->setText(m_data->vehicule.engine.temperature[0].getStr());


  //QPen pen;
  //pen.setColor(color);

  //std::cout << "color for temperature" << std::endl;
  //lblTemp1->setStyleSheet("color: blue; background-color: yellow");

  //lblTemp1->setStyleSheet("background-color: qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 #616161, stop: 0.5 #505050, stop: 0.6 #434343, stop:1 #656565);");
 
 //lblTemp1->setStyleSheet("color: #FF0000;");
  //lblTemp1->setStyleSheet("background-color: " + colorBack.name()+ ";"); // ok

/* see also QTextFormat / QTextDocument / QTextEdit
 void QTextFormat::setForeground ( const QBrush & brush )
 void QTextFormat::setBackground ( const QBrush & brush )
 */
  
}

/*
QPalette OCView_MainWin::TempPalette(Temperature temp, Alarm alarm)
{

}
*/

void OCView_MainWin::showT2(void)
{
  QPalette palette = lblTemp2->palette();;
  QColor colorTxt;//(0,0,0,0);
  QColor colorBack;//(255,255,255,0);

  if (m_data->vehicule.engine.temperature[1].value()>=100) {
    //colorTxt = Qt::black;
    colorBack = Qt::red;
    colorBack = colorBack.darker(120);
  } else {
    //colorTxt = Qt::black;
    colorBack = this->palette().color(QPalette::Window);
  }

  colorTxt = QColor(255-colorBack.red(),255-colorBack.green(),255-colorBack.blue());

  palette.setColor(QPalette::WindowText, colorTxt); // text (setBrush or setColor)
  palette.setColor(lblTemp1->backgroundRole(), colorBack); // background
  lblTemp2->setAutoFillBackground( true );
  lblTemp2->setPalette(palette); // apply the palette to the label

  //lblTemp2->setText(m_data->vehicule.engine.temperature_2.getStr());
  lblTemp2->setText(m_data->vehicule.engine.temperature[1].getStr());
}

void OCView_MainWin::showCurrentLapTime(void)
{
  lblCurrLapTime->setText(m_data->chrono.getStrCurrentLapTime());
}

void OCView_MainWin::showLastLapTime(void)
{
  lblLastLapTime->setText(m_data->chrono.getStrLastLapTime());
}

void OCView_MainWin::showBestLapTime(void)
{
  lblBestLapTime->setText(m_data->chrono.getStrBestLapTime());
}

void OCView_MainWin::showLap(void)
{
  QString strLap;
  if ( m_data->track.laps() > 1 )
    {
      strLap.sprintf("%d / %d", m_data->position.lap(), m_data->track.laps());
    }
  else
    {
      strLap.sprintf("%d", m_data->position.lap());
    }
  lblLap->setText(strLap);
}

void OCView_MainWin::showEtap(void)
{
  QString strEtap;
  strEtap.sprintf("%d / %d", m_data->position.etap(), m_data->track.etaps());
  lblEtap->setText(strEtap);
}

void OCView_MainWin::showMsg(void)
{
  QDateTime datetime = QDateTime::currentDateTime();
  //QString strFormat ="YY";
  const QString sep = QString("   ***   ");
  //lblMessage->setText(QLatin1String("OpenChrono") + sep);
  lblMessage->setText(QLatin1String("OpenChrono") + sep + datetime.toString("yyyy-MM-dd hh:mm:ss") + sep);
}

void OCView_MainWin::UpdateData(void)
{
  showMsg();
  showRPM();
  showT1();
  showT2();
  showCurrentLapTime();
  showLastLapTime();
  showBestLapTime();
  showLap();
  showEtap();
  showG();
}

void OCView_MainWin::showG(void)
{
  accelerometer->setGX(m_data->vehicule.acceleration.GX());
  accelerometer->setGY(m_data->vehicule.acceleration.GY());
}


void OCView_MainWin::keyPressEvent(QKeyEvent * event)
{
  switch ( event->key() ) {
    case B_OK: // Ok
      //std::cout << "OK on OCView_MainWin will save data" << std::endl;
      m_data->save();
      break;
    case B_CANCEL:
      m_data->reset();
      break;
    case B_TEST:
      //std::cout << "TEST on OCView_MainWin" << std::endl;
      m_data->test();
      break;
    default: // n'importe quelle autre touche
      OCView::keyPressEvent(event);
      break;
  }
}

