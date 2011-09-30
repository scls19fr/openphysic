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

#include "rpm.h"
//

//#include "engine_state.h"

#include <iostream>

Rpm::Rpm(  )
{
//  set(0.0);
//  set(100.0);
  setMax(16000.0);
  setMin(0.0);

/*
  connect(this, SIGNAL( changed(double) ),
          this, SLOT( on_changed() ) );
*/
}

double Rpm::value(void) const
  {
    return m_RPM;
  }

void Rpm::set(double const RPM)
  {
/*
    const double rpmOff = 50;
    const double rpmIdle = 150;

    if ( RPM <= rpmOff && m_RPM>rpmOff )
      {
        emit switched_off;
      }
    else if ( RPM < rpmIdle )
      {

      }
*/
    if (m_RPM!=RPM) {
      m_RPM=RPM;
      emit changed(m_RPM);
    }
  }

/*
    const double rpmOff = 50;
    const double rpmIdle = 150;

    if ( RPM < rpmOff )
      {
        //m_engine_state->switch_off();
        //m_engine_state->set_idle();
      }
    else if ( RPM < rpmIdle )
      {
        //m_engine_state->switch_on();
        //m_engine_state->set_to_idle();
      }
    else
      {
        //m_engine_state->switch_on();
        //m_engine_state->unset_idle();
      }

  }
*/

void Rpm::on_changed(void)
  {
    std::cout << "RPM changed" << std::endl;
  }

double Rpm::max(void) const
  {
    return m_RPMmax;
  }

void Rpm::setMax(double const RPM)
{
  m_RPMmax=RPM;
}


double Rpm::min(void) const
  {
    return m_RPMmin;
  }

void Rpm::setMin(double const RPM)
{
  m_RPMmin=RPM;
}

/*
double Rpm::Off(void) const
  {
    return m_RPMoff;
  }

void Rpm::setOff(double const RPM)
{
  m_RPMoff=RPM;
}

double Rpm::Idle(void) const
  {
    return m_RPMidle;
  }

void Rpm::setIdle(double const RPM)
{
  m_RPMidle=RPM;
}
*/


QDomElement Rpm::to_node( QDomDocument &dom_doc )
{
  QDomElement dom_elt = dom_doc.createElement( QLatin1String("rpm") );

  QString strBuf;
  dom_elt.setAttribute( QLatin1String("value"), strBuf.setNum( m_RPM ) );
  dom_elt.setAttribute( QLatin1String("min"), strBuf.setNum( m_RPMmin ) );
  dom_elt.setAttribute( QLatin1String("max"), strBuf.setNum( m_RPMmax ) );

  return dom_elt;
}

