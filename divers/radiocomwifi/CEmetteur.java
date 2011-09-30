import java.io.*;
import java.net.*;

class CEmetteur {
    private static int N = 6; // nb de voies (axes + boutons)
   
    private static double[] Y = new double[N];
	
	private static int port = 81;
	private static String ip = "127.0.0.1";
   
    private static void init_Y() {
	// Y[0] gauche X
	// Y[1] gauche Y
	// Y[2] droite X
	// Y[3] droite Y
		for ( int i = 0 ; i<N ; i++)
	    {
			Y[i] = 50;
	    }
    }
   
    private static String makeMessage() {
	String msg = "<message>"+"\n";
	
	//msg += "<N>"+N+"</N>";
	
	for ( int i = 0 ; i<N ; i++) {
		msg += " "+"<Y"+i+">"+Y[i]+"</Y"+i+">"+"\n";
	}
		
	msg += "</message>";
		
	return msg;
    } 
   
    private static void printMessage() {
	String msg = makeMessage();
	System.out.println(msg);
    }
   
    private static void sendMessage() {
	// TO DO (socket UDP ou TCP ?)
	String msg = makeMessage();
	byte[] buffer = msg.getBytes();
	try {
		InetAddress adr = InetAddress.getByName(ip);
		DatagramPacket p = new DatagramPacket( buffer, buffer.length, adr, port);
		DatagramSocket ds = new DatagramSocket();
		ds.send(p);
	} catch ( UnknownHostException e ) {
		System.out.println("Erreur du nom de host: "+e.getMessage());
	} catch ( IOException e ) {
		System.out.println("Erreur I/O: "+e.getMessage());
	}
    }

    public static void main (String[] args){
	init_Y(); // inutile en Java mais pas en C
	
	while(true) {
		printMessage();
		sendMessage();
		//Y[0] += 0.1;
	}
    }

}
