<?php //session_start();
//header('Content-type: text/html; charset=UTF-8');
if (!defined('VOTES_VERSION'))
{
	die ("acc&egrave;s direct interdit");
}
?> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd"> 
<html>
<head>
<title>Avis</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>

<body>

<h1>Avis</h1>

<?php
  require_once('config.php');
  require_once('vote.php');

/*
if (isset($_SESSION['votes'])) {
  echo 'La variable "votes" existe et vaut: ' . $_SESSION['votes']; 
  $votes=unserialize($_SESSION['votes']);
} else {
  echo 'La variable de session "votes" n\'existe pas';
}
*/

  //echo $GLOBALS['votes'];
  $votes = unserialize($GLOBALS['votes']);


  print '<center>'."\r\n";
  print '<p>';
  $user->welcome();
  print '</p>'."\r\n";
 
  echo '<br/>';

  print '<form method="post" action="envoyer_avis.php" name="avis">'."\r\n";

  for ($i=0 ; $i<$votes->nb_choix ; $i++) {
    print "<input type=\"submit\" name=\"bouton$i\" value=\"".htmlentities($votes->choix[$i])."\" />"."&nbsp;"."\r\n";
  }
  print '</form>'."\r\n";
  print '</center>'."\r\n";


/*
  $votes->voter(0);
  $votes->voter(1);
  $votes->voter(2);
  $votes->voter(3);
  $votes->voter(3);  $votes->voter(3);  $votes->voter(3);  $votes->voter(3);
  $votes->voter(3);
  $votes->voter(4);

  $votes->afficher_resultats();
*/

?>

   
</body>
   
</html>
