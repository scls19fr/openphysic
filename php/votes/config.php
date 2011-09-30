<?php

define("VOTES_VERSION", "0.0.1");

$params = array (
  'dbtype'=>'mysql',       // type de base de données (mysql, posgresql, sqlite...) et
  'dbadr'=>'localhost',    // adresse de la base de données
  'dbuser'=>'scls',        // nom d'utilisateur de la base de données
  'dbpwd'=>'0000',         // mot de passe de l'utilisateur de la base de données
  'dbname'=>'Votes',       // nom de la base de données
  'tableprefix'=>'Votes_', // prefixe des tables de la base de données
  'hash'=>'md5',           // algo de hachage pour le mot de passe
);

//echo $params['dbadr'];

require_once('vote.php');
//global $votes;
//$votes=new Vote();
//$_SESSION['votes'] = serialize(new Vote());
$GLOBALS['votes'] = serialize(new Vote());

?>
