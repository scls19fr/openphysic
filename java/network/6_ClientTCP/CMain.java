import java.net.*;
import java.io.*;

// ce programme est un client TCP


public class CMain {
	public CMain (String nomServeur, int port) {
		try {
			while ( true ) {
				Socket socket = new Socket(nomServeur, port);

				System.out.println("Tapez une ligne à envoyer au "
					+"serveur ou une ligne vide pour quitter.");

				String envoi = new BufferedReader(
					new InputStreamReader(System.in)).readLine();
				
				if (envoi.equals("")) {
					socket.close();
					break;
				}

				(new PrintStream(socket.getOutputStream())).println(envoi);

				String recu = (new BufferedReader(
					new InputStreamReader(
						socket.getInputStream()))).readLine();

				System.out.println(recu);

			}

		} catch ( IOException e) {
			System.out.println("Erreur I/O : "+e.getMessage());
		}
	}

	public static void main(String [] args) {
		if ( args.length < 2 ) {
			System.out.println(
				"Syntaxe: java ClientTCP NomServeur NumeroPort");
			System.exit(0);
		}

		new CMain(args[0], Integer.parseInt(args[1]));

	}
}
