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

#include <wx/wx.h> // Minimal wx include
#include <wx/dcclient.h> // For wxPaintDC
#include <wx/intl.h> // i18n

#include "charge.hpp"
#include "charges.hpp"

#include "grid.hpp"

#include "draw_grain.hpp"
#include "draw_rectangle.hpp"
#include "draw_vector.hpp"

#include "color.hpp"

#include <list> // list of charges, fields, ... (see STL Standard Template Library)

#include <math.h> // sqrt, pow

#include "window_add_charge.hpp"
#include "window_main.hpp"

#define Ke 1000 //8987551787.37 // Ke=1/(4*pi*epsilon0) // 8.98755178737E9
#define Km 1000 // Km=mu0/(4*pi)

// Print Debug
//#include <stdio.h> // Debug with printf (C syntax)
#include <iostream>  // Debug with cout << "data = " << data << endl; (C++ syntax)


using namespace std;


enum
{
    ID_File_Quit=1,
    ID_File_About,
    ID_Mode_ModeE,
    ID_Mode_ModeB,
    ID_Image_Refresh,
    ID_Image_ShowField,
    ID_Image_ShowFieldLines,
    ID_Image_ShowEquipotentials,
    ID_Options_FieldAsVector,
    ID_Options_FieldAsGrains,
    ID_Colors_UseColors,
    ID_Colors_UseBlackWhiteGray,
    ID_Colors_UseBlackWhite,
    ID_Paint,
    ID_Test
};

enum
{
    ID_Mode_E,
    ID_Mode_B
};

enum
{
    ID_Color_Mode_Color,
    ID_Color_Mode_BlackWhiteGray,
    ID_Color_Mode_BlackWhite
};



BEGIN_EVENT_TABLE( Window_Main, wxFrame )
EVT_MENU( ID_File_Quit, Window_Main::On_Quit )
EVT_MENU( ID_File_About, Window_Main::On_About )
EVT_MENU( ID_Mode_ModeE, Window_Main::On_Mode_E )
EVT_MENU( ID_Mode_ModeB, Window_Main::On_Mode_B )
EVT_MENU( ID_Image_Refresh, Window_Main::On_Refresh )
EVT_MENU( ID_Image_ShowField, Window_Main::On_ShowField )
EVT_MENU( ID_Image_ShowFieldLines, Window_Main::On_ShowFieldLines )
EVT_MENU( ID_Image_ShowEquipotentials, Window_Main::On_ShowEquipotentials )
EVT_MENU( ID_Options_FieldAsVector, Window_Main::On_FieldAsVector )
EVT_MENU( ID_Options_FieldAsGrains, Window_Main::On_FieldAsGrains )
EVT_MENU( ID_Colors_UseColors, Window_Main::On_UseColors )
EVT_MENU( ID_Colors_UseBlackWhiteGray, Window_Main::On_UseBlackWhiteGray )
EVT_MENU( ID_Colors_UseBlackWhite, Window_Main::On_UseBlackWhite )
EVT_MENU( ID_Test, Window_Main::On_Test )

EVT_PAINT( Window_Main::On_Paint )

EVT_MOTION( Window_Main::On_Mouse_Move )

EVT_LEFT_UP( Window_Main::On_Mouse_Left_Up )
EVT_LEFT_DOWN( Window_Main::On_Mouse_Left_Down )
EVT_RIGHT_UP( Window_Main::On_Mouse_Right_Up )
EVT_RIGHT_DOWN( Window_Main::On_Mouse_Right_Down )
END_EVENT_TABLE()



