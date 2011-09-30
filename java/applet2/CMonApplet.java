import javax.swing.*;
import java.awt.*;

public class CMonApplet extends JApplet {
      public void init() {
         Container c = getContentPane();
         //c.add(new JLabel("hello"));

         // OUEST
         JPanel pSaisieCompte = new JPanel();
         pSaisieCompte.add(new JLabel("hello"));

         // CENTRE
         JPanel pChoix = new JPanel();
         pChoix.add(new JLabel("hello2"));

         // EST
         JLabel modifCompte = new JLabel("Modification compte");

         JLabel valeurSolde = new JLabel("Valeur solde");
         JTextField saisirValeurOp = new JTextField(20);

         JPanel pEffectuer = new JPanel();
         JButton bEffectuer = new JButton("Effectuer");
         pEffectuer.add(bEffectuer);

         JLabel resultatOperation = new JLabel("Resultat Operation");

         JPanel pOperationCompte = new JPanel();
         JPanel pModifCompteGlobal = new JPanel();
         pOperationCompte.setLayout(new GridLayout(4,1));

         pOperationCompte.add(valeurSolde);
         pOperationCompte.add(saisirValeurOp); //
         pOperationCompte.add(pEffectuer);
         pOperationCompte.add(resultatOperation);

         pModifCompteGlobal.setLayout(new BorderLayout());
         pModifCompteGlobal.add(modifCompte, BorderLayout.NORTH);
         
         JPanel pMain = new JPanel();
         pMain.setLayout(new GridLayout(1,3));

         pMain.add(pSaisieCompte);
         pMain.add(pChoix);
         pMain.add(pOperationCompte);

         c.add(pMain);
      }
}
