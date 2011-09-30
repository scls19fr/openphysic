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

#ifndef PARTIE_HPP
#define PARTIE_HPP

class Partie {
public:
  Partie();
  bool partie_en_cours(void);
  bool point_en_cours(void);
  void nouveau_point_a_jouer(void);
  int get_score(int player);
  int get_winner_match(void);
  void marque_point(int player);
  void afficher_score(void);

  bool jamais_perdre(void);
  void set_jamais_perdre(void);
  void unset_jamais_perdre(void);

private:
  int m_winner_point;
  int m_point_max;
  int m_p1_score;
  int m_p2_score;
  bool m_jamais_perdre;
};

#endif
