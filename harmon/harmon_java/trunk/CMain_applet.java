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


//import java.applet.*;
import javax.swing.*;
import javax.swing.event.*;
import java.awt.*;
import java.awt.event.*;


public class CMain_applet extends JApplet implements ActionListener, ChangeListener {
    CSignal sgn;

    int mode = 0; // 0=s(t) 1, etc...

    Display display = new Display();

    JButton butST = new JButton("s(t)");
    JButton butAF = new JButton("a(f)");
    JButton butPHIF = new JButton("phi(f)");
    JButton butAFPHIF = new JButton("a(f) - phi(f)");
    JButton butSOUND = new JButton("Son");

    JSlider slF1 = new JSlider(JSlider.VERTICAL, 0, 20000, 5000);

    JSlider slA0 = new JSlider(JSlider.VERTICAL, -100, 100, 0);
    JSlider slA1 = new JSlider(JSlider.VERTICAL, 0, 100, 100);

    JSlider slA2 = new JSlider(JSlider.VERTICAL, 0, 100, 0);
    JSlider slPHI2 = new JSlider(JSlider.VERTICAL, -180, 180, 0);

    JSlider slA3 = new JSlider(JSlider.VERTICAL, 0, 100, 0);
    JSlider slPHI3 = new JSlider(JSlider.VERTICAL, -180, 180, 0);

    JSlider slA4 = new JSlider(JSlider.VERTICAL, 0, 100, 0);
    JSlider slPHI4 = new JSlider(JSlider.VERTICAL, -180, 180, 0);

    JSlider slA5 = new JSlider(JSlider.VERTICAL, 0, 100, 0);
    JSlider slPHI5 = new JSlider(JSlider.VERTICAL, -180, 180, 0);

    JSlider slA6 = new JSlider(JSlider.VERTICAL, 0, 100, 0);
    JSlider slPHI6 = new JSlider(JSlider.VERTICAL, -180, 180, 0);

    JSlider slA7 = new JSlider(JSlider.VERTICAL, 0, 100, 0);
    JSlider slPHI7 = new JSlider(JSlider.VERTICAL, -180, 180, 0);

    JSlider slA8 = new JSlider(JSlider.VERTICAL, 0, 100, 0);
    JSlider slPHI8 = new JSlider(JSlider.VERTICAL, -180, 180, 0);

    JSlider slA9 = new JSlider(JSlider.VERTICAL, 0, 100, 0);
    JSlider slPHI9 = new JSlider(JSlider.VERTICAL, -180, 180, 0);

    JSlider slA10 = new JSlider(JSlider.VERTICAL, 0, 100, 0);
    JSlider slPHI10 = new JSlider(JSlider.VERTICAL, -180, 180, 0);

    JLabel txtStatusBar = new JLabel();


    public void init() {
	//	System.out.println("init");

	Container c = getContentPane();
	
	BorderLayout layoutMain = new BorderLayout();
	c.setLayout(layoutMain);


	c.add("Center", display);

	
	Container cEast = new Container();
	GridLayout lEast = new GridLayout(5,1);
	cEast.setLayout(lEast);


	cEast.add(butST);
	butST.addActionListener( this );
	cEast.add(butAF);
	butAF.addActionListener( this );
	cEast.add(butPHIF);
	butPHIF.addActionListener( this );
	cEast.add(butAFPHIF);
	butAFPHIF.addActionListener( this );
	cEast.add(butSOUND);
	butSOUND.addActionListener( this );

	c.add("East", cEast);

	Container cSouth = new Container();
	GridLayout layoutSouth = new GridLayout(2,1);
	cSouth.setLayout(layoutSouth);

	Container cSouthUp = new Container();
	

	GridLayout layoutSouthUp = new GridLayout(1,12);
	cSouthUp.setLayout(layoutSouthUp);

	cSouthUp.add(slF1);
	slF1.addChangeListener( this );
	cSouthUp.add(slA0);
	slA0.addChangeListener( this );
	cSouthUp.add(slA1);
	slA1.addChangeListener( this );
	
	Container cHarm2 = new Container();
	GridLayout lHarm2 = new GridLayout(2,1);
	cHarm2.setLayout(lHarm2);
	cHarm2.add(slA2);
	cHarm2.add(slPHI2);
	slA2.addChangeListener( this );
	slPHI2.addChangeListener( this );
	cSouthUp.add(cHarm2);

	Container cHarm3 = new Container();
	GridLayout lHarm3 = new GridLayout(2,1);
	cHarm3.setLayout(lHarm3);
	cHarm3.add(slA3);
	cHarm3.add(slPHI3);
	slA3.addChangeListener( this );
	slPHI3.addChangeListener( this );
	cSouthUp.add(cHarm3);

	Container cHarm4 = new Container();
	GridLayout lHarm4 = new GridLayout(2,1);
	cHarm4.setLayout(lHarm4);
	cHarm4.add(slA4);
	cHarm4.add(slPHI4);
	slA4.addChangeListener( this );
	slPHI4.addChangeListener( this );
	cSouthUp.add(cHarm4);

	Container cHarm5 = new Container();
	GridLayout lHarm5 = new GridLayout(2,1);
	cHarm5.setLayout(lHarm5);
	cHarm5.add(slA5);
	cHarm5.add(slPHI5);
	slA5.addChangeListener( this );
	slPHI5.addChangeListener( this );
	cSouthUp.add(cHarm5);

	Container cHarm6 = new Container();
	GridLayout lHarm6 = new GridLayout(2,1);
	cHarm6.setLayout(lHarm6);
	cHarm6.add(slA6);
	cHarm6.add(slPHI6);
	slA6.addChangeListener( this );
	slPHI6.addChangeListener( this );
	cSouthUp.add(cHarm6);

	Container cHarm7 = new Container();
	GridLayout lHarm7 = new GridLayout(2,1);
	cHarm7.setLayout(lHarm7);
	cHarm7.add(slA7);
	cHarm7.add(slPHI7);
	slA7.addChangeListener( this );
	slPHI7.addChangeListener( this );
	cSouthUp.add(cHarm7);


	Container cHarm8 = new Container();
	GridLayout lHarm8 = new GridLayout(2,1);
	cHarm8.setLayout(lHarm8);
	cHarm8.add(slA8);
	cHarm8.add(slPHI8);
	slA8.addChangeListener( this );
	slPHI8.addChangeListener( this );
	cSouthUp.add(cHarm8);

	Container cHarm9 = new Container();
	GridLayout lHarm9 = new GridLayout(2,1);
	cHarm9.setLayout(lHarm9);
	cHarm9.add(slA9);
	cHarm9.add(slPHI9);
	slA9.addChangeListener( this );
	slPHI9.addChangeListener( this );
	cSouthUp.add(cHarm9);

	Container cHarm10 = new Container();
	GridLayout lHarm10 = new GridLayout(2,1);
	cHarm10.setLayout(lHarm10);
	cHarm10.add(slA10);
	cHarm10.add(slPHI10);
	slA10.addChangeListener( this );
	slPHI10.addChangeListener( this );
	cSouthUp.add(cHarm10);


	cSouth.add(cSouthUp);
	cSouth.add(txtStatusBar);

	c.add("South", cSouthUp);
	

    }

