import java.util.*;

/*
 *Classe qui est la classe fille 
 */

public class CFille extends CMere
{

    /*
     *Constructeur par defaut
       */
      public CFille()
      {
         System.out.println("Constructeur CFille()");
      }
           
      /**
       *Constructeur initialisant la valeur et le nom
       *@param nom la chaine de caractere donnee a m_nom
       */
      public CFille(String nom)
      {
         System.out.println("Constructeur CFille(String nom)");
         m_nom=nom;
      }
      
      /**
       *Accesseur sur le nom de l'objet
       *@return le nom de l'objet m_nom
       */
      public String getNom()
      {
         System.out.println("getNom() de CFille pour "+m_nom);
         return m_nom;
      }
      
      /**
       *Accesseur sur le nom de l'objet
       *@param nom le nom de l'objet
       */
      public void setNom(String nom)
      {
         System.out.println("setNom() de CFille pour "+m_nom);
         m_nom=nom;
      }
      
      /**
       *Affiche l'objet sur la sortie standard
       */
      public void afficher()
      {
         System.out.println("afficherVal() de CFille pour : "+m_nom);
      }
    
} 



