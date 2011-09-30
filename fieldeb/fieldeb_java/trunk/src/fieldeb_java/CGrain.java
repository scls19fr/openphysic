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

import java.awt.Graphics;
import java.awt.Rectangle;
import java.awt.Color;


/**
 * Graine : segment de taille constante ayant la faculté de se tourner selon
 * le champ (E ou B)
 * @author scls
 */
public class CGrain implements IDrawable
{

      private double m_x = 0;
      private double m_y = 0;

      private double m_ux = 0;
      private double m_uy = 0;

      private double m_width = 1;
      private double m_len = 10;

      private Color m_color = Color.black;

      /** Creates a new instance of CGrain */
      public CGrain()
      {}


      void set_x(double value)
      {
            m_x = value;
      }

      void set_y(double value)
      {
            m_y = value;
      }


      double get_x()
      {
            return m_x;
      }

      double get_y()
      {
            return m_y;
      }


      void set_ux(double value)
      {
            m_ux = value;
      }

      void set_uy(double value)
      {
            m_uy = value;
      }


      double get_ux()
      {
            return m_ux;
      }

      double get_uy()
      {
            return m_uy;
      }



      double get_width()
      {
            return m_width;
      }

      double get_len()
      {
            return m_len;
      }

      void set_len(double value)
      {
            m_len = value;
      }

      void set_width(double value)
      {
            m_width = value;
      }



      Color get_color()
      {
            return m_color;
      }

      void set_color(Color value)
      {
            m_color = value;
      }



      public Rectangle getRectangle()
      {
            Rectangle rect = new Rectangle();
            return rect;
      }

      public void draw(Graphics g)
      {
            g.setColor(this.m_color);


            double r_u = Math.sqrt (  get_ux() * get_ux()
                                      + get_uy() * get_uy()
                                   );

            if ( r_u != 0 ) // Not null direction vector
            {
                  g.drawLine(
                        (int) ( get_x() - get_len()/2 * get_ux() / r_u ),
                        (int) ( get_y() - get_len()/2 * get_uy() / r_u ),
                        (int) ( get_x() + get_len()/2 * get_ux() / r_u ),
                        (int) ( get_y() + get_len()/2 * get_uy() / r_u )
                  );
            }

      }

}
