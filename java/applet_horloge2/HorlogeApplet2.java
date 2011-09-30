// classe HorlogeApplet2 
// dessine une fenêtre graphique pour simuler une horloge digitale
// implémente l'interface RUNNABLE et utilise setText()

import java.util.*;
import java.text.*;
import java.awt.*;
import java.applet.*;

public class HorlogeApplet2 extends Applet implements Runnable {
public Thread t ;
Label l;

public void init() {
 Panel p = new Panel();
 l = new Label(donnerHeure());
 l.setFont(new Font("Times Roman", Font.BOLD,25));
 p.add(l); 
 add("Center", p);
 t = new Thread(this, "Horloge");
 t.start() ;
 }

/*
public String donnerHeure() {
 String jour , heure;
 Date date = new Date() ;

 TimeZone tz =TimeZone.getTimeZone("ECT");
 TimeZone.setDefault(tz);
 GregorianCalendar g = new GregorianCalendar();
 int hh = g.get(Calendar.HOUR)+1;
 int mm = g.get(Calendar.MINUTE);
 int ss = g.get(Calendar.SECOND);
 heure =hh+":"+mm+":"+ss ;
 jour = DateFormat.getDateInstance().format(date);
 return (jour+"   "+heure);
 }
*/
// en utilisant une "depreciated method"
public String donnerHeure() {
 String jour , heure;
 Date date = new Date() ;
 int hh = date.getHours();
 int mm = date.getMinutes();
 int ss = date.getSeconds();
 heure =date.toLocaleString();
 return (heure);
 }

public void run() {
 while (true) {
 l.setText(donnerHeure());
 try {
 Thread.sleep(1000);
 } catch (InterruptedException e) {}
 }
}

}

