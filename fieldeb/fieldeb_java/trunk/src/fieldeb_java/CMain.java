/**************************************************************************
 *   Copyright (C) 2006 by Sebastien CELLES                                *
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

package fieldeb_java;

/** fieldEB
* Simulateur electrostatique et magnetostatique
* @author Sebastien CELLES
* @author http://www.celles.net
* @version 0.1
*/


/*
public class CMain {
    public static void main (String[] args){
	String str = "fieldEB";
	str = str + "\n" + "under GNU General Public License";
	str = str + "\n" + "by S. CELLES";
 
   	System.out.println(str);
    }
}
*/



import java.awt.*;
import java.awt.event.*;
import javax.swing.*;



public class CMain //extends JApplet // public
{
      public static void main(String[] args)
      {
            mainfunc();
      }

      public void init()
      {
            //add(new Label("Hello World"));
            mainfunc();
      }

      private static void mainfunc()
      {
            String str = "fieldEB";
            str = str + "\n" + "under GNU General Public License";
            str = str + "\n" + "by S. CELLES";

            System.out.println(str);

            CMainFrame window = new CMainFrame();
            window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            //window.show(); // is deprecated
            window.setVisible(true);
      }

}
