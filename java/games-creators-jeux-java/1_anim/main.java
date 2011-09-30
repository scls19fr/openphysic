import java.awt.*;

class Main extends Frame
{
    int x; // Variable du diametre
    private RenderingThread render; // Variable de notre thread
    public Main()
    {
	System.out.println(" Main" );
	render = new RenderingThread();
	x = 50;
	setSize(400,400);
	setVisible(true);
	render.start();
    }
    public static void main(String args[])
    {
	new Main();
    }
    public void paint(Graphics g)
    {
	x++; // 3 lignes pour modifer le diametre
	if(x > 180)
	    x = 30;
	g.drawOval(100,100,x,x);
    }
    class RenderingThread extends Thread {
	public void run() {
	    while(true)
		{
		    try {
			sleep(20);
			repaint();
		    } catch (java.lang.InterruptedException e){}
		}
	}
    }
}
