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

#include "charge.hpp"

//#include "position.hpp"
#include <math.h>

//#include <iostream>  // Debug with cout << "print\n"; (C++ syntax)
using namespace std;

/**
 * Drawing a charge
 * @param dc is a drawing context on the frame
 * @param mode is an int that is equal to 0 for E-mode and equal to 1 for B-mode
 * @return void
 * @see Grid::Draw()
 */
void Charge::Draw(wxWindowDC *dc, int mode)
{
    // mode = 0 : E => + / - charge
    // mode = 1 : B => . / x current

    wxPen pen;
    wxBrush brush;

    if ( this->get_charge() < 0 )
    {
        pen = wxPen("BLACK",1,wxSOLID); // "BLACK"='#000000'='RRGGBB'
        brush = wxBrush("RED",2);
    }
    if ( this->get_charge() > 0 )
    {
        pen = wxPen("BLACK",1,wxSOLID);
        brush = wxBrush("BLUE",2);
    }
    if ( this->get_charge() == 0 )
    {
        pen = wxPen("BLACK",1,wxSOLID);
        brush = wxBrush("BLACK",2);
    }

    dc->SetPen(pen);     // contour
    dc->SetBrush(brush); // inside

    Position pos;
    pos = this->get_position();

    dc->DrawCircle( (int) pos.get_x(), (int) pos.get_y(), (int) get_radius() );

    if ( this->get_charge() < 0 )
    {
        if (mode==0)
        {
            // "-"
            //dc->DrawText( wxString("-"), (int) pos.get_x(), (int) pos.get_y() ); // very dirty !
            dc->DrawLine( (int) ( pos.get_x() - get_radius()/2 ) ,
                          (int) ( pos.get_y() ) ,
                          (int) ( pos.get_x() + get_radius()/2 ) ,
                          (int) ( pos.get_y() ) );
        }
        else if (mode==1)
        {
            dc->DrawPoint( (int) ( pos.get_x() ) , (int) ( pos.get_y() ) );
        }
    }
    if ( this->get_charge() > 0 )
    {
        if (mode==0)
        {
            // "+"
            //dc->DrawText( wxString("+"), (int) pos.get_x(), (int) pos.get_y() );
            dc->DrawLine( (int) ( pos.get_x() - get_radius()/2 ) ,
                          (int) ( pos.get_y() ) ,
                          (int) ( pos.get_x() + get_radius()/2 ) ,
                          (int) ( pos.get_y() ) );
            dc->DrawLine( (int) ( pos.get_x() ) ,
                          (int) ( pos.get_y() - get_radius()/2 ) ,
                          (int) ( pos.get_x() ) ,
                          (int) ( pos.get_y() + get_radius()/2 ) );
        }
        else if (mode==1)
        {
            /*
              +--------->x
              | z (X)
              |
              |
             \ /y

             positive current is going "inside screen"	
             */
            dc->DrawLine( (int) ( pos.get_x() - get_radius()/sqrt(2.0) ) ,
                          (int) ( pos.get_y() - get_radius()/sqrt(2.0) ) ,
                          (int) ( pos.get_x() + get_radius()/sqrt(2.0) ) ,
                          (int) ( pos.get_y() + get_radius()/sqrt(2.0) ));
            dc->DrawLine( (int) ( pos.get_x() + get_radius()/sqrt(2.0) ) ,
                          (int) ( pos.get_y() - get_radius()/sqrt(2.0) ) ,
                          (int) ( pos.get_x() - get_radius()/sqrt(2.0) ) ,
                          (int) ( pos.get_y() + get_radius()/sqrt(2.0) ));
        }
    }
    if ( this->get_charge() == 0 )
    {
        //dc->DrawText( wxString("0"), (int) pos.get_x(), (int) pos.get_y() );
    }


}
