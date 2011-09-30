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
public class CRectangle implements IDrawable
{
      private double m_x = 0;
      private double m_y = 0;

      private double m_width = 10;
      private double m_height = 10;

      private Color m_color = Color.black;


      /** Creates a new instance of CRectangle */
      public CRectangle()
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


      Color get_color()
      {
            return m_color;
      }

      void set_color(Color value)
      {
            m_color = value;
      }


      double get_width()
      {
            return m_width;
      }

      void set_width(double value)
      {
            m_width = value;
      }

      double get_height()
      {
            return m_height;
      }

      void set_height(double value)
      {
            m_height = value;
      }




      public Rectangle getRectangle()
      {
            Rectangle rect = new Rectangle();
            return rect;
      }

      public void draw(Graphics g)
      {

            g.setColor(get_color());

            g.fillRect(
                  (int) ( get_x() - get_width()/2 ),
                  (int) ( get_y() - get_height()/2 ),
                  (int) ( get_width() ),
                  (int) ( get_height() )
            );
      }
}
