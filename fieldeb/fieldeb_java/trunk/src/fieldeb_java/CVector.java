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
 *
 * @author scls
 */
public class CVector implements IDrawable
{

      double m_x;
      double m_y;

      double m_ux;
      double m_uy;

      double m_width;

      double m_arrow_len;
      double m_arrow_angle;
      double m_arrow_ratio;

      boolean m_variable_len;

      Color m_color;

      /** Creates a new instance of CVector */
      public CVector()
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



      double get_arrow_len()
      {
            return m_arrow_len;
      }

      void set_arrow_len(double value)
      {
            m_arrow_len = value;
      }



      double get_arrow_ratio()
      {
            return m_arrow_ratio;
      }

      void set_arrow_ratio(double value)
      {
            m_arrow_ratio = value;
      }



      double get_arrow_angle()
      {
            return m_arrow_angle;
      }

      void set_arrow_angle(double value)
      {
            m_arrow_angle = value;
      }



      void set_width(double value)
      {
            m_width = value;
      }



      void set_variable_len()
      {
            m_variable_len = true;
      }

      void unset_variable_len()
      {
            m_variable_len = false;
      }

      void set_variable_len(boolean value)
      {
            m_variable_len = value;
      }

      boolean get_variable_len()
      {
            return m_variable_len;
      }



      Color get_color()
      {
            return m_color;
      }

      void set_color(Color value)
      {
            m_color = value;
      }


      double get_len()
      {
            return Math.sqrt(get_ux()*get_ux() + get_uy()*get_uy()); // + get_uz()*get_uz());
      }

      double get_angle()
      {
            // return the angle between x (horizontal up) and vector
            // return value belongs to 0->360 degree or 0->2*pi rad
            // use the cos to get a value between 0 and 180 deg
            // trick with sign of delta y to get angle between 180 and 360 deg
            // result is given in rad
            // error code is -1

            if ( get_len() == 0 )
            {
                  // null vector
                  // should return undef (coded by -1)
                  return -1;
            }

            if (get_ux()>0)
            {
                  return Math.acos(get_ux()/get_len());

            }

            if (get_ux()<0)
            {
                  return 2 * 3.14 - Math.acos(get_ux() / get_len());
            }
            else //y_end-y_start==0
            {
                  return 0;
            }
      }



      public Rectangle getRectangle()
      {
            Rectangle rect = new Rectangle();
            return rect;
      }

      public void draw(Graphics g)
      {

            g.setColor(get_color());


            if ( get_len() !=0 ) // not null vector
            {
                  g.drawLine((int) get_x(),
                             (int) get_y(),
                             (int) ( get_x() + get_ux() ),
                             (int) ( get_y() + get_uy() )
                            );

                  double Len = 0;
                  if (!get_variable_len()) // Len is the len of the 2 shorts segments of an arrow
                  {
                        Len = get_arrow_len();
                  } else
                  {
                        Len = get_len() / get_arrow_ratio();
                  }


                  double epsilonX;
                  double epsilonY;

                  epsilonX = Len * Math.cos(get_arrow_angle() + get_angle());
                  epsilonY = Len * Math.sin(get_arrow_angle() + get_angle());

                  g.drawLine((int) (get_x() + get_ux()),
                             (int) (get_y() + get_uy()),
                             (int) (get_x() + get_ux() - epsilonX),
                             (int) (get_y() + get_uy() - epsilonY) );



                  epsilonX = Len * Math.cos(get_arrow_angle() - get_angle());
                  epsilonY = Len * Math.sin(get_arrow_angle() - get_angle());

                  g.drawLine((int) (get_x() + get_ux()),
                             (int) (get_y() + get_uy()),
                             (int) (get_x() + get_ux() - epsilonX),
                             (int) (get_y() + get_uy() + epsilonY)
                            );

            } else
            {
                  // null vector
                  // drawpoint ?
            }


      }



}
