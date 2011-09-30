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

#ifndef LOGDATA_H
#define LOGDATA_H

#include "data.h"
//
#include <QObject>
#include <QVector>
#include <QtXml>
//
#define CSV_SEP ";"
#define Ndatarecord 32 //4096=2^12

#include <iostream> // ForTest std::cout << "Test" << std::endl;

class LogData : public QObject
  {
    Q_OBJECT

  public:
    LogData(Data * data);
    ~LogData();

    void show(void);

    QDomElement to_node( QDomDocument &dom_doc );

  private slots:
    void update(void);
    void on_memory_full(void);

  private:
    Data * m_data;

    void setDelay(int delay);
    int delay(void);
    int m_msec; // log delay = typically 500ms

    int start;
    //int stop;
    int i;
    int Nused;

    void init(void);

    /* data to record */
    // time
    QVector <double> rpmVct;
    QVector <double> t1Vct;
    QVector <double> t2Vct;

/*
    double rpmVct[Ndatarecord];
    double t1Vct[Ndatarecord];
    double t2Vct[Ndatarecord];
*/
    /*
    Record mode : OFF, FILL or WRAP.
    The FILL option will record data until the maximum memory of N points is reached, then stop and provide a "LogData memory full" message.
    The WRAP option will continuously record log data by wrapping through available memory and replacing the oldest data with new data.
    */
    enum Record_mode { record_off = 0, record_fill, record_wrap};
    Record_mode m_mode;
    void setRecordMode(Record_mode mode);
    void setOff(void);
    void setWrap(void);
    void setFill(void);
    int RecordMode(void);

    QTimer timer;

    //bool overload; // for wrap mode

  signals:
    void memory_full(void); // only emit when fill mode is activated

  };

//#define OC_CFG_FILE QLatin1String("openchrono.xml")


#endif

