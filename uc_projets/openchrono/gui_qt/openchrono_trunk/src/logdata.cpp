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

#include "logdata.h"
//
#include <QTimer>


LogData::LogData( Data * data )
{
  m_data = data;

  init();

  /* resize vector */
  rpmVct.resize(Ndatarecord);
  t1Vct.resize(Ndatarecord);
  t2Vct.resize(Ndatarecord);


  setRecordMode(record_wrap);

  connect( &timer, SIGNAL( timeout() ), this, SLOT( update() ) );

  connect( this, SIGNAL( memory_full() ), this, SLOT( on_memory_full() ) );

}

LogData::~LogData(  )
{

}

void LogData::init(void)
{
  //overload = false;

  setDelay(100);

  start = 0;
  i = 0;
  Nused = 0;
  //stop = start;
}

void LogData::setDelay(int delay)
{
  m_msec = delay;
}

int LogData::delay(void)
{
  return m_msec;
}



void LogData::setRecordMode(Record_mode mode)
{
  if (mode == record_off) {
    setOff();
  }
  else if (mode == record_wrap) {
    setWrap();
  }
  else if (mode == record_fill) {
    setFill();
  }
}

void LogData::setOff(void)
{
  m_mode = record_off;
  timer.stop();
}

void LogData::setWrap(void)
{
  m_mode = record_wrap;
  timer.start(m_msec);
}

void LogData::setFill(void)
{
  m_mode = record_fill;
  timer.start(m_msec);
}

int LogData::RecordMode(void)
{
  return m_mode;
}

void LogData::update(  )
{
  Nused++;
  if ( Nused == Ndatarecord+1 ) {
    Nused = Ndatarecord;
    start = (start+1)%Ndatarecord;
  }
  //stop = (start + (Nused-1))%Ndatarecord;

  i = (start + (Nused-1))%Ndatarecord;

  rpmVct[i] = m_data->vehicule.engine.rpm.value();
  //t1Vct[i] = m_data->vehicule.engine.temperature_1.value();
  //t2Vct[i] = m_data->vehicule.engine.temperature_2.value();
  //t1Vct[i] = m_data->vehicule.engine.temperature[0].value();
  //t2Vct[i] = m_data->vehicule.engine.temperature[1].value();


  //std::cout << i << CSV_SEP << "time" << CSV_SEP << rpmVct[i] << CSV_SEP << t1Vct[i] << CSV_SEP << t2Vct[i] << CSV_SEP << start << CSV_SEP << Nused << std::endl;

  if ( Nused == Ndatarecord && m_mode == record_fill ) {
      emit memory_full();
      return;
  }
}

void LogData::show()
{
  std::cout << qPrintable(tr("Log data (show)")) << std::endl;
  std::cout << "start = " << start << std::endl;
  std::cout << "Nused = " << Nused << std::endl;
  std::cout << "stop = " << i << std::endl;
  std::cout << "Ndatarecord = " << Ndatarecord << std::endl;

  std::cout << "index" << CSV_SEP << "time" << CSV_SEP << "rpm" << CSV_SEP << "t1" << CSV_SEP << "t2" << std::endl;

  for (int j = 0 ; j < Nused ; j++ ) {
    i = (start + j)%Ndatarecord;
    std::cout << i << CSV_SEP << "time" << CSV_SEP << rpmVct[i] << CSV_SEP << t1Vct[i] << CSV_SEP << t2Vct[i] << std::endl;
  }
}

void LogData::on_memory_full()
{
  setRecordMode(record_off);
  std::cerr << "Error: Can't save more data (RPM, temp...). Memory full" << std::endl;
}

QDomElement LogData::to_node( QDomDocument &dom_doc )
{
  QDomElement dom_elt = dom_doc.createElement( QLatin1String("logdata") );

  QString strBuf;
/*
  dom_elt.setAttribute( QLatin1String("rpm"), strBuf.setNum( m_RPM ) );
  dom_elt.setAttribute( QLatin1String("temperature1"), strBuf.setNum( m_RPMmin ) );
  dom_elt.setAttribute( QLatin1String("temperature2"), strBuf.setNum( m_RPMmax ) );
*/
  return dom_elt;
}