Window_Main::Window_Main(wxWindow* parent, int id, const wxString& title, const wxPoint& pos, const wxSize& size, long WXUNUSED(style)) : wxFrame(parent, id, title, pos, size, wxDEFAULT_FRAME_STYLE)
{

    /**
     * Main Window constructor
     */


    // Create menu, statusbar

    // Create MenuBar
    //wxMenuBar *menuBar = new wxMenuBar;
    menuBar = new wxMenuBar;

    // define menu

    // -> File
    wxMenu *menuFile = new wxMenu;
    menuBar->Append(menuFile,_("&File"));
    // --> About...
    menuFile->Append(ID_File_About,_("&About...\tCTRL-?"),_("About fieldE"));
    // --> ---
    menuFile->AppendSeparator();
    // --> Exit
    menuFile->Append(ID_File_Quit,_("E&xit\tCTRL-Q"),_("Quit fieldE"));
    // -> Mode
    wxMenu *menuMode = new wxMenu;
    menuBar->Append(menuMode,_("&Mode"));
    // --> E
    menuMode->AppendRadioItem(ID_Mode_ModeE,_("&E"),_("Electrostatic mode"));
    // --> B
    menuMode->AppendRadioItem(ID_Mode_ModeB,_("&B"),_("Magnetostatic mode"));
    // -> Image
    //wxMenu *menuImage = new wxMenu;
    menuImage = new wxMenu;
    menuBar->Append(menuImage,_("&Image"));
    // --> Refresh
    menuImage->Append(ID_Image_Refresh,_("&Refresh\tCTRL-R"),_("Refresh"));
    // --> ---
    menuImage->AppendSeparator();
    // --> Show Field...
    menuImage->AppendRadioItem(ID_Image_ShowField,_("Show &Field..."),_("Show field")); // see also Append(...) see also AppendCheckItem
    // --> Show Field Lines...
    menuImage->AppendRadioItem(ID_Image_ShowFieldLines,_("Show Field &Lines..."),_("Show field lines"));
    // Show Equipotentials...
    menuImage->AppendRadioItem(ID_Image_ShowEquipotentials,_("Show &Equipotentials..."),_("Show equipotentials"));

    // -> Options
    //wxMenu *menuOptions = new wxMenu;
    menuOptions = new wxMenu;
    menuBar->Append(menuOptions,_("&Options"));
    // --> Field As Vector
    menuOptions->AppendRadioItem(ID_Options_FieldAsVector,_("Field As &Vector"),_("Show field as vector"));
    // --> Field As Grains
    menuOptions->AppendRadioItem(ID_Options_FieldAsGrains,_("Field As &Grains"),_("Show field as grains"));
    // --> ---
    //menuOptions->AppendSeparator();
    // --> Use colors
    //menuOptions->AppendCheckItem(ID_Options_UseColors,_("Use &Colors"),_("Use colors for grains, vectors or lines"));

    menuColors = new wxMenu;
    menuBar->Append(menuColors,_("&Colors"));
    menuColors->AppendRadioItem(ID_Colors_UseColors,_("Use &Colors"),_("Use &Colors for grains, vectors or lines"));
    menuColors->AppendRadioItem(ID_Colors_UseBlackWhiteGray,_("Use Black, White and Gray"), _("Use Black, White and &Gray for grains, vectors or lines"));
    menuColors->AppendRadioItem(ID_Colors_UseBlackWhite,_("Use &Black and White"),_("Use &Black and White for grains, vectors or lines"));


    // For debug uncomment this and complete On_Test method
    // -> Test
    //wxMenu *menuTest = new wxMenu;
    //menuBar->Append(menuTest,"&Test");
    // --> Test
    //menuTest->Append(ID_Test,"Test\tCTRL-T","Test");



    // set frame menubar
    SetMenuBar(menuBar);


    // Initialize menus (checked or unchecked) or (select or unselect with RadioItem)
    menuImage->Check(ID_Image_ShowField, true); // menuImage->AppendCheckItem instead of ->Append
    menuOptions->Check(ID_Options_FieldAsGrains, true);
    menuColors->Check(ID_Colors_UseColors, true);

    this->set_mode(0);

    // Create frame statusbar
    CreateStatusBar();
    // set statusbar text
    SetStatusText(_("Ready !"));

    //Charge chg;

    //chg = Charge(-50,10,300,100,0);
    //charges.push_back(chg);

    //chg = Charge(50,10,300,200,0);
    //charges.push_back(chg);



    //cout << menuImage->IsChecked(ID_Image_ShowField); // OK !

    //delete menuBar; // segfault !

}




void Window_Main::TO_DO()
{
    wxMessageBox( _("TO_DO : Sorry, this feature is not ready !"),
                  _("About fieldE") , wxOK | wxICON_INFORMATION );
}


void Window_Main::On_Test( wxCommandEvent& WXUNUSED( event ) )
{
    wxMessageBox(_("Testing"),_("Test"), wxOK|wxICON_INFORMATION, this);
}


