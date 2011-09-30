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

#include "engine.h"
//

//#include "engine_state.h"

//#include "temperature.h"

Engine::Engine(  )
{
  setName(QLatin1String("Engine1")); // tr(?)
  set_two_strokes();

  //rpm.m_engine_state = &engine_state;

  temperature.resize(2);

  connect(&(this->rpm), SIGNAL( changed(double) ),
          &(this->state), SLOT( change(double) ) );

  connect(&(this->state), SIGNAL( changed() ),
          this, SLOT( on_state_changed() ) );

  //t = QTime(0,0,0,0);
  //time = QTime(0,0,0,0);
  //time.start();
}

QString Engine::name(void) const
  {
    return m_name;
  }

void Engine::setName(const QString name)
{
  m_name = name;
}

void Engine::set_two_strokes(void)
{
  m_mode = engine_two_strokes;
}

void Engine::set_four_stroke(void)
{
  m_mode = engine_four_strokes;
}

int Engine::strokes(void) const
  {
    if ( m_mode == engine_two_strokes )
      {
        return 2;
      }
    else if ( m_mode == engine_four_strokes )
      {
        return 4;
      }
    else
      {
        return 0;
      }
  }

int Engine::rpm_factor(void)
{
  if ( m_mode == engine_two_strokes )
    {
      return 2;
    }
  else if ( m_mode == engine_four_strokes )
    {
      return 1;
    }
  else
    {
      return 0;
    }
}

QDomElement Engine::to_node( QDomDocument &dom_doc )
{
  QDomElement dom_elt = dom_doc.createElement( QLatin1String("engine") );

  QString strBuf;

  dom_elt.setAttribute( QLatin1String("name"), name() );
  dom_elt.setAttribute( QLatin1String("strokes"), strBuf.setNum( strokes() ) );

  dom_elt.appendChild( rpm.to_node(dom_doc) );

  QDomElement dom_temperatures = dom_doc.createElement( QLatin1String("temperatures") );
  //dom_temperatures.appendChild( temperature_1.to_node(dom_doc) );
  //dom_temperatures.appendChild( temperature_2.to_node(dom_doc) );
  dom_temperatures.appendChild( temperature[0].to_node(dom_doc) );
  dom_temperatures.appendChild( temperature[1].to_node(dom_doc) );
  dom_elt.appendChild(dom_temperatures);

  return dom_elt;
}

void Engine::on_state_changed(void)
{
  //std::cout << "Test engine" << std::endl;
  //time.show();
  if (state.off()) {
    time.stop();
  } else {
    // engine on (idle or not)
      time.start();
  }
  //time.show();
  std::cout << "Engine time = " << qPrintable(time.toString()) << std::endl;
  //std::cout << qPrintable(time.toString("hh:mm:ss.zzz")) << std::endl;
}
