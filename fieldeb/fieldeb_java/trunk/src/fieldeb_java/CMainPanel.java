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
 * Panel sur lequel les charges, la grille, ... sont dessinés
 * @author scls
 */
class CMainPanel extends JPanel
{
      private CMainFrame myWindow = null;
      public CMainPanel(CMainFrame myWindow)
      {
            setLayout(new BorderLayout());

            /*
            JButton boutonFermer = new JButton("Fermer");
            add(boutonFermer, BorderLayout.SOUTH);

            MyListener myListener = new MyListener();
            */

            this.myWindow = myWindow;

            /*
            boutonFermer.addActionListener(myListener);
            */
      }

      public void paintComponent(Graphics g)
      {
            super.paintComponent(g);

            test(g);
      }

      void test(Graphics g)
      {
            //g.drawString("Mon Texte", 25, 25);

            //System.out.println("paint");

            CCharge chg = new CCharge();
            chg.set_position(100, 100, 0);
            //chg.set_charge(-1000); // -
            chg.set_charge(1000); // +
            chg.draw(g);

            chg.set_position(200, 100, 0);
            chg.set_charge(-1000); // -
            chg.draw(g);

            CGrid grid = new CGrid();
            grid.draw(g);
      }

      /*
      class MyListener implements ActionListener
      {
      public void actionPerformed(ActionEvent event)
      {
       maFenetre.dispose();
      }
      }
      */
}
