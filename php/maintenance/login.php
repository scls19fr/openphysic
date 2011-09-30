<?

session_start();// on démarre une session

//connexion à la base de données
require("connexion.php");

//lecture du mot de passe administrateur
$requete = mysql_query("SELECT * FROM maint_password WHERE nom = 'admin'");
$retour = mysql_fetch_array($requete);
$bonpassword = $retour[code];


//lecture du nombre de jours par défaut
$requete = mysql_query("SELECT valeur FROM maint_divers WHERE nom = 'jours'");
$retour = mysql_fetch_array($requete);
$nombrejours = $retour[valeur];


if ($password == $bonpassword) // Si le mot de passe est valide
    {

    // On enregistre la variable  password dans la session en cours
    session_register("password");

    // On enregistre la variable nombre de jours pour la session en cours
    $nombrejours = $jours; //jours choisis dans le formulaire
    session_register("nombrejours");

    // redirection vers bilan
    if ($bouton == "CONFIGURATION")
         {
         header('location:configuration.php');// Redirection sur la page configuration qui peut maintenant être affichée
         }
         else
         {
         header('location:bilan.php');// Redirection sur la page bilan qui peut maintenant être affichée
         }

}
else
{
// Si le password n'est pas valide, on affiche le formulaire

?>
<html>
<body bgcolor=#FFDCA8>
<table width="100%" border="0">
  <tr>
    <td colspan="3">
      <div align="center"><img src="samba.gif" width="354" height="38"></div>
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <div align="center">
        <p>&nbsp;</p>
        <p><font color="#9999FF"><b><font color="#666666" size="5">CONTROLE
          D'ACCES A LA GESTION DES INTERVENTIONS</font></b></font></p>
      </div>
    </td>
  </tr>
</table>
<p></p>

<hr>
<form method="post" action="login.php">
  <p>Votre mot de passe :

     &nbsp;&nbsp;&nbsp;
    <input type="password" name="password" size="10">
     &nbsp;&nbsp;&nbsp;
     <i>( Le mot de passe n' est pas forc&eacute;ment celui de l'administrateur Samba Edu ) </i>
  </p>
  <p> Nombre de jours affich&eacute;s en historique
&nbsp;&nbsp;&nbsp;
    <input type="text" name="jours" size="5" value="<?echo "$nombrejours";?>">
  </p>
  <blockquote>
    <blockquote>
      <blockquote>
        <blockquote>
          <blockquote>
                <p>
                    <input type="submit" name="bouton2" value="AFFICHER PAGE BILAN">
                     &nbsp;&nbsp;&nbsp;
                    <input type="submit" name="bouton" value="CONFIGURATION">
                  </p>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </blockquote>
</form>


<p></p>

<hr>

<form method="post" action="index.php">
     <input type="submit" name="bouton" value="Retour au formulaire d'accueil">
</form>

</html>

<?

               if ($bonpassword == "sambaedu") //mot de passe non changé
                    {
                        ?>
                        <p><font color="#CC0000">Attention, le mot de passe initial, <b>sambaedu, </b>
                        n'a pas &eacute;t&eacute; chang&eacute; ! </font></p>
                        <?
                    }
               ?>

<?
} // fin du test du mot de passe

?>

