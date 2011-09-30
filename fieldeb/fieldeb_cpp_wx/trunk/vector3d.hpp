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

#ifndef VECTOR3D_HPP
#define VECTOR3D_HPP

#include <iostream>  // Debug (C++ syntax) with cout << "DEBUG: " << x << "\n";
using namespace std;

/**
 * An objet that contain a 3d vector and overload some operators such as + - * dot product and cross product.
 */
class Vector3d
{
public:
    Vector3d( )
    {
        //cout << "DEBUG: " << "Vector3d 1" << "\n";
        set_x(0);
        set_y(0);
        set_z(0);
    }

    Vector3d( double const x, double const y, double const z )
    {
        //cout << "DEBUG: " << "Vector3d 2" << "\n";
        set_x(x);
        set_y(y);
        set_z(z);
    }

    Vector3d( double const x, double const y )
    {
        //cout << "DEBUG: " << "Vector3d 3" << "\n";
        set_x(x);
        set_y(y);
        set_z(0);
    }

    void set_x(double const x)
    {
        m_x=x;
    }

    void set_y(double const y)
    {
        m_y=y;
    }

    void set_z(float const z)
    {
        m_z=z;
    }

    double get_x() const
    {
        return m_x;
    }

    double get_y() const
    {
        return m_y;
    }

    double get_z() const
    {
        return m_z;
    }

protected:

private:
    double m_x;
    double m_y;
    double m_z;
};

#endif // VECTOR3D_HPP
