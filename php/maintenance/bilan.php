<?


session_start(); // demarrage de la session

//connexion à la base de données
require("connexion.php");

//lecture du mot de passe administrateur
$requete = mysql_query("SELECT * FROM maint_password WHERE nom = 'admin'");
$retour = mysql_fetch_array($requete);
$bonpassword = $retour[code];

 // date du jour
$ladate=strtotime (date("Y-m-d H:i:s"));


//calcul et affichage des heures sur la période $jours
function calcul_heures($jours)
         {
         global $ladate;

         $minutes = 0;
         $requete = mysql_query("SELECT duree FROM maint_travaux WHERE (datefin2 > $ladate - ($jours*24*60*60))");
         while($row = mysql_fetch_array($requete))
            {
            $duree=($row["duree"]);
            $minutes = $minutes + $duree;
            }
         $heures = $minutes/60;
         //arrondi avec une décimale
         echo round (10 * $heures)/10;
         }


//test du mot de passe
if ($password == $bonpassword)

{


        // affichage d'un lien de deconnexion de la session
        ?>
        <html>
        <body bgcolor="#FFDCA8" >
        <p>

        <table width="100%" border="0">
        <tr>
            <td>
                <div align="left"><form method="post" action="logout.php">
                <input type="submit" name="submit" value="DECONNEXION"></div></form>
            </td>
            <td>
                <?
                // affichage des statistiques
                echo "<hr>";
                echo "<b>Décompte : </b>" ;

                echo " &nbsp;&nbsp;&nbsp;&nbsp;";

                //calcul et affichage des heures
                echo "<b>";
                calcul_heures(8);
                echo " h </b> sur 8 jours ";

                echo " &nbsp;&nbsp;&nbsp;&nbsp;";

                //calcul et affichage des heures
                echo "<b>";
                calcul_heures(30);
                echo " h </b> sur 30 jours ";

                echo " &nbsp;&nbsp;&nbsp;&nbsp;";

                //calcul et affichage des heures
                echo "<b>";
                calcul_heures(365);
                echo " h </b> sur 365 jours ";

                //calcul du nombre d'intervention sur 365 jours'
                $requete = mysql_query("SELECT * FROM maint_travaux WHERE (datefin2 > $ladate - (365*24*60*60))");
                $somme = mysql_numrows($requete); /* On recupère le nombre d'enregistrements */
                echo "<i><b>( $somme interventions )</i></b>";

                echo "<hr>";
                ?>
            </td>

            <td>
                <div align="right"><form method="post" action="configuration.php">
                <input type="submit" name="submit" value="CONFIGURATION"></div></form>
            </td>
        </tr>
        </table>


        <?

       //si un identificateur de champ existe
       // le formulaire vient d'être complété par admin après maintenance
       if (isset($id))
           {
            if ($bouton == "        MISE A JOUR        ")
                {
                //mise à jour des données
                if ($datefin == 0)  //pour changer la date une seule fois
                   {$result=mysql_query("UPDATE maint_travaux SET intervention='$intervention',intervenant='$intervenant',duree='$duree',datefin2='$ladate' WHERE id='$id'");}
                   else
                   {$result=mysql_query("UPDATE maint_travaux SET intervention='$intervention',intervenant='$intervenant',duree='$duree' WHERE id='$id'");}
                // fin du test date

                if (!$result)
                     {echo "L'enregistrement de vos données a échoué. Essayez plus tard<br>";}

                //envoi d'un mél au demandeur si email valide
                //if ($email <>"")
                if(ereg("^.+@.+\\..+$", $email))
                   {
                      //elimination des erreur d'envoi de mél
                       error_reporting (0);
                       mail("$email", "Suivi de maintenance","Suite à votre demande \n\n ".stripslashes($probleme).
                             "\n\n L'intervention suivante a été effectuée par $intervenant \n\n ".stripslashes($texte).
                             "\n\n Cette intervention à demandé $duree mn");
                   }
                }//fin de mise à jour

            if ($bouton == "Supprimer") //la fiche id doit être supprimée
                {
                     ?>

                     <form method="post" action="<? echo"bilan.php?id=$id"; ?>">
                         <hr>
                         <b><font color="#FF0000">Confirmation d'effacement de la fiche : </font></b>
                         &nbsp;&nbsp;&nbsp;&nbsp;
                         <input type="submit" name="bouton" value="OK">
                         &nbsp;&nbsp;&nbsp;&nbsp;
                         <input type="submit" name="bouton" value="Annuler">
                         <hr>
                     </form>

               <?
                }

            if ($bouton == "OK") //la demande de suppression a été validée
                {
                $result=mysql_query("DELETE FROM maint_travaux WHERE id = '$id'");
                }

           }// fin du test ID


       //Enregistrement d'une intervention non demandée dans le formulaire vide'
       if ($Submit == "Enregistrer")
          {
          $result=mysql_query("INSERT INTO maint_travaux (intervention,intervenant,duree,datefin2) VALUES ('$intervention','$intervenant','$duree','$ladate')");
          }

       // affichage du premier formulaire vide
       ?>
       <table width="100%" bgcolor="#F9AC3F">
       <tr><td>
       <form method="post" action="<?echo "bilan.php";?>">
       <input type="text" name="intervention" size="136%" value="Fiche vide"><br>
        Temps passé : <input type="text" name="duree" size="5" value="0">
        Par <select name="intervenant">
        <option>Admin</option>
         <?
         //menu déroulant des administrateurs
         $requeteadmin = mysql_query("SELECT * FROM maint_admin");
         while($row = mysql_fetch_array($requeteadmin))
               {
               echo "<option>".($row["nom"])."</option>";
               }
         ?>
        </select>
        <input type="submit" name="Submit" value="Enregistrer">
      </form>
      </td></tr>
      <table>
      <br>
       <?
       // liste des formulaires enregistrés, bilan de toutes les demandes

// affichage des formulaires de la requête
function affiche_form($requete)
       {
            global $admin1, $admin2,$admin3,$admin4,$admin5;

            while($row = mysql_fetch_array($requete))
            {
            $id=($row["id"]);
            $nom=($row["nom"]);
            $email=($row["email"]);
            $salle=($row["salle"]);
            $poste=($row["poste"]);
            $probleme=($row["probleme"]);
            $datedebut=$row["datedebut2"];
                       //list($annee1,$mois1,$jour1,$heure1,$minute1,$seconde1) = split('[- :]',$datedebut);
            $intervention=($row["intervention"]);
            $intervenant=($row["intervenant"]);
            $datefin=$row["datefin2"];
                     //list($annee2,$mois2,$jour2,$heure2,$minute2,$seconde2) = split('[- :]',$datefin);
            $duree=($row["duree"]);

            ?>

            <table width="100%" bgcolor="#FBC77D">
              <tr>
                  <td>
                  <?
                  // les champs vides ne sont pas affichés

                    if ($datedebut <> 0)
                        {echo "Le ",strftime("%d - %m - %Y à %H h %M mn",$datedebut);}

                   if ($salle <> "")
                       {echo ", Salle : $salle";}

                   if ($poste <> "")
                        {echo ", Poste : $poste";}

                        echo"<br>";

                   //présence d'info sur la ligne pour l'afficher ou pas'
                   $ligne = false;
                   if ($nom <> "")
                        {
                        $ligne = true;
                        echo "Demande de  <b>$nom</b> ";
                        }

                   if ($email <> "")
                        {
                        $ligne = true;
                        echo "&nbsp;&nbsp;&nbsp;<i> ( $email ) </i>";
                        }

                   if ($ligne == true)
                        {echo"<br>";}

                   if ($probleme <> "")
                       {echo "La demande d'intervention est :&nbsp;<b>$probleme</b>";}

                   ?>
                   </td>
              </tr>
              <tr>
                  <td>
                   <form method="post" action="<?echo "bilan.php?id=$id&email=$email";?>">
                    <?
                    //si l'intervention n'est pas encore effectuée, une puce rouge est affichée
                     if ($intervention == "")
                         {?><img src="puce.gif" width="24" height="24"><?;}
                          ?>
                          <input type="text" name="intervention" size="136" value="<?echo "$intervention";?>"><br>
                          Temps passé : <input type="text" name="duree" size="5" value="<?echo "$duree mn";?>">
                          <?if ($datefin <> 0)
                               {?>
                               Le <input type="text" name="datefin" size="24" value="<? echo strftime("%d - %m - %Y à %H h %M mn",$datefin);?>">
                               <?}?>
                          Par <select name="intervenant">
                          <option value="<? echo "$intervenant";?>" selected><? echo "$intervenant";?></option>
                           <?
                           //menu déroulant des administrateurs
                           $requeteadmin = mysql_query("SELECT * FROM maint_admin");
                           while($row = mysql_fetch_array($requeteadmin))
                              {
                              echo "<option>".($row["nom"])."</option>";
                              }
                           ?>
                          </select>
                          <input type="submit" name="bouton" value="        MISE A JOUR        ">
                          <input type="submit" name="bouton" value="Supprimer">
                    </form>
                   </td>
            </tr>
       </table>
       <br>

       <?
}  //fin du while

// fin de la fonction

       }
       //affichage des interventions à faire
       $requete = mysql_query("SELECT * FROM maint_travaux WHERE (intervention = '') ORDER BY id DESC ");
       affiche_form($requete);//fonction ci dessus

       //si la variable de session "nombre de jour" est perdue
       if ($nombrejours == "")
           {
           //lecture du nombre de jours par défaut
           $requete = mysql_query("SELECT valeur FROM maint_divers WHERE nom = 'jours'");
           $retour = mysql_fetch_array($requete);
           $nombrejours = $retour[valeur];
           }


       //affichage des interventions faites depuis N jours
       $requete = mysql_query("SELECT * FROM maint_travaux  WHERE ((intervention <> '') and (datefin2 > $ladate - ($nombrejours*24*60*60)))  ORDER BY id DESC  ");
       affiche_form($requete);


mysql_close();

unset($id);   //destruction de la variable

?>
<table width="100%" border="0">
  <tr>
    <td>
         <div align="left"><form method="post" action="logout.php">
         <input type="submit" name="submit" value="DECONNEXION"></div></form>
    </td>
    <td>
         <div align="right"><form method="post" action="configuration.php">
         <input type="submit" name="submit" value="CONFIGURATION"></div></form>
    </td>
  </tr>
</table>
<?


}     //fin du test du mot de passe
else // mauvais mot de passe
{
//retour à la page d'index'
header('location:login.php');
} //fin du test mot de passe

?>
