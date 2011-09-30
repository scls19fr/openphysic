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

#include <wx/filename.h> // Name of the file, parameters, etc..

// Print Debug
//#include <stdio.h> // Debug with printf (C syntax)
#include <iostream>  // Debug with cout << var << endl"; (C++ syntax)

using namespace std;

#include "fieldeb.hpp"
#include "window_main.hpp"

#include "vector3d.hpp"

#include <wx/intl.h> // i18n (internationalization) l10n (localization)

bool MyApp::OnInit()
{

    wxString appPath = wxFileName(argv[0]).GetPath (wxPATH_GET_VOLUME);
    wxString appName = wxFileName(argv[0]).GetName();

    m_locale.Init(wxLANGUAGE_DEFAULT);
    //m_locale.Init(wxLANGUAGE_ENGLISH);
    //m_locale.Init(wxLANGUAGE_FRENCH);
    //m_locale.Init(wxLANGUAGE_GERMAN);
    //m_locale.Init(wxLANGUAGE_RUSSIAN);
    //m_locale.Init(wxLANGUAGE_ENGLISH);
    //m_locale.Init(wxLANGUAGE_ENGLISH_US);

    // m_locale.Init();

    m_locale.AddCatalog(appName);
    //m_locale.AddCatalog(wxT("fielde"));
    //m_locale.AddCatalog(appPath + wxFileName::GetPathSeparator() + appName);
    //cout << appPath + wxFileName::GetPathSeparator() + appName << endl;
    // === TO_FIX === Problem with locale when lauching from an other directory

    // no translation, using _T("...")
    const wxString APP_MAIN = _T("S. Celles");
    const wxString APP_VERSION = _T("0.1.0");
    const wxString APP_LICENCE = _T("GNU/GPL");
    const wxString APP_COPYRIGHT = _T("(C) 2005 S. Celles");

    // will be translated, using _("...")
    // see also wxGetTranslation("...")
    wxString MAIN_WINDOW_TITLE = _("fieldEB, an electrostatic and magnetostatic simulator under GNU/GPL license by S. Celles");
    //wxString MAIN_WINDOW_TITLE = wxGetTranslation("fieldE, an electrostatic simulator under GNU/GPL license by S. Celles");
    //wxString MAIN_WINDOW_TITLE = _("hello");

    // 1) generate .po files
    // $ xgettext -C -n -k_ -o $(FILENAME).po ../$(FILENAME).cpp
    // 2) edit .po files
    // using emacs, vi, or more specific to i18n : kbabel (kde), poedit
    // 3) compile .po to .mo
    // $ msgfmt -o fielde.mo fielde.po
    // caution to charset (UTF-8 ?)

    Window_Main *frame = new Window_Main((wxFrame *)NULL, -1, MAIN_WINDOW_TITLE, wxPoint(50,50), wxSize(450,340), wxDEFAULT_FRAME_STYLE);

    frame->Show( TRUE );
    SetTopWindow( frame );

    return TRUE;
}

IMPLEMENT_APP(MyApp)
