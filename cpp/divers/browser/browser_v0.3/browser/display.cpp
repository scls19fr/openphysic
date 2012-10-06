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

  Slide *s;
  s = new Slide();
  arraySlide = new QVector<Slide *>();

  s->title = QString("Title of this slide 0");
  s->url = QString("http://www.google.fr?q=test0");
  s->message = QString("Message of slide 0");
  //s->delay = 2000;
  arraySlide->append(s);

  s = new Slide();
  s->title = QString("Title of this slide 1");
  s->url = QString("http://www.google.fr?q=test1");
  s->message = QString("Message of slide 1");
  //s->delay = 3000;
  arraySlide->append(s);

  s = new Slide();
  s->title = QString("Title of this slide 2");
  s->url = QString("http://www.google.fr?q=test2");
  s->message = QString("Message of slide 2");
  //s->delay = 4000;
  arraySlide->append(s);

  /*
  s->title = QString("GTE 1 - S1-S2");
  s->url = QString("https://upplanning.appli.univ-poitiers.fr/ade/custom/modules/plannings/direct_planning.jsp?login=visu&password=visu&showTree=false&showPianoDays=false&showPianoWeeks=false&showOptions=false&days=0,1,2,3,4&displayConfName=IUTP-Campus (GTE) affichage lim&code=_Z1PT11_TP1,_Z1PT11_TP2,_Z1PT11_TP3,_Z1PT11_TP4,_Z1PT11_TP5,_Z1PT11_TP6&projectId=3");
  arraySlide->append(s);

  s = new Slide();
  s->title = QString("GTE 2 - S3");
  s->url = QString("https://upplanning.appli.univ-poitiers.fr/ade/custom/modules/plannings/direct_planning.jsp?login=visu&password=visu&showTree=false&showPianoDays=false&showPianoWeeks=false&showOptions=false&days=0,1,2,3,4&displayConfName=IUTP-Campus (GTE) affichage lim&code=_Z2PT11_S3_TP1,_Z2PT11_S3_TP2,_Z2PT11_S3_TP3,_Z2PT11_S3_TP4,_Z2PT11_S3_TP5&projectId=3");
  arraySlide->append(s);

  s = new Slide();
  s->title = QString("LP VERTE");
  s->url = QString("https://upplanning.appli.univ-poitiers.fr/ade/custom/modules/plannings/direct_planning.jsp?login=visu&password=visu&showTree=false&showPianoDays=false&showPianoWeeks=false&showOptions=false&days=0,1,2,3,4&displayConfName=IUTP-Campus (GTE) affichage lim&code=_ZWP041_TP1FI,_ZWP041_TP1FA,_ZWP041_TP2FI,_ZWP041_TP2FA&projectId=3");
  arraySlide->append(s);
  */


  m_N = arraySlide->count();
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
  //qDebug() << "next";
  if (m_page<m_N-1) {
    m_page++;
  } else {
    m_page=0;
  }
}

void Display::previous(void)
{
  //qDebug() << "previous";
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

quint8 Display::pageTotal(void) const
{
   return m_N;
}

bool Display::isPlaying(void) const
{
   return m_playing;
}

void Display::print(void)
{
    qDebug() << "page/N =" << m_page+1 << "/" << m_N;

    for (int i=0;i<m_N;i++) {
        qDebug() << i << ":" << arraySlide->at(i)->title;
    }
}
