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



public class CMain extends JApplet // public
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

	CMainFrame fenetre = new CMainFrame();
	fenetre.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	//fenetre.show(); // is deprecated
	fenetre.setVisible(true);
    }
  
}


class CMainFrame extends JFrame
{
    public CMainFrame()
    {
	Toolkit k = Toolkit.getDefaultToolkit();
	Dimension screen_size = k.getScreenSize();
	int width_screen = screen_size.width;
	int height_screen = screen_size.height;

	setTitle("fieldEB");
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


class CMainPanel extends JPanel
{
    private CMainFrame maFenetre = null;
    public CMainPanel(CMainFrame maFenetre)
    {
	setLayout(new BorderLayout());

	/*
	JButton boutonFermer = new JButton("Fermer");
	add(boutonFermer, BorderLayout.SOUTH);

	MyListener myListener = new MyListener();
	*/

	this.maFenetre = maFenetre;
	
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
	g.drawString("Mon Texte", 25, 25);

 	System.out.println("paint");

	CCharge chg = new CCharge();
	chg.set_position(100, 100, 0);
	chg.draw(g);
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