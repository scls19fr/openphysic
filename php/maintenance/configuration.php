<?

session_start();// on démarre une session

//connexion à la base de données
require("connexion.php");

//lecture du mot de passe administrateur
$requete = mysql_query("SELECT code FROM maint_password WHERE nom = 'admin'");
$retour = mysql_fetch_array($requete);
$bonpassword = $retour[code];

//lecture du nombre de jours par défaut
session_unregister("nombrejours"); //on efface la valeur en cours dans la session
$requete = mysql_query("SELECT valeur FROM maint_divers WHERE nom = 'jours'");
$retour = mysql_fetch_array($requete);
$nombrejours = $retour[valeur];
session_register("nombrejours"); //la valeur initiale est reprise

echo "<body bgcolor=#FFDCA8>";

// contrôle du mot de passe
if ($password == $bonpassword)
    {

    // traitements des données reçues pour modifiactions ou enregistrements ds formulaire

     //GESTION DU MOT DE PASSE

     if (($newpass1 <> "") and ($newpass1 == $newpass2)) // nouveau mot de passe égaux
        {
        ?><p><font color="#FF0000"><h1>Le mot de passe a &eacute;t&eacute; chang&eacute; !</h1> </font></a></b></p><?
        $result=mysql_query("UPDATE maint_password SET code = '$newpass1' WHERE nom = 'admin'");
        session_unregister("password");
        $password = $newpass1 ;
        session_register("password");

        }


       // GESTION DES ADMINISTRATEURS

        if ($bouton == "Modifier")  // Modification ou suppréssion d'un administrateur'
              {
              $result=mysql_query("UPDATE maint_admin SET nom = '$nom',email = '$email' WHERE ID = '$id'");
              }

         if ($bouton == "Ajouter") // Enregistrement d'un nouvel administrateur
              {
              $result=mysql_query("INSERT INTO maint_admin (nom,email) VALUES ('$nom','$email')");
              }

         if ($bouton == "Supprimer") // supprimer un administrateur
              {
              $result=mysql_query("DELETE FROM maint_admin WHERE ID = '$id'");
              }

        // CHANGEMENT DU NOMBRE DE JOURS PAR DEFAUT

         if ($bouton == "Changer")  // modification du nombre de jours
              {
              $result=mysql_query("UPDATE maint_divers SET valeur = '$jours' WHERE nom = 'jours'");
              session_unregister("nombrejours"); //on efface la valeur en cours dans la session
              $nombrejours = $jours;
              session_register("nombrejours"); //la nouvelle valeur est mémorisée
              }

        // AFFICHAGE DES FORMULAIRES
        echo "<li><b><u>LISTE DES ADMINISTRATEURS</b></u></li><p></p>";
        $requeteadmin = mysql_query("SELECT * FROM maint_admin");
        while($row = mysql_fetch_array($requeteadmin))
               {
               $lenom = ($row["nom"]);
               $lemail = ($row["email"]);
               $idadmin = ($row["ID"]);
               ?>
               <form method="post" action="<?echo "configuration.php?id=$idadmin"?>">
                     <b>Nom &nbsp; <input type="text" name="nom" value="<?echo "$lenom";?>">
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     Email  &nbsp; <input type="text" name="email" size="50" value="<?echo "$lemail";?>">
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="submit" name="bouton" value="Modifier">
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="submit" name="bouton" value="Supprimer">
               </form>
               <?
               }


               ?>

               <hr>
               <li><b><u>NOUVEL ADMINISTRATEUR</b></u></li><p></p>
               <form method="post" action="configuration.php?id=new">
                     Nom &nbsp; <input type="text" name="nom">
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     Email &nbsp; <input type="text" name="email" size="50">
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="submit" name="bouton" value="Ajouter">
               </form>

               <hr>
               <?
               if ($password == "sambaedu") //mot de passe non changé
                    {
                        ?>
                        <p><font color="#CC0000">Attention, le mot de passe initial, <b>sambaedu, </b>
                        n'a pas &eacute;t&eacute; chang&eacute; ! </font></p>
                        <?
                    }
               ?>
               <li><b><u>CHANGEMENT DU MOT DE PASSE ADMINISTRATEUR</b></u></li><p>&nbsp;&nbsp;&nbsp;Le mot de passe ne doit pas excéder 10 caractères </p>
                <form method="post" action="configuration.php">
                      <p>Nouveau mot de passe &nbsp; &nbsp;&nbsp;&nbsp;
                      <input type="password" name="newpass1" size="10"></p>
                      <p>Saisir une nouvelle fois &nbsp;&nbsp;&nbsp;&nbsp;
                      <input type="password" name="newpass2" size="10">
                      &nbsp;&nbsp;&nbsp;&nbsp;
                      <input type="submit" name="bouton" value="Envoyer"> </p>
                </form>
                <hr>
                <form method="post" action="configuration.php">
                      Nombre de jours affichés par d&eacute;faut dans la page bilan
                      &nbsp;&nbsp;&nbsp;&nbsp;
                      <input type="text" name="jours" size="3" value="<?echo "$nombrejours";?>">
                      &nbsp;&nbsp;&nbsp;&nbsp;
                      <input type="submit" name="bouton" value="Changer">
                </form>
                <hr>
<br>
<table width="100%" border="0">
  <tr>
    <td>
        <form method="post" action="logout.php">
        <input type="submit" name="submit" value="DECONNEXION"></form>
        </td>
    <td>
        <form method="post" action="bilan.php">
        <input type="submit" name="bouton2" value="Afficher page bilan"></form>
        </td>
  </tr>
</table>

                <?


    } //fin du bon mot de passe

        else // mauvais mot de passe
    {

     //retour à la page de login'
     header('location:login.htm');

    } //fin du test mot de passe

?>
