// Interface Runnable


class Activite {
    // classe parente de ActiviteMultiThread
}

class ActiviteMultiThread extends Activite implements Runnable {
    // classe dérivée de Activite qui implemente l'interface Runnable
    public void run() {
	// Code du thread
	System.out.println("thread");
    }
    // attributs et methode de classe
}

class CMain {
    public static void main(String [] args) {
	ActiviteMultiThread b = new ActiviteMultiThread();

	Thread t1 = new Thread(b);
	t1.start();
	
	Thread t2 = new Thread(b);
	t2.start();
    }
}
