<html>
<style type="text/css">
<!--
body {
        font-family: Verdana, ;
        font-size: 12px;
        line-height: 24px;
        text-transform: none;
        color: #000000;
 }
table {
         border-left:2px ridge #336699;
         border-top:2px ridge #336699;
         border-right:solid #eeeeee;
         border-bottom:solid #eeeeee;
        font-family: Verdana, ;
        font-size: 12px;
        font-style: normal;
        line-height: 24px;
        font-variant: normal;
        text-transform: none;
        color: #000000;
    list-style-position: outside;
        list-style-type: squate;
 }
.tablenul {
         border:0
 }
.titreParag {
        font-family: Verdana, ;
        font-size: 16px;
        font-style: oblique;
        line-height: 32px;
        font-variant: small-caps;
        text-transform: none;
        color: #000000;
    list-style-position: inside;
        list-style-type: decimal;
; font-weight: bold ; text-decoration: underline blink}
td{color:#000000;font-size:14px}
.titre {
        font-family: Verdana, ;
        font-size: 24px;
        font-style: normal;
        line-height: 30px;
        font-variant: small-caps;
        text-transform: none;
        color: #000000;
    list-style-position: outside;
        list-style-type: squate;
; font-weight: bolder; text-decoration: underline blink}
-->
</style>

<body bgcolor=#FFDCA8> <align="center" >
<div align="center">
<?

//connexion à la base de données
require("connexion.php");

//elimination des erreur d'envoi de mél
error_reporting (0);

$daterequete=(date("Y-m-d"));;

// On commence par vérifier si les champs importants sont completés
$nom = $_REQUEST['nom'];
$texte = $_REQUEST['texte'];
if(empty($nom)  OR empty($texte))
     {


                echo "<p></p>
                <p></p>
                <table width=50% border=0 align=center bgcolor=#A1B2C5>
                <tr><td align=center>
                <p>&nbsp;</p><font color=#000000><b>ATTENTION !</b><br> Vous devez compléter obligatoirement les champs<br><b>'Nom et prénom'</b> et<b> 'Description du Problème'</b> !</font>
                <p>&nbsp;</p>
                </td></tr>
                </table>
                <br>
                <form method='post' action='index.php'>
                <input type='submit' name='submit' value='RETOUR'></form>";

    }
//si tous les champs obligatoires sont remplis
else {
// on affiche la demande
          echo "<p></p>
          <p></p>
          <table width=50% border=0 align=center bgcolor=#A1B2C5>
          <tr><td align=center>
                <p>Merci <b>",($nom),"</b></p>
                <p>Nous sommes le <b>$daterequete</b></p>
                <p>Vous avez signalé le problème suivant :<br><b>".stripslashes($texte)."</b></p>
                <p></p>
          </td></tr></table><br>
                <form method='post' action='index.php'>
                <input type='submit' name='submit' value='RETOUR'></form> ";


?>

                <?

                //on envoie les informations dans la table MySQL
                $ladate=strtotime (date("Y-m-d H:i:s"));

                //enregistrement de la demande
                $result=mysql_query("INSERT INTO maint_travaux (nom,email,salle,poste,probleme,datedebut2) VALUES ('$nom','$email','$salle','$poste','$texte','$ladate')");




                //et on envoie le mail aux administrateurs enregistrés
                 $requeteadmin = mysql_query("SELECT * FROM maint_admin");
                  while($row = mysql_fetch_array($requeteadmin))
                         {
                         $emailadmin = ($row["email"]);
                         mail($emailadmin,"probleme info",
                              "$nom $email a demandé une intervention de maintenance\n
                              Salle: $salle\n Poste : $poste \n\nDescription:\n".stripslashes($texte). "\n");
                         }

}  //end if(empty($nom)  OR empty($texte))
//fermeture de la base de données
mysql_close();
 ?>
</div>
</body>
</html>
