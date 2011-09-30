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
 * Vecteur 3D pouvant servir à représenter une position, une vitesse, etc ...
 * @author scls
 */
public class CVector3D
{
      private double m_x = 0;
      private double m_y = 0;
      private double m_z = 0;

      /** Creates a new instance of CVector3D */
      public CVector3D()
      {}

      public CVector3D (double x, double y, double z)
      {
            m_x = x;
            m_y = y;
            m_z = z;
      }



      void set_x(double x)
      {
            m_x = x;
      }

      void set_y(double y)
      {
            m_y = y;
      }

      void set_z(float z)
      {
            m_z = z;
      }



      double get_x()
      {
            return m_x;
      }

      double get_y()
      {
            return m_y;
      }

      double get_z()
      {
            return m_z;
      }

}
