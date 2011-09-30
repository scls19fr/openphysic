import java.awt.*;
import javax.swing.*;

public class Demo1 {
    public static void main(String[] args) {
	JCanvas jc = new JCanvas();
	jc.setBackground(Color.WHITE);
	jc.setPreferredSize(new Dimension(400,200));
	GUIHelper.showOnFrame(jc,"test");
    }
}