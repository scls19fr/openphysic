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

#include "engine_state.h"
//

Engine_State::Engine_State(  )
{
  m_on = false; // motor is off
  m_idle = true; // motor is idle


  connect(this, SIGNAL( switched_on() ),
          this, SIGNAL( changed() ) );

  connect(this, SIGNAL( switched_off() ),
          this, SIGNAL( changed() ) );

  connect(this, SIGNAL( was_set_to_idle() ),
          this, SIGNAL( changed() ) );

  connect(this, SIGNAL( was_unset_to_idle() ),
          this, SIGNAL( changed() ) );


  connect(this, SIGNAL( changed() ),
          this, SLOT( on_changed() ) );

}

void Engine_State::switch_on(void)
{
  if ( !m_on )
  {
    m_on = true;
    emit switched_on();
  }
}

void Engine_State::switch_off(void)
{
  if ( m_on )
  {
    set_to_idle();
    m_on = false;
    emit switched_off();
  }
}

void Engine_State::set_to_idle(void)
{
  if ( !m_idle )
  {
    m_idle = true;
    emit was_set_to_idle();
  }
}

void Engine_State::unset_idle(void)
{
  if ( m_idle )
  {
    m_idle = false;
    emit was_unset_to_idle();
  }
}

int Engine_State::state(void)
{
  if (off()) {
    return 0;
  } else if (on() && idle()) {
    return 1;
  } else if (on() && !idle()) {
    return 2;
  } else {
    return -1;
  }
}

bool Engine_State::on(void)
{
  return m_on;
}

bool Engine_State::off(void)
{
  return !m_on;
}

bool Engine_State::idle(void)
{
  return m_idle;
}


void Engine_State::show(void)
{
  std::cout << "ON " << m_on << " ; " << "IDLE " << m_idle << " ; " << "STATE "<< state() << std::endl;
}

void Engine_State::on_changed(void)
{
  //std::cout << "Engine_State changed" << std::endl;
  show();
}

void Engine_State::change(double RPM)
{
  const double rpmOff = 50; // 50
  const double rpmIdle = 2000; // 150

  if ( RPM < rpmOff )
    {
      switch_off();
      set_to_idle();
    }
  else if ( RPM < rpmIdle )
    {
      switch_on();
      set_to_idle();
    }
  else
    {
      switch_on();
      unset_idle();
    }
}

