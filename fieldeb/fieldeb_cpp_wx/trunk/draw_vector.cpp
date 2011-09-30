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


#include "draw_vector.hpp"

#include "math.h"

void Draw_Vector::Draw(wxWindowDC *dc)
{
    //wxPen pen = wxPen("BLACK",1,wxSOLID);
    //wxPen pen = wxPen("RED",1,wxSOLID);
    wxPen pen = wxPen(get_color(),1,wxSOLID);
    dc->SetPen(pen);

    if ( get_len() !=0 ) // not null vector
    {
        dc->DrawLine((wxCoord) get_x(),
                     (wxCoord) get_y(),
                     (wxCoord) ( get_x() + get_ux() ),
                     (wxCoord) ( get_y() + get_uy() ));

        float Len = 0;
        if (!get_variable_len()) // Len is the len of the 2 shorts segments of an arrow
        {
            Len = get_arrow_len();
        }
        else
        {
            Len = get_len() / get_arrow_ratio();
        }


        float epsilonX;
        float epsilonY;

        epsilonX = Len * cos(get_arrow_angle() + get_angle());
        epsilonY = Len * sin(get_arrow_angle() + get_angle());
        dc->DrawLine((wxCoord) (get_x() + get_ux()),
                     (wxCoord) (get_y() + get_uy()),
                     (wxCoord) (get_x() + get_ux() - epsilonX),
                     (wxCoord) (get_y() + get_uy() - epsilonY) );

        epsilonX = Len * cos(get_arrow_angle() - get_angle());
        epsilonY = Len * sin(get_arrow_angle() - get_angle());
        dc->DrawLine((wxCoord) (get_x() + get_ux()),
                     (wxCoord) (get_y() + get_uy()),
                     (wxCoord) (get_x() + get_ux() - epsilonX),
                     (wxCoord) (get_y() + get_uy() + epsilonY));

    }
    else
    {
        // null vector
        // drawpoint ?
    }

    // TO DO
}



double Draw_Vector::get_len(void)
{
    return sqrt(get_ux()*get_ux() + get_uy()*get_uy()); // + get_uz()*get_uz());
}

double Draw_Vector::get_angle(void)
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
        return acos(get_ux()/get_len());

    }

    if (get_ux()<0)
    {
        return 2 * 3.14 - acos(get_ux() / get_len());
    }

    else //y_end-y_start==0
    {
        return 0;
    }
}
