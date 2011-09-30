<?php
/* Login */
//session_start();// on démarre une session

//connexion à la base de données
require_once('config.php');
require_once("connect.php");
require_once("utilisateur.php");

$user = new utilisateur();

/* Utilisateur existant - mot de passe Ok */
//$user->login='scelles';
//$user->password='0000';

/* Utilisateur existant - mauvais mot de passe */
//$user->login='scelles';
//$user->password='err';

/* Utilisateur inexistant dans la base */
//$user->login='inconnu';
//$user->password='inconnu';

/* Utilisateur existant - mot de passe Ok */
//$user->login='pnom';
//$user->password='1234';

/* Administrateur - mot de passe Ok */
$user->login='admin';
$user->password='7777';

$password_tape = hash($params['hash'],$user->password);

// hash('md5','0000') = 4a7d1ed414474e4033ac29ccb8653d9b
// hash('md5','1234') = 81dc9bdb52d04dc20036dbd8313ed055
// hash('md5','7777') = d79c8788088c2193f0244d8f1f36d2db

//echo "password=$password";

//lecture du mot de passe dans la base
//$query = "SELECT * FROM login WHERE login='$user->login'";
//$query = mysql_query($query) or die(htmlentities('Requête échouée : ') . mysql_error());;
//echo $query;
$results=$connexion->query("SELECT * FROM login WHERE login='$user->login'");
$results->setFetchMode(PDO::FETCH_OBJ);
//while( $ligne = $results->fetch() ) // on récupère la liste des membres
//{
        //echo "Utilisateur : $ligne->login $ligne->password <br />"; // on affiche les membres
//}
$ligne = $results->fetch();
$results->closeCursor(); // on ferme le curseur des résultats
$bon_password = $ligne->password;

/*
unset($result);
$result = mysql_fetch_array($query);
if (sizeof($result)>1) {
  $user->update_from_db($result);
} else {
}
$bon_password = $result['password'];
*/

//echo "bon_password=$bon_password";


if ($password_tape == $bon_password) // Si le mot de passe est valide
{
  //echo "Bon password";
  //echo htmlentities("Bienvenue {$user->prenom} {$user->nom} ({$user->login})")." - ";

  if ($ligne->is_admin) {
    require_once('admin.php');
  } else {
    require_once('avis.php');
    //echo "<center>
//<input type=\"button\" name=\"voter\" value=\"Voter\" onclick=\"self.location.href='avis.php'\" onclick> 
//</center>
//";

  }
} else {
  //echo "Mauvais mot de passe pour \"$user->login\" ou utilisateur inconnu";
  
  // compter le nb d'utilisateurs (0 ou 1) ayant ce login
  //if (sizeof($results)>1) {
  if ($ligne!=null) {
    echo htmlentities("Mauvais mot de passe pour \"$user->login\"");
  } else {
    echo htmlentities("Utilisateur \"$user->login\" inconnu");
  }
}

echo "<center>
<input type=\"button\" name=\"logout\" value=\"D&eacute;connexion\" onclick=\"self.location.href='logout.php'\" onclick> 
</center>
";
//<input type=\"button\" name=\"retour\" value=\"Retour\" onclick=\"self.location.href='login.php'\" onclick> 

// Printing results in HTML
/*
echo "<table>\n";
while ($line = mysql_fetch_array($query, MYSQL_ASSOC)) {
    echo "\t<tr>\n";
    foreach ($line as $col_value) {
        echo "\t\t<td>$col_value</td>\n";
    }
    echo "\t</tr>\n";
}
echo "</table>\n";
*/

// Free resultset
//mysql_free_result($query); // $result

// Closing connection
//mysql_close($db);
//$connexion->close();
$connexion=null;

?>
