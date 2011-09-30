/**************************************************************************
 *   Copyright (C) 2006 by Sebastien CELLES                                *
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

package fieldeb_java;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Rectangle;


/**
 * Abstract class that describe an electical charge or an electrical current
 */
public abstract class CChargeCurrent implements IDrawable, IMovable
{

      private double m_charge = 1000;
      private double m_radius = 17;
      private CPosition m_position;
      private boolean m_movable = false;


      /**
       *Constructeur de charge/current par defaut
       */
      /*
      CChargeCurrent(double charge, double radius, double x, double y, double z)
      {
      // Constructeur
      }
      */


      /**
       *Dessiner la charge sur l'ecran
       *@param mode mode d'affichage
       *@return void
       */
      /*
      void Draw(int mode) 
      {

      }
      */



      /**
       *Accesseur sur la charge de la charge
       *@return la charge de la charge
       */
      double get_charge()
      {
            return m_charge;
      }

      /**
       *Modificateur (mutateur) de la charge de la charge
       *@param charge la nouvelle charge de la charge
       */
      void set_charge(double charge)
      {
            m_charge=charge;
      }



      /**
       *Accesseur sur le rayon de la charge
       *@return le rayon de la charge
       */
      double get_radius()
      {
            return m_radius;
      }

      /**
       *Modificateur (mutateur) du rayon de la charge
       *@param radius le nouveau rayon de la charge
       */
      void set_radius(double radius)
      {
            m_radius=radius;
      }



      /**
       *Accesseur sur la mobilite de la charge
       *@return vrai si la charge est deplacable non si elle ne l'est pas
       */
      boolean get_movable()
      {
            return m_movable;
      }

      /**
       *Modificateur de la mobilite de la charge
       *Rend la charge deplacable
       */
      void set_movable()
      {
            m_movable = true;
      }

      /**
       *Modificateur de la mobilite de la charge
       *Rend la charge indeplacable
       */
      void unset_movable()
      {
            m_movable = false;
      }

      /**
       *Modificateur (mutateur) de la mobilite de la charge
       *@param value mobilite de la charge (vrai si elle est mobile non si elle ne l'est pas)
       */
      void set_movable(boolean value)
      {
            m_movable = value;
      }



      void set_position(double x, double y, double z)
      {
            m_position = new CPosition(x, y, z);
      }

      CPosition get_position()
      {
            return m_position;
      }

      public void drawCircle(Graphics g)
      {
            double R = this.get_radius();
            double x = this.get_position().get_x() - R/2;
            double y = this.get_position().get_y() - R/2;


            if ( this.get_charge() < 0 )
            {
                  g.setColor(Color.red);
            }
            else if ( this.get_charge() > 0 )
            {
                  g.setColor(Color.blue);
            }
            else if ( this.get_charge() == 0 )
            {
                  g.setColor(Color.black);
            }

            // fillOval drawOval
            g.fillOval((int) x,
                       (int) y,
                       (int) R,
                       (int) R);
      }

      public void draw(Graphics g)
      {
            drawCircle(g);
      }

      public Rectangle getRectangle()
      {
            Rectangle rect = new Rectangle();
            return rect;
      }

}
