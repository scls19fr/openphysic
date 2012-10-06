/*
Browser
Copyright (C) 2012  Sebastien Celles

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

#include "display.h"

#include <QDebug>

Display::Display(QObject *parent) :
    QObject(parent)
{
  m_playing = true;
  m_page = 0;

  Slide s;
  s.title = QString("Title of this slide 0");
  s.url = QString("http://www.google.fr?q=test0");
  s.message = QString("Message of this slide");
  arraySlide->append(s);

  m_N = 3;
}

void Display::play(void)
{
  m_playing = true;
  //reset_timer();
}

void Display::pause(void)
{
  m_playing = false;
  //reset_timer();
}

void Display::playpause(void)
{
  m_playing = !m_playing;
  //reset_timer();
}

void Display::next(void)
{
  qDebug() << "next";
  if (m_page<m_N-1) {
    m_page++;
  } else {
    m_page=0;
  }
}

void Display::previous(void)
{
  qDebug() << "previous";
  if (m_page>0) {
    m_page--;
  } else {
    m_page=m_N-1;
  }
}

quint8 Display::page(void) const
{
   return m_page;
}


void Display::print(void)
{
    qDebug() << "page/N =" << m_page+1 << "/" << m_N;
}
