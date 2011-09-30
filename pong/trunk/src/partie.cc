/**************************************************************************
 *   Copyright (C) 2005 by Sebastien CELLES                                *
 *   s.cls@laposte.net                                                     *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ***************************************************************************/

#include "partie.h"

#include <iostream>
using namespace std;

#include "error.h"


Partie::Partie()
{
  m_point_max = 5;
  m_winner_point = 0;
  m_p1_score = 0;
  m_p2_score = 0;
  
  m_jamais_perdre = false;
}

bool Partie::partie_en_cours(void)
{
  return ( (m_p1_score < m_point_max) && (m_p2_score < m_point_max) );
}


bool Partie::point_en_cours(void)
{
  return (m_winner_point==0);
}

void Partie::nouveau_point_a_jouer(void)
{
  m_winner_point=0;
}


int Partie::get_score(int player)
{
  if (player==1)
    {
      return m_p1_score;
    }
  else if (player==2)
    {
      return m_p2_score;
    }
  else
    {
      throw Error::error("get_score_exception");
    }
}

int Partie::get_winner_match(void)
{
  if (m_p1_score>m_p2_score && m_p1_score>=m_point_max)
    {
      return 1;
    }
  else if (m_p2_score>m_p1_score && m_p2_score>=m_point_max)
    {
      return 2;
    }
  else
    {
      return 0;
    }
}


void Partie::marque_point(int player)
{
  if (player==1)
    {
      m_p1_score++;
      m_winner_point=1;
    }
  else if (player==2)
    {
      m_p2_score++;
      m_winner_point=2;
    }
}


void Partie::afficher_score(void)
{
  if (!partie_en_cours())
    {
      cout << "Joueur 1 : " << get_score(1) << " - " << "Joueur 2 : " << get_score(2) << endl;
    }
  else
    {
      cout << "Le match n'est pas terminé !" << endl;
    }
}

bool Partie::jamais_perdre(void)
{
  return m_jamais_perdre;
}


void Partie::set_jamais_perdre(void)
{
  m_jamais_perdre = true;
}

void Partie::unset_jamais_perdre(void)
{
  m_jamais_perdre = false;
}
