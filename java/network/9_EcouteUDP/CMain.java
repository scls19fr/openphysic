import java.net.*;
import java.io.*;

// ce programme permet d'écouter et d'afficher des paquets UDP

// $ sudo java CMain 80

public class CMain {
	public static void main(String[] args) {
		if ( args.length < 1) {
			System.out.println("Syntaxe: java EcouteUDP port");
			return;
		}

		byte[] buffer = new byte[1024];

		// taille du buffer arbitrairement choisie

		DatagramPacket paquet = new DatagramPacket( buffer, buffer.length);
	
		int port = Integer.parseInt(args[0]);

		try {
			DatagramSocket ds = new DatagramSocket(port);

			//while ( true )  { // TO FIX : la fin du paquet reste rempli (voir client)
				ds.receive(paquet);
				System.out.println("Paquet reçu: "
					+ new String(paquet.getData()));
			//}

		} catch ( IOException e ) {
			System.out.println("Erreur I/O: "+e.getMessage());
		}
	}
}
