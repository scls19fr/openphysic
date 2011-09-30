import java.applet.*;
import java.awt.*;
import java.awt.event.*;

public class CMain extends Applet implements ActionListener {
	Button sinus     = new Button("Sinus");
	Button cosinus   = new Button("Cosinus");
	Button tangente  = new Button("Tangente");
		
	int courbeNumber = 0;
	
	int sizeX, sizeY;
	
	double xInf = -Math.PI , yInf = -1;
	double xSup =  Math.PI , ySup =  1;
	
	public void init() {
		this.add(this.sinus);   
                this.add(this.cosinus);
                this.add(this.tangente);

		this.sinus.addActionListener(this);
		this.cosinus.addActionListener(this);
		this.tangente.addActionListener(this);
		
		Dimension dim = getSize();
		this.sizeX = dim.width;
		this.sizeY = dim.height;
	}
		
	private int coordToPixX(double x) {
		return (int)(sizeX * (x-xInf)/(xSup-xInf));
	}
			
	private int coordToPixY(double y) {
		return sizeY-(int)(sizeY * (y-yInf)/(ySup-yInf));
	}
	
	public void paint(Graphics gc) {
		// Trace des axes
		gc.drawLine(sizeX/2,0,sizeX/2,sizeY);
		gc.drawLine(0,sizeY/2,sizeX,sizeY/2);
		
		// Trace de la courbe
		double x = xInf , y , delta=0.05;
		double oldX=x;
                double oldY= courbeNumber==0?Math.sin(x):
                             courbeNumber==1?Math.cos(x):Math.tan(x);
		
		while(x <= xSup) { 
			y = courbeNumber==0?Math.sin(x):
                            courbeNumber==1?Math.cos(x):Math.tan(x);
			gc.drawLine(coordToPixX(oldX), coordToPixY(oldY),
				        coordToPixX(x), coordToPixY(y));
			oldX = x;   oldY = y;
			x += delta;
		}
	}
	
	public void actionPerformed(ActionEvent event) {
		Object source = event.getSource();
		
		if      (source == this.sinus)    courbeNumber=0;
		else if (source == this.cosinus)  courbeNumber=1;
		else if (source == this.tangente) courbeNumber=2;
		
		repaint();
	}
}
