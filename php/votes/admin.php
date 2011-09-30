<?php

if (!defined('VOTES_VERSION'))
{
	die ("acc&egrave;s direct interdit");
}

$results=$connexion->query("SELECT * FROM login");
$results->setFetchMode(PDO::FETCH_OBJ);
echo "<center>\n";

echo "<table border>\n";
$i=0;
while( $ligne = $results->fetch() ) { // on récupère la liste des membres
  echo "<tr><td>$i</td><td>$ligne->login</td><td>$ligne->nom</td><td>$ligne->prenom</td></tr>\n";
  $i++;
}
$results->closeCursor(); // on ferme le curseur des résultats

echo "</table>\n";

echo "</center>\n";

?>
