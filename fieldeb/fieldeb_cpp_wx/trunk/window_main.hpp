/***************************************************************************
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

#ifndef WINDOW_MAIN_HPP
#define WINDOW_MAIN_HPP

#include <list>


#include "grid.hpp"

#include "charge.hpp"
#include "charges.hpp"

/**
 * This is the main window of the application.
 */
class Window_Main : public wxFrame {

public:
    Window_Main(wxWindow* parent, int id, const wxString& title, const wxPoint& pos=wxDefaultPosition, const wxSize& size=wxDefaultSize, long style=wxDEFAULT_FRAME_STYLE);

    void On_Quit(wxCommandEvent& event);

    Grid myGrid;

    Charges charges;
    //typedef list <Charge> Charges;
    //Charges charges;
    //typedef list <Charge>::const_iterator LI_chg; // Iterator for list of charges

    //  const double Ke = 1000;

    int get_mode() const
    {
        return m_mode;
    }

    void set_mode(int const mode)
    {
        m_mode=mode;
    }




private:
    DECLARE_EVENT_TABLE()

    wxMenuBar *menuBar;
    wxMenu *menuMode;
    wxMenu *menuImage;
    wxMenu *menuOptions;
    wxMenu *menuColors;

    void TO_DO();


    void On_Paint( wxPaintEvent& event );


    void On_Mouse_Move( wxMouseEvent& event );

    void On_Mouse_Left_Up( wxMouseEvent& event );
    void On_Mouse_Left_Down( wxMouseEvent& event );

    void On_Mouse_Right_Up( wxMouseEvent& event );
    void On_Mouse_Right_Down( wxMouseEvent& event );


    void On_About( wxCommandEvent& event );
    void On_Mode_E( wxCommandEvent& event );
    void On_Mode_B( wxCommandEvent& event );

    void On_ShowField( wxCommandEvent& event );
    void On_ShowFieldLines( wxCommandEvent& event);
    void On_ShowEquipotentials( wxCommandEvent& event );

    void On_Clear( wxCommandEvent& event );

    void On_Refresh( wxCommandEvent& event );

    void On_FieldAsVector( wxCommandEvent& event );
    void On_FieldAsGrains( wxCommandEvent& event );

    void On_UseColors( wxCommandEvent& event );
    void On_UseBlackWhiteGray( wxCommandEvent& event );
    void On_UseBlackWhite( wxCommandEvent& event );

    void On_Test( wxCommandEvent& event );

    void Draw();
    //void Draw_Charges(wxWindowDC *ptr_dc);

    //void Calculate(double x, double y, double z, double K, double& Ex, double& Ey, double& Ez, double& V);
    void Calculate(double x, double y, double z, double& Ex, double& Ey, double& Ez, double& V,double& Bx,double& By,double& Bz,double& Ax,double& Ay,double& Az);

    int m_mode; // 0=E 1=B

protected:
    //

};


#endif // WINDOW_MAIN_HPP
