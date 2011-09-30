import java.awt.*;
import java.awt.image.*;
class Main extends Frame
{
    int x;
    private RenderingThread render;
    private BufferStrategy strategy;
    private Graphics backBuffer;
    public Main()
    {
	System.out.println(" Main" );
	render = new RenderingThread();
	x = 50;
	setSize(400, 400);
	setVisible(true);
	setIgnoreRepaint(true);
	createBufferStrategy(2);
	strategy = getBufferStrategy();
	backBuffer = strategy.getDrawGraphics();
	render.start();
    }
    public static void main(String args[])
    {
	new Main();
    }
    private void renderingRoutine()
    {
	x++;
	if(x >  180)
	    x = 30;
	backBuffer.setColor(Color.white);
	backBuffer.fillRect(0,0,getWidth(),getHeight());
	backBuffer.setColor(Color.black);
	backBuffer.fillOval(100,100,x,x);
	strategy.show();
    }
    class RenderingThread extends Thread {
	public void run() {
	    while(true)
		{
		    try {
			sleep(20);
			renderingRoutine();
		    } catch (java.lang.InterruptedException e){}
		}
	}
    }
}
