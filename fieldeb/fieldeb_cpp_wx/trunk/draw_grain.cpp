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


#include "draw_grain.hpp"

#include "math.h"

void Draw_Grain::Draw(wxWindowDC *dc)
{
    //wxPen pen = wxPen("BLACK",1,wxSOLID);
    wxPen pen = wxPen(get_color(),1,wxSOLID);
    dc->SetPen(pen);


    double r_u = sqrt ( get_ux() * get_ux()
                        + get_uy() * get_uy()
                        + get_uz() * get_uz() );

    if ( r_u != 0 ) // Not null direction vector
    {
        dc->DrawLine(
            (int) ( get_x() - get_len()/2 * get_ux() / r_u ),
            (int) ( get_y() - get_len()/2 * get_uy() / r_u ),
            (int) ( get_x() + get_len()/2 * get_ux() / r_u ),
            (int) ( get_y() + get_len()/2 * get_uy() / r_u )
        );
    }

}


