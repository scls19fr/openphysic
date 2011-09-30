import java.net.*;
import java.io.*;

// ce programme est un serveur TCP

// $ sudo java CMain 80

public class CMain {
	public CMain(int port) {
		try {
			ServerSocket serverSocket = new ServerSocket(port);

			System.out.println("Serveur démarré");

			while ( true ) {
				Socket socket = serverSocket.accept();

				// Ici il faudrait créer un thread qui gère le socket

				String recu = (new BufferedReader(
					new InputStreamReader(
						socket.getInputStream()))).readLine();

				System.out.println("Le serveur a reçu : "+recu);

				(new PrintStream(socket.getOutputStream())).
					println(recu.toUpperCase());
			}


		} catch ( IOException ioe ) {
			System.out.println("Erreur I/O : "+ioe.getMessage());
		}
	}

	public static void main(String [] args) {
		if (args.length == 1)
			new CMain(Integer.parseInt(args[0]));
		else
			System.out.println(
				"Syntaxe: java CMain NumeroPort");
	}

}
