// http://developpeur.journaldunet.com/tutoriel/jav/040119java_debutant1.shtml


import java.awt.*;
import java.awt.event.*;
import javax.swing.*;



class FenetreSimpleExec // public
{
    public static void main(String[] args)
    {
	FenetreSimple fenetre = new FenetreSimple();
	fenetre.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	//fenetre.show(); // is deprecated
	fenetre.setVisible(true);
    }
}


class FenetreSimple extends JFrame
{
    public FenetreSimple()
    {
	Toolkit k = Toolkit.getDefaultToolkit();
	Dimension tailleEcran = k.getScreenSize();
	int largeurEcran = tailleEcran.width;
	int hauteurEcran = tailleEcran.height;

	setTitle("Un programme Java");
	setSize(largeurEcran/4, hauteurEcran/4);
	setLocation(largeurEcran*3/8, hauteurEcran*3/8);

	Contenu monContenu = new Contenu(this);
	Container leContenant = getContentPane();
	leContenant.add(monContenu);
    }
}


class Contenu extends JPanel
{
    private FenetreSimple maFenetre = null;
    public Contenu(FenetreSimple maFenetre)
    {
	setLayout(new BorderLayout());

	JButton boutonFermer = new JButton("Fermer");
	add(boutonFermer, BorderLayout.SOUTH);

	MyListener myListener = new MyListener();
	this.maFenetre = maFenetre;
	boutonFermer.addActionListener(myListener);
    }

    public void paintComponent(Graphics g)
    {
	super.paintComponent(g);
	g.drawString("Mon Texte", 25, 25);
    }

    class MyListener implements ActionListener
    {
	public void actionPerformed(ActionEvent event)
	{
	    maFenetre.dispose();
	}
    }
}
