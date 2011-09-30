// CCompte
/*
CCompte
*/

public class CCompte {
    private double m_decouvertAutorise;
    private int  m_numeroCompte;
    private static int m_prochainNumeroCompteDisponible;
    private double  m_solde;

    public CCompte() {
	m_solde=0.0;
	m_decouvertAutorise=0.0;
	
	m_numeroCompte = m_prochainNumeroCompteDisponible;
	m_prochainNumeroCompteDisponible++;

	System.out.println("Constructeur CCompte() instancie compte Numero= " + m_numeroCompte + ", solde= " + m_solde + " , Decouvert autorise= " + m_decouvertAutorise);
	
    }

    public CCompte(double solde) {
	m_solde=solde;
	m_decouvertAutorise=0.0;
	
	m_numeroCompte = m_prochainNumeroCompteDisponible;
	m_prochainNumeroCompteDisponible++;

	System.out.println("Constructeur CCompte(double solde) instancie compte Numero= " + m_numeroCompte + ", solde= " + m_solde + " , Decouvert autorise= " + m_decouvertAutorise);
    }

    public CCompte(double solde, double decouvert) {
	m_solde=solde;
	m_decouvertAutorise=decouvert;
	
	m_numeroCompte = m_prochainNumeroCompteDisponible;
	m_prochainNumeroCompteDisponible++;

	System.out.println("Constructeur CCompte(double solde, double decouvert) instancie compte Numero= " + m_numeroCompte + ", solde= " + m_solde + " , Decouvert autorise= " + m_decouvertAutorise);	
    }

    public double getSolde() {
	return m_solde;
    }

    public double getDecouvert() {
	return m_decouvertAutorise;
    }

    public void debiter(double retrait) {
	m_solde=m_solde-retrait;
    }

    public void crediter(double depot) { 
	m_solde=m_solde+depot;
    }

    public int getNumero() { 
	return m_numeroCompte;
    }

    public void afficher() {
	System.out.println("Numero= " + m_numeroCompte +", Solde= " + m_solde + " Decouvert autorise= " + m_decouvertAutorise);
    }

    private void setSolde(double solde) {
	m_solde = solde;
    }
    
    private void setDecouvert(double decouvert) {
	m_decouvertAutorise = decouvert;
    }




}