//void Window_Main::Calculate(double x, double y, double z, double Ke, double& Ex, double& Ey, double& Ez, double& V)
void Window_Main::Calculate(double x, double y, double z, double& Ex, double& Ey, double& Ez, double& V,double& Bx,double& By,double& Bz,double& Ax,double& Ay,double& Az)
{

    double r;

    Ex = 0;
    Ey = 0;
    Ez = 0;

    V = 0;

    Bx = 0;
    By = 0;
    Bz = 0;

    Ax = 0;
    Ay = 0;
    Az = 0;

    //for (LI_chg i = charges.begin() ; i != charges.end() ; ++i)  // for each charge
    for (list <Charge>::const_iterator i = charges.begin() ; i != charges.end() ; ++i)
        //  for (Charges::const_iterator i = charges.begin() ; i != charges.end() ; ++i)
    {
        Charge chge = *i;
        //chge.Draw(ptr_dc);
        r = sqrt (
                pow( x - chge.get_position().get_x() , 2 )
                + pow( y - chge.get_position().get_y() , 2 )
                + pow( z - chge.get_position().get_z() , 2 ) );


        V = V + ( Ke * chge.get_charge() ) / r;


        double X = x - chge.get_position().get_x(); // TO_VERIFY signe ? ... cf vector
        double Y = y - chge.get_position().get_y();
        double Z = z - chge.get_position().get_z();

        Ex = Ex + ( Ke * chge.get_charge() * X ) / pow(r,3);
        Ey = Ey + ( Ke * chge.get_charge() * Y ) / pow(r,3);
        Ez = Ez + ( Ke * chge.get_charge() * Z ) / pow(r,3);

        Bx = Bx - ( Km * chge.get_charge() * Y ) / pow(r,3); // using cross product
        By = By + ( Km * chge.get_charge() * X ) / pow(r,3);
        Bz = 0;

        /*
        Ax = Bx - ( Km * chge.get_charge() * Y ) / pow(r,2); // using cross product
        Ay = By + ( Km * chge.get_charge() * X ) / pow(r,2);
        Az = 0;
        */

        //delete *chge;
    }
}

/*
void Window_Main::Draw_Charges(wxWindowDC *ptr_dc)
{
  //for (LI_chg i = charges.begin() ; i != charges.end() ; ++i)
  for (list <Charge>::const_iterator i = charges.begin() ; i != charges.end() ; ++i)
    {
      Charge chge = *i;
      chge.Draw(ptr_dc);
    }
}
*/

