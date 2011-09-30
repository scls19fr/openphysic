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

#include "balle.h"
#include "espace.h"

#include <iostream>
using namespace std;

#include <cstdlib> // random
#include <ctime> // pour initialiser le générateur aléatoire

#include "random-singleton.h" // http://ktd.club.fr/programmation/cpp-random.php


Balle::Balle(Espace *espace)
{
  //cout << "Nouvelle balle" << endl;
  m_radius = 3;



  //cout << "Avant lancement" << this->get_x() << "\t" << this->get_y() << endl;

  initialiser_vitesse(); //0.3; //speed

  //lancer();

  //cout << "Après lancement" << this->get_x() << "\t" << this->get_y() << endl;
}

void Balle::initialiser_vitesse(void)
{
  m_v = 0.1;
}

void Balle::lancer(Espace *espace)
{
  initialiser_vitesse();

  m_x = espace->get_x()/2.0;
  m_y = espace->get_y()/2.0;

  double const pi = 4*atan(1.0);
  double angle;

  /* fixe */
  //angle = pi/4; //45°

  /* multiple de pi/4 */
  //srand(static_cast<unsigned>(time(0)));
  //int random_nb = rand();
  //angle = random_nb*pi/2+pi/4;

  /* quelconque */
  //srand(static_cast<unsigned>(time(0)));
  //int random_nb = rand();
  //angle = random_nb*pi/255;



  // Utilisation du générateur aléaoire de Pierre Chatelier
  // http://ktd.club.fr/programmation/cpp-random.php


  srand(static_cast<unsigned>(time(0)));
  int random_integer = rand();
  Random::Randomize(random_integer);
  //double random_nb = Random::Uniform<double>(0, 1);

  double random_player = Random::Uniform<int>(1,2); // numéro du joueur qui reçoit
  //cout << "Player " << random_player << endl;

  double random_nb;

  do
    {
      random_nb = Random::Gaussian(0.0, 0.678);
      angle = random_nb*90;
    }
  while ( angle >= 80 || angle <= -80 || ( angle <= 10 && angle >= -10 ) );

  //angle += frac(random_integer/2);

  //cout << "lancer()\t" << random_nb << "\t" << angle << endl;

  angle += 180 * (random_player-1);

  m_vx = m_v*cos(angle*pi/180);
  m_vy = m_v*sin(angle*pi/180);
}

double Balle::get_x(void)
{
  return m_x;
}

double Balle::get_y(void)
{
  return m_y;
}

double Balle::get_radius(void)
{
  return m_radius;
}

double Balle::get_angle()
{
  double const pi = 4*atan(1.0);

  double theta;
  if (m_vx!=0)
    theta = atan(m_vy/m_vx); // angle de tir (0 quand horizontal)
  else
    if (m_vy>0)
      theta = -pi/2;
    else if (m_vy<0)
      theta = +pi/2;
    else
      theta = 0;

  return theta;
}

void Balle::move(Espace *espace, Raquette *r_p1, Raquette *r_p2, double delta_t, Partie *partie)
{
  //cout << this->get_x() << "\t" << this->get_y() << endl;

  //winner=0;
  // TO_FIX ?


  m_x += m_vx*delta_t;
  m_y += m_vy*delta_t;
 

  // Collision bordures
  if (m_x-m_radius < 0) // gauche
    {
      // P1 perd - P2 gagne (balle à gauche)
      
      if ( !partie->jamais_perdre() )
	partie->marque_point(2);

      m_x = m_radius;
      m_vx = -m_vx;

      //cout << "theta=" << get_angle() << endl;
    }

  if (m_x+m_radius > espace->get_x()) // droite
    {
      // P2 perd - P1 gagne (balle à droite)
      if ( !partie->jamais_perdre() )
	partie->marque_point(1);

      m_x = espace->get_x()-m_radius;
      m_vx = -m_vx;

      //cout << "theta=" << get_angle() << endl;
    }

  if (m_y-m_radius < 0) // rebond (balle en haut)
    {  
      m_y = m_radius;
      m_vy = -m_vy;
      //cout << "theta=" << get_angle() << endl;
    }

  if (m_y+m_radius > espace->get_y()) // rebond (balle en bas)
    {
      m_y = espace->get_y()-m_radius;
      m_vy = -m_vy;
      //cout << "theta=" << get_angle() << endl;
    }


  // Collision raquettes

  if (m_x < espace->get_x()/2.0
      && m_vx < 0
      && m_x - m_radius <= ( r_p1->get_x() + r_p1->get_xsize()/2.0 )
      && m_x > r_p1->get_x()
      && m_y + m_radius >= ( r_p1->get_y() - r_p1->get_ysize()/2.0 )
      && m_y - m_radius <= ( r_p1->get_y() + r_p1->get_ysize()/2.0 )
      )
    {
      // Collision raquette gauche (player1)
      m_vx = -m_vx;

      // Effet balle-raquette

      /*
	L'objectif de cette partie est de rendre la trajectoire de
	la balle plus verticale lorsque la balle frappe le coin de
	la raquette.
	Le rebond est normal lorsque la balle frappe le centre de
	la raquette
      */
	 
      //cout << "theta=" << get_angle() << endl;


      //double ecart_y_p1 = m_y - r_p1->get_y();
      //ecart_y_p1 = ecart_y_p1/(r_p1->get_ysize()/2.0)*90;
      //m_vx = m_vx*cos(ecart_y_p1*pi/180);
      //m_vy = m_vy*sin(ecart_y_p1*pi/180);

      this->accelerer();
    }

  if (m_x > espace->get_x()/2.0
      && m_vx > 0
      && m_x + m_radius >= ( r_p2->get_x() - r_p2->get_xsize()/2.0 )
      && m_x < r_p2->get_x()
      && m_y + m_radius >= ( r_p2->get_y() - r_p2->get_ysize()/2.0 )
      && m_y - m_radius <= ( r_p2->get_y() + r_p2->get_ysize()/2.0 )
      )
    {
      // Collision raquette droite (player2)
      m_vx = -m_vx;

      // Effet balle-raquette

      //cout << "theta=" << get_angle() << endl;

      //m_vx = m_vy;
      //m_vy = m_vy;

      this->accelerer();
    }
}

void Balle::accelerer(void)
{
  double const acceleration = 1.02; // en pour cent
  m_v *= acceleration;
  m_vx *= acceleration;
  m_vy *= acceleration;
}
