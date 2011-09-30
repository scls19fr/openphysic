<?php //session_start(); 
//if (!defined('VOTES_VERSION'))
//{
//	die ("acc&egrave;s direct interdit");
//}
?> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd"> 
<html>

<head>
<title>Avis envoy&eacute;</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>

<body>

<h1>Votre avis a &eacute;t&eacute; envoy&eacute;</h1>

<center>

<?php	

require_once('vote.php');
//require('vote.php');
//include('vote.php');

//global $votes;
//global $ser_votes;

/*
if (isset($_SESSION['votes'])) {
  //echo 'La variable "votes" existe et vaut: ' . $_SESSION['votes'];
  $votes=unserialize($_SESSION['votes']);
} else {
  echo 'La variable de session "votes" n\'existe pas';
}
*/

echo $GLOBALS['votes'];
$votes = unserialize($GLOBALS['votes']);


if (!empty($_POST)) {
  for ($i=0 ; $i<6 ; $i++) {
    if (isset($_POST['bouton'."$i"])) {
        echo "Le bouton enfonc&eacute; est le bouton $i"."\r\n";
	$avis = $i;
	break;
    }
  }
}

echo "<br/>"."\r\n";

//$votes = new Vote();

$IP=$_SERVER['REMOTE_ADDR'];
echo "Vous ($IP) avez envoy&eacute; l'avis "."<strong>".htmlentities($votes->choix[$avis])." (".$avis.")"."</strong>";

$votes->voter($avis);
/*
  $votes->voter(0);
  $votes->voter(1);
  $votes->voter(2);
  $votes->voter(3);
  $votes->voter(3);  $votes->voter(3);  $votes->voter(3);  $votes->voter(3);
  $votes->voter(3);
  $votes->voter(4);
*/

  //$votes->afficher_resultats();
  //global $ser_votes;
  //$ser_votes = serialize($votes); 

  //$_SESSION['votes'] = serialize($votes);
  $GLOBALS['votes'] = serialize($votes);


?>


</center>

<br/>

<center>
<input type="button" name="retour" value="Retour" onclick="self.location.href='avis.php'" onclick> 
</center>


</body>

</html>