void Window_Main::Draw()
{
    //cout << "Draw()" << endl;

    wxPaintDC * ptr_dc;
    ptr_dc = new wxPaintDC(this);

    ptr_dc->Clear();

    wxCoord width, height;
    ptr_dc->GetSize(&width, &height);

    // Grid
    //Grid(float x_min, float x_max, float x_space, float y_min, float y_max, float y_space, float z_min, float z_max, float z_space, bool visible )
    //Grid myGrid = Grid(0, 300, 10, 0, 300, 10, 0, 0, 0, true);
    //myGrid = Grid();

    /*
    Grid myGrid;
    myGrid.set_x_max(width);
    myGrid.set_y_max(height);
    myGrid.set_visible();
    myGrid.Draw(ptr_dc);
    */

    Grid * myGrid;
    myGrid = new Grid();
    myGrid->set_x_max(width);
    myGrid->set_y_max(height);
    myGrid->set_visible();
    myGrid->Draw(ptr_dc);

    //delete myGrid;


    /*
    Charge chg;
    chg = Charge(-50,10,100,100,0);
    chg.Draw(ptr_dc);
    */

    //typedef list <Charge> Charges;
    //list <Charge> charges;
    //Charges charges;
    //typedef list <Charge>::const_iterator LI_chg;



    double q_max;
    double q_min;
    double d;
    //d = myGrid.get_x_space();
    d = 5;

    q_max=1; // TO_FIX problem with 0
    q_min=1;

    double I_max = 1;
    double I_min = 1;

    charges.Draw(ptr_dc,get_mode());

    // Get q_max, q_min, max radius //Draw Charge
    //for (LI_chg i = charges.begin() ; i != charges.end() ; ++i)
    for (list <Charge>::const_iterator i = charges.begin() ; i != charges.end() ; ++i)
    {
        Charge chge = *i;
        //chge.Draw(ptr_dc);
        q_max = max( q_max, chge.get_charge() );
        q_min = min( q_min, chge.get_charge() );
        d = max(d,chge.get_radius());
    }

    I_max = q_max;
    I_min = q_min;

    d = 5*d;

    //double Ke = 1000;

    double E_max;
    double V_max;
    double E_min;
    double V_min;

    //q = 50; // TO_FIX

    //E_max = K * q_max / pow(d,2);
    V_max = Ke * q_max / d;
    E_max = V_max / d;
    //E_min = K * q_min / pow(d,2);
    V_min = Ke * q_min / d;
    E_min = V_min / d;

    double B_max;
    double A_max;
    double B_min;
    double A_min;

    A_max = Km * I_max / d;
    B_max = A_max / d;
    A_min = Km * I_min / d;
    B_min = A_min / d;

    double Ex = 0;
    double Ey = 0;
    double Ez = 0;
    double V = 0;

    double Bx = 0;
    double By = 0;
    double Bz = 0;
    double Ax = 0;
    double Ay = 0;
    double Az = 0;
    //double A = 0;

    double z = 0; // only 2 dimensions (not 3... but easily expandable)


    // Calculate field
    //cout << "DEBUG:" << myGrid.get_x_space() << " " << myGrid.get_y_space() << "\n";

    for (double y = myGrid->get_y_min() + myGrid->get_y_space()/2 ; y <= myGrid->get_y_max() ; y = y + myGrid->get_y_space())
    {
        for (double x = myGrid->get_x_min() + myGrid->get_x_space()/2 ; x <= myGrid->get_x_max() ; x = x + myGrid->get_x_space())
        {

            Ex = 0;
            Ey = 0;
            Ez = 0;

            V = 0;

            Bx = 0;
            By = 0;
            Bz = 0;

            Ax = 0;
            Ay = 0;
            Az = 0;

            //Calculate(x, y, z, Ke, Ex, Ey, Ez, V); // Ex Ey Ez V by reference (are modified)
            Calculate(x, y, z, Ex, Ey, Ez, V, Bx, By, Bz, Ax, Ay, Az);

            int color_mode;
            /*
            enum
              {
                ID_Color_Mode_Color,
                ID_Color_Mode_BlackWhiteGray,
                ID_Color_Mode_BlackWhite
              };
            */

            /*
            enum
              {
                ID_Mode_E,
                ID_Mode_B
              };
            */

            if ( menuColors->IsChecked(ID_Colors_UseColors) )
            {
                color_mode =  ID_Color_Mode_Color;
            }
            if ( menuColors->IsChecked(ID_Colors_UseBlackWhiteGray) )
            {
                color_mode =  ID_Color_Mode_BlackWhiteGray;
            }
            if ( menuColors->IsChecked(ID_Colors_UseBlackWhite) )
            {
                color_mode =  ID_Color_Mode_BlackWhite;
            }


            // E with Grain
            if (menuImage->IsChecked(ID_Image_ShowField) && menuOptions->IsChecked(ID_Options_FieldAsGrains))
            {
                Draw_Grain grain;
                if (get_mode()==ID_Mode_E) // 0
                {
                    grain.set_x(x);
                    grain.set_y(y);
                    grain.set_ux(Ex);
                    grain.set_uy(Ey);
                    //= Draw_Grain(x, y, Ex, Ey);
                }
                else // get_mode()==ID_Mode_B (1)
                {
                    // grain = Draw_Grain(x, y, Bx, By);
                    grain.set_x(x);
                    grain.set_y(y);
                    grain.set_ux(Bx);
                    grain.set_uy(By);
                }

                Color color = Color();
                if ( color_mode == ID_Color_Mode_Color )
                {
                    //color.set_step( sqrt(Ex*Ex+Ey*Ey), 0, E_max );
                    if (get_mode()==ID_Mode_E)
                    {
                        color.set_color_linear( sqrt(Ex*Ex+Ey*Ey+Ez*Ez), 0, E_max );
                    }
                    else if (get_mode()==ID_Mode_B)
                    {
                        color.set_color_linear( sqrt(Bx*Bx+By*By+Bz*Bz), 0, B_max );
                    }
                }
                if ( color_mode == ID_Color_Mode_BlackWhiteGray )
                {
                    if (get_mode()==ID_Mode_E)
                    {
                        color.set_bwg_linear( sqrt(Ex*Ex+Ey*Ey+Ez*Ez), 0, E_max );
                    }
                    else if (get_mode()==ID_Mode_B)
                    {
                        color.set_bwg_linear( sqrt(Bx*Bx+By*By+Bz*Bz), 0, B_max );
                    }
                }
                //if ( color_mode == ID_Color_Mode_BlackWhiteGray )
                // BLACK grain
                grain.set_color(color);
                grain.Draw(ptr_dc);
            }

            if (menuImage->IsChecked(ID_Image_ShowField) && menuOptions->IsChecked(ID_Options_FieldAsVector) && get_mode()==ID_Mode_E)
            {
                // E with Vector
                Draw_Vector vct = Draw_Vector(x, y, 0, Ex, Ey, 0); // caution with overload of contructor and defining constant...
                Color color = Color();
                //color.set_color_step( sqrt(Ex*Ex+Ey*Ey), 0, E_max );
                color.set_color_linear( sqrt(Ex*Ex+Ey*Ey), 0, E_max );
                //vct.set_color(color);
                vct.Draw(ptr_dc);
            }


            // V with rectangle
            if (menuImage->IsChecked(ID_Image_ShowEquipotentials))
            {
                Draw_Rectangle rectangle = Draw_Rectangle(x, y, myGrid->get_x_space(), myGrid->get_y_space());
                Color color = Color();
                if ( color_mode == ID_Color_Mode_Color )
                {
                    if (get_mode()==ID_Mode_E)
                    {
                        color.set_color_step( V, V_min, V_max );
                    }
                    else // ID_Mode_B
                    {
                        //TO_DO();
                    }
                }
                if ( color_mode == ID_Color_Mode_BlackWhiteGray )
                    //else //  color_mode == ID_Color_Mode_BlackWhiteGray or ID_Color_Mode_BlackWhite
                {
                    if (get_mode()==ID_Mode_E)
                    {
                        color.set_bwg_step( V, V_min, V_max );
                    }
                    else // ID_Mode_B
                    {
                        //TO_DO();
                    }
                }
                if ( color_mode == ID_Color_Mode_BlackWhite )
                {
                    if (get_mode()==ID_Mode_E)
                    {
                        color.set_bw( V, V_min, V_max );
                    }
                    else // ID_Mode_B
                    {
                        //TO_DO();
                    }
                }

                if (get_mode()==ID_Mode_E)
                {
                    rectangle.set_color(color);
                    rectangle.Draw(ptr_dc);
                }
                else // ID_Mode_B
                {
                    //TO_DO();
                }
            }

        }
    }


    charges.Draw(ptr_dc,get_mode()); //Draw_Charges(ptr_dc);

    delete ptr_dc;

}