    public void start() {
	//	System.out.println("start");

	sgn = new CSignal();	

	sliders_to_sgn();
	//sgn_to_slider();
    }

    /*
      public void stop() {
      System.out.println("stop");
      }
    */

    /*
      public void destroy() {
      System.out.println("destroy");
      }
    */


    /*
      public void paint( Graphics g ) {
      System.out.println("paint");

      //g.drawString("paint",10,10);
      }
    */

    /*
      public void sliders_init()
      {
	
      }
    */


    public void sliders_to_sgn()
    {
	sgn.set_f1(slF1.getValue());
	//	sgn.set_a0(slA0.getValue()/100.0);

	System.out.println(slA0.getValue()/100.0);


	sgn.set_a1(slA1.getValue()/100.0);

	sgn.set_amplitude(2, slA2.getValue()/100.0);
	sgn.set_phase(2, slPHI2.getValue());

	sgn.set_amplitude(3, slA3.getValue()/100.0);
	sgn.set_phase(3, slPHI3.getValue());

	sgn.set_amplitude(4, slA4.getValue()/100.0);
	sgn.set_phase(4, slPHI4.getValue());

	sgn.set_amplitude(5, slA5.getValue()/100.0);
	sgn.set_phase(5, slPHI5.getValue());

	sgn.set_amplitude(6, slA6.getValue()/100.0);
	sgn.set_phase(6, slPHI6.getValue());

	sgn.set_amplitude(7, slA7.getValue()/100.0);
	sgn.set_phase(7, slPHI7.getValue());

	sgn.set_amplitude(8, slA8.getValue()/100.0);
	sgn.set_phase(8, slPHI8.getValue());

	sgn.set_amplitude(9, slA9.getValue()/100.0);
	sgn.set_phase(9, slPHI9.getValue());

	sgn.set_amplitude(10, slA10.getValue()/100.0);
	sgn.set_phase(10, slPHI10.getValue());

	sgn.Test_Signal();
    }


    public void sgn_to_sliders()
    {
	//slF1.setValue(((int) sgn.get_f1()));
	//slA0.setValue(((int) sgn.get_a0()*100.0));
	//slA1.setValue(((int) sgn.get_a1()*100.0));

	//sgn.set_amplitude(2,slA2.getValue()/100.0);
	//sgn.set_phase(2,slPHI2.getValue());


	//sgn.Test_Signal();
    }





    public void actionPerformed(ActionEvent e){

	Frame fr=null;
	Component parentCourant=this;
	while (parentCourant!=null && fr==null) {
	    if (parentCourant instanceof Frame) fr=(Frame)parentCourant;
	    else parentCourant=parentCourant.getParent();
	} 

	if (e.getSource() == butST )
	    {
		// traitement bouton s(t)
		MsgBox.affMsg(fr, "s(t) !");
	    }
	else
	    {
		System.out.println("TO DO");
		MsgBox.affMsg(fr, "TO DO !");
	    }

    }

