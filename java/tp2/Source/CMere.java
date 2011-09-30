/**
 *Classe mere 
 */
public class CMere
{
      /**
       *Constructeur par defaut
       */
      public CMere()
      {
         System.out.println("Constructeur CMere()");
      }
           
      /**
       *Constructeur initialisant la valeur et le nom
       *@param nom la chaine de caractere donnee a m_nom
       */
      public CMere(String nom)
      {
         System.out.println("Constructeur CMere(String nom)");
         m_nom=nom;
      }
      
      /**
       *Accesseur sur le nom de l'objet
       *@return le nom de l'objet m_nom
       */
      public String getNom()
      {
         System.out.println("getNom() de CMere pour "+m_nom);
         return m_nom;
      }
      
      /**
       *Accesseur sur le nom de l'objet
       *@param nom le nom de l'objet
       */
      public void setNom(String nom)
      {
         System.out.println("setNom() de CMere pour "+m_nom);
         m_nom=nom;
      }
      
      /**
       *Affiche l'objet sur la sortie standard
       */
      public void afficher()
      {
         System.out.println("afficherVal() de CMere pour : "+m_nom);
      }

      /**
       *Le nom de l'objet
       */
      protected String m_nom;
} 