void Window_Main::On_Paint(wxPaintEvent& event)
{
    (void) event; // fix warning because of unused variable

    // wxMessageBox("On_Paint", "On_Paint", wxOK|wxICON_INFORMATION, this);
    // printf("On_Paint\n");
    //cout << "On_Paint" << endl;


    //wxWindowDC *ptr_dc; // or wxPaintDC
    //ptr_dc = new wxWindowDC(this);

    //wxPaintDC *ptr_dc;
    //ptr_dc = new wxPaintDC(this);

    /* // Drawing example
    ptr_dc->Clear();

    wxCoord width, height;
    ptr_dc->GetSize(&width, &height);

    wxWindowDC *dc;
    dc = new wxWindowDC(this);
    dc->Clear();
    wxPen pen;
    pen = wxPen("BLACK",2,wxSOLID); // "BLACK"='#000000'='RRGGBB'
    dc->SetPen(pen);
    dc->DrawPoint(100,100);
    */

    Draw();   // Maybe I will need to uncomment this (trying to solve event loop with paint)

}



void Window_Main::On_Quit(wxCommandEvent& WXUNUSED(event))
{
    Close(TRUE);
}

void Window_Main::On_About(wxCommandEvent& WXUNUSED(event))
{
    wxMessageBox(_("fieldEB... \n an electrostatic and magnetostatic simulator \n by Sebastien Celles \n s.cls@laposte.net \n under GNU General Public License"),_("About fieldEB"),
                 wxOK|wxICON_INFORMATION, this);
}

