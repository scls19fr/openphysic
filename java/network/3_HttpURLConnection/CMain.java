// classe HttpURLConnection

// cette classe etend URLConnection
// elle apporte les specificites du protocole http
//  - String getRequestMethode();
//  - boolean usingProxy();
//  - int getResponseCode();
//  - String getResponseMessage();
//  - InputStream getErrorStream();

// javac CMain.java
// java CMain http://www.google.fr

import java.io.*;
import java.net.*;

public class CMain {
    public static void main(String [] args) {
	try {
	    URL url = new URL(args[0]);

	    HttpURLConnection hurlc = (HttpURLConnection) url.openConnection();

	    System.out.println("getRequestMethod() : "
			       +hurlc.getRequestMethod());

	    System.out.println("usingProxy() : "
			       +hurlc.usingProxy());

	    System.out.println("getResponseCode() : "
			       +hurlc.getResponseCode());

	    System.out.println("getResponseMessage() : "
			       +hurlc.getResponseMessage());

	    System.out.println("getErrorStream() : "
			       +hurlc.getErrorStream());

	} catch (IOException e) {
	    System.out.println("Erreur a l'URL : "+e.getMessage());
	}
    }
}
