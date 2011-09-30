import java.net.*;
import java.io.*;

class CRecepteur {
	private static int N = 6; // nb de voies (axes + boutons)
	
	private static double[] Y = new double[N];
		
	private static int port = 81;
	
	private static void printY() {
		for ( int i = 0 ; i<N ; i++)
	    {
			System.out.println("Y["+i+"] = "+Y[i]);
	    }
	}
	
	private static void parseMessage(String msg) {
		System.out.println(msg);
		//printY();
	}
	
    public static void main (String[] args){
		int tailleBuffer = 256; // 1024 trop grand - 64 trop petit
		byte[] buffer = new byte[tailleBuffer]; // taille du buffer arbitrairement choisie

		DatagramPacket paquet = new DatagramPacket( buffer, buffer.length);

		try {
			DatagramSocket ds = new DatagramSocket(port);

			while ( true )  { // TO FIX : la fin du paquet reste rempli (voir client)
					ds.receive(paquet);
					String msg = "";
					//msg += "Paquet recu : "+"\n";
					msg += new String(paquet.getData());
					parseMessage(msg);
			}
		} catch ( IOException e ) {
			System.out.println("Erreur I/O: "+e.getMessage());
		}
	}
}