void Window_Main::On_Mode_E( wxCommandEvent& WXUNUSED( event ) )
{
    set_mode(0);
    Draw();
}

void Window_Main::On_Mode_B( wxCommandEvent& WXUNUSED( event ) )
{
    set_mode(1);
    Draw();
}

void Window_Main::On_ShowField( wxCommandEvent& WXUNUSED( event ) )
{
    // no need to control this event (using RadioItem instead of CheckItem)
    Draw();
}

void Window_Main::On_ShowFieldLines( wxCommandEvent& WXUNUSED( event ) )
{
    // no need to control this event (using RadioItem instead of CheckItem)
    TO_DO();
    Draw();
}

void Window_Main::On_ShowEquipotentials( wxCommandEvent& WXUNUSED( event ) )
{
    // no need to control this event (using RadioItem instead of CheckItem)
    Draw();
}

void Window_Main::On_Clear( wxCommandEvent& WXUNUSED( event ) )
{
    TO_DO();
}

void Window_Main::On_Refresh( wxCommandEvent& WXUNUSED( event ) )
{
    //TO_DO();
    Draw();
}

// Options

void Window_Main::On_FieldAsVector( wxCommandEvent& WXUNUSED( event ) )
{
    //TO_DO();
    Draw();
}

void Window_Main::On_FieldAsGrains( wxCommandEvent& WXUNUSED( event ) )
{
    Draw();
}

void Window_Main::On_UseColors( wxCommandEvent& WXUNUSED( event ) ) //WXUNUSED( event ) )
{
    //    menuOptions->Append(ID_Options_UseColors,"Use &Colors","Use colors for grains, vectors or lines");
    //cout << event.IsChecked() << "\n";
    //menuOptions->Check();
    //this->menuBar->menuOptions->Check(); // TO_FIX
    Draw();
}

void Window_Main::On_UseBlackWhiteGray( wxCommandEvent& WXUNUSED( event ) )
{
    //(void) event; // fix warning because of unused variable
    Draw();
}

void Window_Main::On_UseBlackWhite( wxCommandEvent& WXUNUSED( event ) )
{
    //(void) event; // fix warning because of unused variable => WXUNUSED prefered
    Draw();
}

// Mouse events


void Window_Main::On_Mouse_Left_Up( wxMouseEvent& event )
{
    cout << "On_Mouse_Left_Up" << "\n";
    // lock charge no to be movable (charge or chargeS if problem)

    long x = 0;
    long y = 0;
    long z = 0;
    event.GetPosition(&x,&y);
    //z=0;
    Position pos;
    pos = Position(x, y, z);

    //charges.move(pos);
    charges.unset_movable();

    SetStatusText(_("Ready !"));

    // TEST
    //(charges.begin())->get_position().set_x(100);
}

void Window_Main::On_Mouse_Left_Down( wxMouseEvent& event )
{
    cout << "On_Mouse_Left_Down" << "\n";
    // TO_DO
    // if near of a charge : unlock charge to be moved
    // if not near of a charge : add a charge

    long x = 0;
    long y = 0;
    long z = 0;
    event.GetPosition(&x,&y);
    //z=0;
    Position pos;
    pos = Position(x, y, z);

    //bool Is_Near_Of_A_Charge = charges.get_near_of_a_charge(x, y, z);
    bool Is_Near_Of_A_Charge = charges.get_near_of_a_charge(pos);

    double q;
    //q = 50; // Open a window to ask charge

    if ( Is_Near_Of_A_Charge ) // => unlock nearest charge
    {
        //cout << "Is_Near_Of_A_Charge" << "\n";
        //charges.set_movable(x,y,z);
        charges.set_movable(pos);
    }
    else // Is not near of a charge => add a charge here
    {
        //cout << "Is_Not_Near_Of_A_Charge" << "\n";
        // Show window_add_charge

        charges.unset_movable();

        Window_Add_Charge *dlg = new Window_Add_Charge((wxFrame *)NULL, -1, _("fieldE : Add a charge"), wxPoint(100,100), wxSize(550,150), wxDEFAULT_FRAME_STYLE);

        if ( dlg->ShowModal() == wxID_OK ) // http://www.wxwidgets.org/manuals/2.5.4/wx_wxdialog.html
        { // OK
            q=1000;
            wxTextCtrl *txtAns;
            txtAns=dlg->txtAnswer;
            (txtAns->GetValue()).ToDouble(&q);
            Charge chg = Charge(q,7,x,y,z);
            charges.add(chg);
            //charges.add(q,7,x,y,z); // radius=6
        }
        else // CANCEL or ANYTHING ELSE
        {

        }
        dlg->Destroy();

        Draw();
    }

    Draw(); // refresh screen
}