    /*
      class sliderListener implements ChangeListener {
      public void actionPerformed(ActionEvent e){

      }
      }
    */

    //public Graphics m_g; // = new Graphics();

    public void stateChanged(ChangeEvent e) {
	//System.out.println("SLIDERS CHANGED !");

	sliders_to_sgn();

	//sgn.Test_Signal();

	//Draw(m_g);
	display.repaint();
    }




    public class Display extends Canvas
    {
	public void paint( Graphics g ) {
	    //System.out.println("paint canvas");	    
	    //	    g.drawString("paint canvas",10,10);
	    
	    //m_g = g;


	    Draw(g);

	}

	void Draw(Graphics g)
	{
	    if (mode == 0)
		{
		    DrawST(g);
		}
	    else
		{
		    throw new RuntimeException("undefinded_mode");
		}
	}


	void DrawST( Graphics g )
	{
	    double x_min = 0;
	    double y_min = 0;
	    double x_max = this.getSize().width;
	    double y_max = this.getSize().height;

	    double Nb_pts = 100;

	    double T1 = 1/(sgn.get_f1());
	    double t_min = -T1/2;
	    double t_max = T1/2;
     
	    //double t = t_min;
	    double s = sgn.get_value(-T1/2) - sgn.get_a0();
	    double s_min = sgn.get_value(-T1/2) - sgn.get_a0();
	    double s_max = s_min; //sgn.get_value(-T1/1);

	    
	    for (double time=t_min+T1/Nb_pts ; time<t_max ; time+=T1/Nb_pts)
		{
		    s = sgn.get_value(time) - sgn.get_a0();  // ? Il faut revoir ce code car on ne voit pas l'offset !!!
		    if (s>s_max)
			{
			    s_max=s;
			}
		    if (s<s_min)
			{
			    s_min=s;
			}
		}

	    double x0 = x_min;
	    double y0 = -(y_max-y_min)/(s_max-s_min)*(sgn.get_value(t_min))+y_max/2;
     
	    double x1 =0;
	    double y1 = 0;

	    g.setColor(Color.red);
	    for (double time=t_min+T1/Nb_pts ; time<=t_max ; time+=T1/Nb_pts)
		{
		    x1 = (x_max-x_min)/(t_max-t_min)*(time-t_min)+t_min;
		    //		    y1 = (y_max-y_min)/(s_max-s_min)*(sgn.get_value(time))+y_max/2;
		    y1 = -(y_max-y_min)/(s_max-s_min)*(sgn.get_value(time))+y_max/2;
		    g.drawLine((int) x0, (int) y0, (int) x1, (int) y1);
		    x0 = x1;
		    y0 = y1;
		}
	    g.setColor(Color.black);

	    g.drawLine((int) x_min, (int) y_max/2, (int) x_max, (int) y_max/2); // GND
	    g.drawLine((int) x_max/2, (int) y_min, (int) x_max/2, (int) y_max); // VERTICAL CENTRE
	    g.drawLine((int) x_min, (int) y_min, (int) x_max, (int) y_min); // SUD
	    g.drawLine((int) x_min, (int) y_max, (int) x_max, (int) y_max); // NORD
	    g.drawLine((int) x_min, (int) y_min, (int) x_min, (int) y_max); // EST
	    g.drawLine((int) x_max, (int) y_min, (int) x_max, (int) y_max); // OUEST

	}

    }

}




class MsgBox extends JDialog implements ActionListener {
    boolean id=false;  //permet de connaitre le bouton utilise
    Button ok,can;

    MsgBox(Frame fr, String msg, boolean okcan) {
	//constructeur herite
	super(fr, "Message", true);
	//gestionnaire de positionnement
	setLayout(new BorderLayout());
	//ligne de message
	add(BorderLayout.CENTER,new Label(msg,Label.CENTER));
	//boutons
	Panel p=new Panel();
	p.setLayout(new FlowLayout());
	ok=new Button(" OK ");
	p.add(ok);
	ok.addActionListener(this); 
	if (okcan) {
	    can=new Button("Annule");
	    p.add(can);
	    can.addActionListener(this);
	}
	add(BorderLayout.SOUTH,p);
	//dimensions et positionnement
	pack();
	Dimension d=getToolkit().getScreenSize();
	setLocation(d.width/3,d.height/3);
	//affichage
	setVisible(true);
    }

    public void actionPerformed(ActionEvent e) {
	if(e.getSource()==ok) {
	    id=true;
	    setVisible(false);
	}
	else if(e.getSource()==can) {
	    id=false;
	    setVisible(false);
	}
    }

    public static void affMsg(Frame fr, String msg) {
	MsgBox message=new MsgBox(fr, msg, false);
	message.dispose();
    }
 
    public static boolean affQuest(Frame fr, String msg) {
	MsgBox message=new MsgBox(fr, msg,true);
	boolean rep=message.id;
	message.dispose();
	return rep;
    }
}
