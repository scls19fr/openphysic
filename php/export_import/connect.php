<?php

include_once("exception.php");

function connect($params) {
	if ($params['dbtype']=='mysql') {
		$SGDB='mysql:host=';
	//elseif () {
	//}
	} else {
		throw new MyException ('Type de SGDB invalide');
		//die;
	}

	try
	{
        	$connexion = new PDO($SGDB.$params['dbadr'].';dbname='.$params['dbname'], $params['dbuser'], $params['dbpwd']);
		//echo "Connection Ok";
		return $connexion;
	}
	catch(MyException $e)
	{
		throw new MyException ('Impossible de se connecter à la base');
		//die;
		
		//echo $e->getError();
		/*
        	echo 'Erreur : '.$e->getMessage().'<br />';
       		echo 'N° : '.$e->getCode();
		die;
		*/
	}
}
?>
