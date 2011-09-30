// ce programme affiche toutes les entrees du header d'une URL
// java CMain http://www.yahoo.com

// la classe URLConnection
// permet de recuperer les infos presentes dans le header

import java.util.*; // pour Map et Iterator
import java.io.*;
import java.net.*;

public class CMain {
    public static void main(String [] args)
    {
	try {
	    // se connecter sur l'URL specifie en argument
	    URL url = new URL(args[0]);
	    
	    // recuperer l'URLConnection
	    URLConnection urlc = url.openConnection();

	    // recuperer le header dans un Map
	    Map map = urlc.getHeaderFields();

	    // recuperer toutes les cles du Map
	    Iterator it = map.keySet().iterator();
	    System.out.println("Entres du Header de cette URL : ");

	    // afficher toutes les entrees
	    while( it.hasNext() ) {
		Object champ = it.next();

		// on teste si null (si entree sans cle)
		if (champ != null)
		    System.out.println( champ+" -> "
			 +urlc.getHeaderField(champ.toString()));
	    }

	} catch (IOException e) {
	    System.out.println("Erreur a l'URL : "+e.getMessage());
	}
    }
}
