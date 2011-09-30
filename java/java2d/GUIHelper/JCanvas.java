import java.awt.*;
import javax.swing.*;

public class JCanvas extends JPanel {
    public void paint(Graphics g) {
	Color c = g.getColor();
	g.setColor(Color.RED);
	g.fillRect(10,10,80,80);
	g.setColor(Color.BLUE);
	g.fillOval(150,50,80,80);
	g.setColor(c);
    }
}

