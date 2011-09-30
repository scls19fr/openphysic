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

#include "engine_time.h"
#include "chrono.h"
//

#include <iostream>

Engine_Time::Engine_Time(  )
{
  reset();
}

bool Engine_Time::is_running(void)
{
  return m_running;
}


void Engine_Time::start(void)
{
  if (!m_running) {
    std::cout << "start engine time" << std::endl;
    m_running = true;
    //t.start(); // using QTime

    gettimeofday(&tv_start, NULL);

  }
}


void Engine_Time::stop(void)
{
  if (m_running) {
    std::cout << "stop engine time" << std::endl;
    m_running = false;

    //time=time.addMSecs(t.elapsed()); // using QTime

    gettimeofday(&tv_stop, NULL);
    Chrono::timeval_subtract (&session_engine_time, &tv_stop, &tv_start);
    //memcpy(&total_engine_time, &session_engine_time, sizeof(struct timeval));
    Chrono::timeval_add (&total_engine_time, &total_engine_time, &session_engine_time);
  }
}

void Engine_Time::reset(void)
{
  std::cout << "reset engine time" << std::endl;
  m_running = false;
  //t=QTime(0,0,0,0); // using QTime
  //time=QTime(0,0,0,0); // using QTime

  gettimeofday(&tv_start, NULL);
  memcpy(&tv_stop, &tv_start, sizeof(struct timeval));
  Chrono::timeval_subtract (&session_engine_time, &tv_stop, &tv_start);
  memcpy(&total_engine_time, &session_engine_time, sizeof(struct timeval));
}

QString Engine_Time::toString(void)
{
  //return time.toString("hh:mm:ss.zzz"); // using QTime

/* // mm:ss:zzz
  struct tm * ptm;
  char time_string[15];
  long milliseconds;
  // see http://www.quepublishing.com/articles/article.asp?p=23618&seqNum=8&rl=1
  QString strTime;
  ptm = localtime (&total_engine_time.tv_sec); // total != session
  strftime (time_string, sizeof (time_string), "%M:%S", ptm); //"%Y-%m-%d %H:%M:%S"
  milliseconds = total_engine_time.tv_usec / 1000; // total != session
  strTime.sprintf("%s.%03ld\n", time_string, milliseconds);
  return strTime;
*/

   // hh:mm:ss
  struct tm * ptm;
  char time_string[15];
  long milliseconds;
  // see http://www.quepublishing.com/articles/article.asp?p=23618&seqNum=8&rl=1
  QString strTime;
  ptm = localtime (&total_engine_time.tv_sec); // total != session
  strftime (time_string, sizeof (time_string), "%M:%S", ptm); //"%Y-%m-%d %H:%M:%S"
  milliseconds = total_engine_time.tv_usec / 1000; // total != session
  strTime.sprintf("%s.%03ld\n", time_string, milliseconds);
  return strTime;
}


