import java.net.*;
import java.io.*;

// ce programme permet d'envoyer des paquets UDP

// DatagramPacket
// DatagramSocket

// $ java CMain 127.0.0.1 80 hello


public class CMain { //EnvoiUDP {
	public static void main(String [] args) {
		if ( args.length < 3) {
			System.out.println(
				"Syntaxe: java EnvoiUDP addresse port message"
					);
			return;
		}
		byte[] buffer = args[2].getBytes();
		try {
			InetAddress adr = InetAddress.getByName( args[0]);
			int port = Integer.parseInt(args[1]);
			DatagramPacket p = new DatagramPacket( buffer, buffer.length, adr, port);

			/* -- */
			DatagramSocket ds = new DatagramSocket();
			ds.send(p);
			/* -- */

		} catch ( UnknownHostException e ) {
			System.out.println("Erreur du nom de host: "+e.getMessage());

		} catch ( IOException e ) {
			System.out.println("Erreur I/O: "+e.getMessage());
		}

	}
}
