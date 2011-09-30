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

#include "chrono.h"


#include <sys/time.h>
#include <unistd.h>

#include <cstdlib> // memcpy

#include <iostream>


Chrono::Chrono( )
{
  reset();
}

struct timeval Chrono::max_lap_time(void)
  {
    struct timeval tv;
    tv = timeval();

    tv.tv_sec = 60*10; // 10:00:000 = 10 minutes

    //tv.tv_sec = 60*9+59; // 10 minutes moins 1 ms
    //tv.tv_usec = 999*1000;

    return tv;
  }


int Chrono::timeval_subtract (struct timeval *result, const struct timeval *x, struct timeval *y)
{
  // see http://www.gnu.org/software/libc/manual/html_node/Elapsed-Time.html
  // ATTENTION ! y est modifié !!!

  /* Perform the carry for the later subtraction by updating y. */
  if (x->tv_usec < y->tv_usec)
    {
      int nsec = (y->tv_usec - x->tv_usec) / 1000000 + 1;
      y->tv_usec -= 1000000 * nsec;
      y->tv_sec += nsec;
    }
  if (x->tv_usec - y->tv_usec > 1000000)
    {
      int nsec = (x->tv_usec - y->tv_usec) / 1000000;
      y->tv_usec += 1000000 * nsec;
      y->tv_sec -= nsec;
    }

  /* Compute the time remaining to wait.
     tv_usec is certainly positive. */
  result->tv_sec = x->tv_sec - y->tv_sec;
  result->tv_usec = x->tv_usec - y->tv_usec;

  /* Return 1 if result is negative. */
  return x->tv_sec < y->tv_sec;
}

int Chrono::timeval_add (struct timeval *result, const struct timeval *x, struct timeval *y)
{
  /* To Do */

  memcpy(result, y, sizeof(struct timeval)); 
}

void Chrono::start(void)
{
get_current_lap_time(); // TO FIX
  clear(); // TO FIX

  if (!running) // first start
  {
    running = true;
  } else { // restart
    update_last_and_best_lap_time();

    laptime.append(current_lap_time);
  }
  t_lap.append(tv_initial);
}

void Chrono::stop(void)
{
  running = false;
}

/*
void Chrono::etap(void)
void Chrono::etap(int nb)
{

}
*/

void Chrono::show(void)
{
  std::cout << "Show laptime" << std::endl;
  for (int i = 0 ; i < laptime.count() ; ++i) {
    std::cout << "Lap " << i << "=" << qPrintable(getStrTimeMSsXxx(laptime[i])) << std::endl;
  }

  for (int i = 1 ; i <= laptime.count() ; ++i) {
    struct timeval tv;
    timeval_subtract(&tv, &t_lap[i], &t_lap[i-1]);
    std::cout << "Lap v2 " << i-1 << "=" << qPrintable(getStrTimeMSsXxx(tv)) << std::endl;
  }
}

/*
void Chrono::start_stop(void)
{
  if (running)
    {
      gettimeofday(&tv_current, NULL);
    }
  else
    {
      gettimeofday(&tv_initial, NULL);
      timeval_subtract(&tv_initial, &tv_initial, &current_lap_time);
    }
 
  running = !running;
}
*/

void Chrono::clear(void)
{
  gettimeofday(&tv_initial, NULL);
  //gettimeofday(&tv_current, NULL); // FiXeD = use memcpy
  memcpy(&tv_current, &tv_initial, sizeof(struct timeval)); // copy from initial to current (<---)
}

bool Chrono::is_running(void)
{
  return running;
}

/*
void Chrono::get_current_time(struct timeval * time)
{
  //timeval_subtract (&tv_diff, &tv_current, &tv_ini);
  timeval_subtract (time, &tv_current, &tv_initial);
}
*/


struct timeval Chrono::get_current_lap_time(void)
  {
    if (running)
      {
        gettimeofday(&tv_current, NULL);
      }
    timeval_subtract(&current_lap_time, &tv_current, &tv_initial);
    return current_lap_time;
  };


/*
struct timeval Chrono::get_current_etap_time(void)
  {
// temps intermédiaire ; temps de passage ; temps partiel
// split time ; etap time ; partial time
// http://www.lexique-jo.org/liste4.cfm?rubrique=CYCL
    if (running)
      {
        gettimeofday(&tv_current, NULL);
      }
    timeval_subtract(&current_etap_time, &tv_current, &tv_interm);
    return current_etap_time;
  };
*/

struct timeval Chrono::get_last_lap_time(void)
  {
    return last_lap_time;
  };

struct timeval Chrono::get_best_lap_time(void)
  {
    return best_lap_time;
  };


QString Chrono::getStrTimeMSsXxx(struct timeval tv)
{
  if ( tv.tv_sec < 10*60 )
    {
      QString strTime;
      strTime = getStrTimeMmSsXxx(tv);
      strTime.remove(0,1);
      return strTime;
    }
  else
    {
      return QLatin1String("0:00.000"); //return QString("0:00.000");
    }
}

QString Chrono::getStrTimeMmSsXxx(struct timeval tv)
{
  // see http://www.quepublishing.com/articles/article.asp?p=23618&seqNum=8&rl=1
  QString strTime;
  ptm = localtime (&tv.tv_sec);
  strftime (time_string, sizeof (time_string), "%M:%S", ptm); //"%Y-%m-%d %H:%M:%S"
  milliseconds = tv.tv_usec / 1000;
  strTime.sprintf("%s.%03ld", time_string, milliseconds);
  return strTime;
}

QString Chrono::getStrCurrentLapTime(void)
{
  return getStrTimeMSsXxx(get_current_lap_time());
  //return getStrTimeMSsXxx(current_lap_time);
}

QString Chrono::getStrBestLapTime(void)
{
  return getStrTimeMSsXxx(get_best_lap_time());
}

QString Chrono::getStrLastLapTime(void)
{
  return getStrTimeMSsXxx(get_last_lap_time());
}

void Chrono::update_last_and_best_lap_time(void)
{
  if ( is_running() )
    {
      const struct timeval current = current_lap_time;
      const struct timeval last = last_lap_time;
      const struct timeval best = best_lap_time;


      if ( timeval_subtract(&diff_best, &current, &best_lap_time) ) // meilleur temps au tour (calcul ecart)
        {
          std::cout << qPrintable(tr("record du tour battu")) << std::endl;
          memcpy(&best_lap_time, &current, sizeof(struct timeval));
        } else
        {
          std::cout << qPrintable(tr("toujours le même record du tour")) << std::endl;
          memcpy(&best_lap_time, &best, sizeof(struct timeval));
        }


      if ( timeval_subtract(&diff_last, &current, &last_lap_time) ) // calcul ecart par rapport au dernier tour
        {
          std::cout << qPrintable(tr("dernier temps au tour battu")) << std::endl;

        } else
        {
          std::cout << qPrintable(tr("dernier temps au tour non battu")) << std::endl;
        }
      memcpy(&last_lap_time, &current, sizeof(struct timeval)); // temps du dernier tour

    }
}


/* About Time and Linux
http://www.haypocalc.com/wiki/Temps
*/

QDomElement Chrono::to_node( QDomDocument &dom_doc )
{
  QDomElement dom_elt = dom_doc.createElement( QLatin1String("chrono") );

  /*
    QString strBuf;
    dom_elt.setAttribute( "valueDegreeC", strBuf.setNum( m_T ) );
  */

  return dom_elt;
}

void Chrono::reset(void)
{
  stop();
  clear();

  // best lap time
  best_lap_time = max_lap_time();

  // last lap time
  last_lap_time = max_lap_time();
}

