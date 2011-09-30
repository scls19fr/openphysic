/*
OpenChrono
Copyright (C) 2007  Sebastien CELLES
 
This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.
 
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
 
You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
*/

#include "ocview_about.h"
#include <QString>
//

/*
 *  Constructs a about box which is a child of 'parent', with the 
 *  name 'name' and widget flags set to 'f' 
 */
OCView_About::OCView_About()
{
  setupUi(this);
  setupOCView(this);

  setWindowTitle(QApplication::translate("frmMessage", "About", 0, QApplication::UnicodeUTF8));
  lblTitle->setAlignment(Qt::AlignCenter|Qt::AlignVCenter);
  lblTitle->setText(QApplication::translate("frmMessage", "<img src=\":/icons/openchrono.png\" width=\"32\" height=\"32\"/> OpenChrono <img src=\":/icons/openchrono.png\" width=\"32\" height=\"32\"/>", 0, QApplication::UnicodeUTF8));
  lblMessage->setText(QApplication::translate("frmMessage", "<h3>a chronometer for go-karts and others mechanical sports</h3><h4>Copyright © 2008 S. Celles</h4><h5>under GNU General Public License</h5>", 0, QApplication::UnicodeUTF8));

  //QString str = QString("<h1>OpenChrono</h1><h2>a chronometer for go-karts and others mechanical sports</h2><h3>Copyright (C) 2008 S. Celles</h3><h4>under GNU General Public License</h4>");

  //lblMessage->setText(str);

/*
  connect(quit, SIGNAL(clicked()), this, SLOT(goodBye()));

  setGeometry(50,320,320,240);
*/
}

/*
 *  Destroys the object and frees any allocated resources
 */
OCView_About::~OCView_About()
{
  // no need to delete child widgets, Qt does it all for us
}


/*
 *  A simple slot... not very interesting.
 */
/*
void OCView_About::goodBye()
{
  close();
}
*/
//


