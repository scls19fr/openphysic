import javax.swing.*;
import java.awt.*;

public class CMonApplet extends JApplet {
    public void init() {
	Container c = getContentPane();
	c.add(new JLabel("hello"));
    }
}
