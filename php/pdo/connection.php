<?php

define("TEST", "0.0.1");

$params = array (
  'dbadr'=>'localhost',    // adresse de la base de données
  'dbuser'=>'scls',        // nom d'utilisateur de la base de données
  'dbpwd'=>'00000',         // mot de passe de l'utilisateur de la base de données
  'dbname'=>'Votes',       // nom de la base de données
  'tableprefix'=>'Votes_', // prefixe des tables de la base de données
);

$SGDB='mysql:host=';

try
{
        $connexion = new PDO($SGDB.$params['dbadr'].';dbname='.$params['dbname'], $params['dbuser'], $params['dbpwd']);
	echo "Connection Ok";
}
 
catch(Exception $e)
{
        echo 'Erreur : '.$e->getMessage().'<br />';
        echo 'Num : '.$e->getCode();
}

?>
