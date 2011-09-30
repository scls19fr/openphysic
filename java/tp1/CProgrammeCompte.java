// Compilation : javac CCompte.java CProgrammeCompte.java
// Execution : java CProgrammeCompte

public class CProgrammeCompte {
    public static void main (java.lang.String[] args)
	{
	    CCompte compte1 = new CCompte(10.0,5.0);
	    
	    // compte1.setSolde(10.0); c'est prive
	    compte1.getSolde();
	    compte1.debiter(5.0);
	    compte1.afficher();
	    compte1.crediter(30);
	    compte1.afficher();

	    CCompte compte2 = new CCompte(150.0);
	    compte2.afficher();
	    CCompte compte3 = new CCompte(300.0);	    
	    compte3.afficher();
	}

}
