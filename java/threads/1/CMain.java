// La classe Thread

class CMain extends Thread {
    public void run() {
	// Ici le code d'execution du thread
	System.out.println("thread");
    }

    public static void main( String [] args) {
	CMain t1 = new CMain(); // un thread
	t1.start();

	CMain t2 = new CMain(); // un autre thread
	t2.start();
    }
}
