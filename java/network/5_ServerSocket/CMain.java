import java.net.*;
import java.io.*;

// ce programme est un serveur

// côté serveur
// il faut être root pour lancer ce programme
// $ sudo java CMain (sinon erreur = permission denied)

// côté client
// (sur la même machine donc adresse IP = localhost = 127.0.0.1)
// $ telnet 127.0.0.1 80

public class CMain {
	public static void main(String [] args) {
		try {
			final int port = 80;
				// 23 : telnet
				// 80 : http (web)
			ServerSocket serv = new ServerSocket(port);
			Socket s;
			System.out.println("Serveur en attente");
			while ( (s = serv.accept())!=null ) {
				// connexion d'un client
				System.out.println("Socket écoute sur l'adresse : "+s.getInetAddress());
				s.close();
			}
			System.out.println("Serveur fermé");
		} catch ( IOException e) {
			System.out.println("Erreur IO : "+e.getMessage());
		}
	}
}
