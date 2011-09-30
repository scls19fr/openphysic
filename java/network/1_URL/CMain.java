// Ce programme recupere le contenu d'un fichier
// sur un serveur web

import java.io.*;
import java.net.*;

public class CMain {
    public static void main( String [] args) {
	try {
	    // se connecte a l'URL specifiee en argument
	    URL url = new URL(args[0]);
	    
	    // recupere le flux du contenu de l'URL
	    InputStream in = url.openStream();

	    // recupere la taille
	    int taille = in.available();
	    System.out.println( taille + " octets disponibles :");

	    // lit le contenu dans un tableau de bytes
	    byte[] t = new byte[taille];
	    in.read(t);
	    System.out.write(t);

	} catch ( IOException e) {
	    System.out.println("Erreur a l'URL: "+e.getMessage());
	}
    }
}
