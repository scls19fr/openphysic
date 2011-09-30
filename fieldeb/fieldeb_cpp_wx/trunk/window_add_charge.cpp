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
#include <wx/intl.h> // i18n

#include "window_add_charge.hpp"

//#include <iostream>
//using namespace std;


Window_Add_Charge::Window_Add_Charge(wxWindow* parent, int id, const wxString& title, const wxPoint& pos, const wxSize& size, long WXUNUSED(style)) : wxDialog(parent, id, title, pos, size, wxDEFAULT_FRAME_STYLE)
{
    /*

    ------------------------
    |  --------------------- <-------- sizer_QA
    | | txtQuestion         | |
    | |                     | |
    | | txtAnswer           | |
    |  ---------------------  |
    |  --------------------- <-------- sizer_button
    | | butOk butCancel     | |
    |  ---------------------  |
    ------------------------  <------- sizer

    */

    /* No warning fo unused variables */
    // style
    //

    wxBoxSizer *sizer = new wxBoxSizer( wxVERTICAL );
    wxBoxSizer *sizer_qa = new wxBoxSizer( wxVERTICAL );
    wxBoxSizer *sizer_button = new wxBoxSizer( wxHORIZONTAL );

    wxString str = _("Enter a new electrical charge.\n"
                     "\tValue must be between -100 000 and +100 000\n"
                     "\tDefault value is +1000");

    wxStaticText *txtQuestion = new wxStaticText(this, -1, str);

    txtAnswer = (wxTextCtrl *) NULL;
    txtAnswer = new wxTextCtrl(this,-1,wxString(_T("1000")),wxDefaultPosition,wxDefaultSize); //,wxTE_MULTILINE); // default value TO_CAST
    //wxTextCtrl *txtAnswer = new wxTextCtrl(this,-1,wxString(_T("1000")),wxDefaultPosition,wxDefaultSize);

    sizer_qa->Add(txtQuestion,0,wxALL|wxEXPAND,10);
    sizer_qa->Add(txtAnswer,0,wxALL|wxEXPAND,10);
    sizer->Add(sizer_qa,1,wxEXPAND,0);

    wxButton * butOk = new wxButton( this,wxID_OK,_("OK"));
    wxButton * butCancel = new wxButton( this,wxID_CANCEL,_("Cancel"));


    //   wxBoxSizer *sizer_buttonOk = new wxBoxSizer( wxALL);
    //   wxBoxSizer *sizer_buttonCancel = new wxBoxSizer( wxALL );
    //   sizer_buttonOk->Add(butOk,0,wxALL,10);
    //   sizer_buttonCancel->Add(butCancel,0,wxALL,10);
    sizer_button->Add(butOk,0,wxALL | wxALIGN_CENTER,10);
    sizer_button->Add(butCancel,0,wxALL | wxALIGN_CENTER,10);

    sizer->Add(sizer_button,1,wxALL | wxEXPAND,0);

    SetAutoLayout( TRUE );
    SetSizer( sizer );
    sizer->Fit( this );
    sizer->SetSizeHints( this );

    //sizer_button->Fit(this);
    //SetSizer( sizer_button );
    //sizer_button->Fit(sizer);


    /*
    SetSizer( sizer_button );
    sizer_button->Fit( this );
    sizer_button->SetSizeHints( this );
    */
}

void OnOk()// wxCommandEvent &event )
{
    //  cout << _("Ok") << endl;
}

void OnCancel() //wxCommandEvent &event )
{
    //  cout << _("Cancel") << endl;
}


//BEGIN_EVENT_TABLE( Window_Add_Charge, wxDialog )
//EVT_BUTTON(wxID_OK,Window_Add_Charge::On_Ok)
//EVT_BUTTON(wxID_CANCEL,Window_Add_Charge::On_Cancel)
//END_EVENT_TABLE()