void Window_Main::On_Mouse_Move( wxMouseEvent& event )
{
    //cout << "On_Mouse_Move" << "\n";
    // TO_DO : Change status bar content
    //  should display x y Ex Ey Ez V


    long x,y,z;
    event.GetPosition(&x,&y);
    z=0;
    Position pos = Position(x, y, z);

    bool moving_mouse_without_charge = true;
    //moving_mouse_without_charge = true;

    for (list <Charge>::const_iterator i = charges.begin() ; i != charges.end() ; ++i)
    {
        Charge chge = *i;
        //chge.unset_movable();
        if ( chge.get_movable() )
        {
            moving_mouse_without_charge = false;
        }
    }


    //moving_mouse_without_charge = charges.get




    if ( moving_mouse_without_charge )
    {
        wxString str;
        double Ex,Ey,Ez,E,V,Bx,By,Bz,B,Ax,Ay,Az,A;
        //double Ke = 1000; // #DEFINE ? constant TO_DO TO_FIX !!!

        Calculate(x,y,z,Ex,Ey,Ez,V,Bx,By,Bz,Ax,Ay,Az); // Ex, Ey, Ez, ... by ref

        E = sqrt ( Ex*Ex + Ey*Ey + Ez*Ez );
        B = sqrt ( Bx*Bx + By*By + Bz*Bz );
        A = sqrt ( Ax*Ax + Ay*Ay + Az*Az );

        if (get_mode() == 0) // E mode
        {
            str << _T("x = ")  << x  << _T(" ; ")
            << _T("y = ")  << y  << _T(" ; ")
            << _T("z = ")  << z  << _T(" ; ")
            << _T("Ex = ") << Ex << _T(" ; ")
            << _T("Ey = ") << Ey << _T(" ; ")
            << _T("Ez = ") << Ez << _T(" ; ")
            << _T("E = ")  << E  << _T(" ; ")
            << _T("V = ")  << V;
        }
        else // B mode
        {
            str << _T("x = ")  << x  << _T(" ; ")
            << _T("y = ")  << y  << _T(" ; ")
            << _T("z = ")  << z  << _T(" ; ")
            << _T("Bx = ") << Bx << _T(" ; ")
            << _T("By = ") << By << _T(" ; ")
            << _T("Bz = ") << Bz << _T(" ; ")
            << _T("B = ")  << E;//  << " ; "
            //	      << "Ax = " << Ax << " ; "
            //	      << "Ay = " << Ay << " ; "
            //	      << "Az = " << Az << " ; "
            //	      << "A = "  << A;
        }


        SetStatusText(str);

        //Draw();

    }
    else
    {
        SetStatusText(_("You are moving a charge"));

        charges.move(pos);

        Draw();

    }

    //Draw();
}

void Window_Main::On_Mouse_Right_Up( wxMouseEvent& WXUNUSED(event) )
{
    //cout << "On_Mouse_Right_Up" << "\n";
    // nothing ?
}

void Window_Main::On_Mouse_Right_Down( wxMouseEvent& event) //WXUNUSED( event ) )
{
    //cout << "On_Mouse_Right_Down" << "\n";
    // if near of a charge : delete charge
    // if not near of a charge : nothing ? (or add personal point ?)

    //(void) event; // fix warning because of unused variable => use WXUNUSED

    long x,y,z = 0;
    event.GetPosition(&x,&y);
    //z=0;

    Position pos;
    pos = Position(x, y, z);

    bool Is_Near_Of_A_Charge = charges.get_near_of_a_charge(pos);

    if ( Is_Near_Of_A_Charge ) // Is near of a charge => delete the nearest charge
    {
        //charges.remove(x,y,z);
        charges.remove(pos);
        //cout << "remove" << endl;
    }
    else // Is not near of a charge => nothing
    {
    }

    Draw();

}


