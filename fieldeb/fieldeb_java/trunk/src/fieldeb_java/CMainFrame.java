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

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

/**
 * Fenêtre principale de l'application
 * @author scls
 */
class CMainFrame extends JFrame
{
      public CMainFrame()
      {
            Toolkit k = Toolkit.getDefaultToolkit();
            Dimension screen_size = k.getScreenSize();
            int width_screen = screen_size.width;
            int height_screen = screen_size.height;

            setTitle("fieldEB by S. CELLES under GNU General Public License (GPL)");
            setSize(width_screen/4, height_screen/4);
            setLocation(width_screen*3/8, height_screen*3/8);

            CMainPanel monContenu = new CMainPanel(this);
            Container leContenant = getContentPane();
            leContenant.add(monContenu);


            JMenuItem item;
            JMenuBar menuBar = new JMenuBar();


            // -> File
            JMenu menuFile = new JMenu("File");
            menuBar.add(menuFile);
            // --> Open
            //{
            //item = new JMenuItem("Open");
            //menuFile.add(item);
            //}
            // --> About...
            {
                  item = new JMenuItem("About");
                  menuFile.add(item);
            }
            // --> ---
            {
                  menuFile.addSeparator();
            }
            // --> Exit
            {
                  item = new JMenuItem("Exit");
                  menuFile.add(item);
            }


            // -> Mode
            JMenu menuMode = new JMenu("Mode");
            menuBar.add(menuMode);
            // --> E
            {
                  item = new JMenuItem("E");
                  menuMode.add(item);
            }
            // --> B
            {
                  item = new JMenuItem("B");
                  menuMode.add(item);
            }


            // -> Image
            JMenu menuImage = new JMenu("Image");
            menuBar.add(menuImage);

            // --> Refresh
            {
                  item = new JMenuItem("Refresh");
                  menuImage.add(item);
            }
            // --> ---
            {
                  menuImage.addSeparator();
            }
            // --> Show Field...
            {
                  item = new JMenuItem("Show Field...");
                  menuImage.add(item);
            }
            // --> Show Field Lines...
            {
                  item = new JMenuItem("Show Field Lines...");
                  menuImage.add(item);
            }
            // --> Show Equipotentials...
            {
                  item = new JMenuItem("Show Equipotentials...");
                  menuImage.add(item);
            }


            // -> Options
            JMenu menuOptions = new JMenu("Options");
            menuBar.add(menuOptions);

            // --> Field As Vector
            {
                  item = new JMenuItem("Field As Vector");
                  menuOptions.add(item);
            }
            // --> Field As Grains
            {
                  item = new JMenuItem("Field As Grains");
                  menuOptions.add(item);
            }
            // --> ---
            {
                  menuOptions.addSeparator();
            }
            // --> Use colors
            {
                  item = new JMenuItem("Use colors");
                  menuOptions.add(item);
            }
            // --> Use Black, White and Gray
            {
                  item = new JMenuItem("Use Black, White and Gray");
                  menuOptions.add(item);
            }
            // --> Use Black and White
            {
                  item = new JMenuItem("Use Black and White");
                  menuOptions.add(item);
            }

            // -> Test
            // --> Test
            {
            }


            setJMenuBar(menuBar);

            //test();
      }

}
