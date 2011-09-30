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

#ifndef DRAW_VECTOR_HPP
#define DRAW_VECTOR_HPP

#include <wx/wx.h>



/**
 * A sort of vector that is usefull to represent a field (electrical or magnetic).
 * It supports two kinds of modes
 *  - constant length
 *  - variable length
 */
class Draw_Vector
{
public:
    /*
    Draw_Vector()
      {      
        set_x(0);
        set_y(0);
        set_z(0);

        set_ux(0);
        set_uy(0);
        set_uz(0);

        set_arrow_len(10);
        set_arrow_angle(20);
        set_arrow_ratio(10);

        set_width(1);
       
        Draw_Vector(0,0,0,0,0,0);
      }
    */

    Draw_Vector(double const x, double const y, double const z, double const ux, double const uy, double const uz)
    {
        set_x(x);
        set_y(y);
        set_z(z);

        set_ux(ux);
        set_uy(uy);
        set_uz(uz);

        set_arrow_len(5);
        set_arrow_angle(20);
        set_arrow_ratio(10);

        set_width(1);

        set_variable_len(false);

        set_color("BLACK");
    }

    /*
    Draw_Vector(double x, double y, double ux, double uy)
      {
        
        set_x(x);
        set_y(y);
        set_z(0);

        set_ux(ux);
        set_uy(uy);
        set_uz(0);

        set_arrow_len(10);
        set_arrow_angle(20);
        set_arrow_ratio(10);

        set_width(1);
        
        Draw_Vector(x,y,0,ux,uy,0);
      }
    */

    double get_len(void);
    double get_angle(void);

    void Draw(wxWindowDC *dc);



    void set_x(double const value)
    {
        m_x = value;
    }

    void set_y(double const value)
    {
        m_y = value;
    }

    void set_z(double const value)
    {
        m_z = value;
    }



    double get_x(void) const
    {
        return m_x;
    }

    double get_y(void) const
    {
        return m_y;
    }

    double get_z(void) const
    {
        return m_z;
    }




    void set_ux(double const value)
    {
        m_ux = value;
    }

    void set_uy(double const value)
    {
        m_uy = value;
    }

    void set_uz(double const value)
    {
        m_uz = value;
    }


    double get_ux(void) const
    {
        return m_ux;
    }

    double get_uy(void) const
    {
        return m_uy;
    }

    double get_uz(void) const
    {
        return m_uz;
    }



    double get_width(void) const
    {
        return m_width;
    }



    double get_arrow_len(void) const
    {
        return m_arrow_len;
    }

    void set_arrow_len(double const value)
    {
        m_arrow_len = value;
    }



    double get_arrow_ratio(void) const
    {
        return m_arrow_ratio;
    }

    void set_arrow_ratio(double const value)
    {
        m_arrow_ratio = value;
    }



    double get_arrow_angle(void) const
    {
        return m_arrow_angle;
    }

    void set_arrow_angle(double const value)
    {
        m_arrow_angle = value;
    }



    void set_width(double const value)
    {
        m_width = value;
    }



    void set_variable_len(void)
    {
        m_variable_len = true;
    }

    void unset_variable_len(void)
    {
        m_variable_len = false;
    }

    void set_variable_len(bool const value)
    {
        m_variable_len = value;
    }

    bool get_variable_len(void) const
    {
        return m_variable_len;
    }



    wxColor get_color(void) const
    {
        return m_color;
    }

    void set_color(wxColor const value)
    {
        m_color = value;
    }


protected:

private:
    double m_x;
    double m_y;
    double m_z;

    double m_ux;
    double m_uy;
    double m_uz;

    float m_width;

    float m_arrow_len;
    float m_arrow_angle;
    float m_arrow_ratio;

    bool m_variable_len;

    wxColor m_color;
    // TO_DO : color wxColor & bool

};

#endif // DRAW_VECTOR_HPP
