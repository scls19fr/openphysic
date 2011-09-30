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

/**
 *
 * @author scls
 */
public class CAppData
{

      public enum Mode { E, B };
      public enum Show { Field, FieldLines, Equipotentials };
      public enum Draw { Vectors, Grains };
      public enum Color { Colors, BlackWhiteGray, BlackWhite };

      private Mode m_mode = Mode.E;
      private Show m_show = Show.Field;
      private Draw m_draw = Draw.Grains;
      private Color m_color = Color.Colors;

      /** Creates a new instance of CAppData */
      public CAppData()
      {}



      public void set_mode(Mode mode)
      {
            m_mode = mode;
      }

      public void set_show(Show show)
      {
            m_show = show;
      }

      public void set_draw(Draw draw)
      {
            m_draw = draw;
      }

      public void set_color(Color color)
      {
            m_color = color;
      }



      public Mode get_mode()
      {
            return m_mode;
      }

      public Show get_show()
      {
            return m_show;
      }

      public Draw get_draw()
      {
            return m_draw;
      }

      public Color get_color()
      {
            return m_color;
      }


}
