<?php
	// http://127.0.0.1/donnees.php
	//  -> http://127.0.0.1/resultat.php

	// Tout ce qui commence par deux slashs est un commentaire

	// Tout ce qui est fait ici est exécuté côté serveur
	// le client ne voit pas les calculs
	// il voit juste la page HTML résultante

	// les données proviennent du formulaire par la méthode POST
	$a = $_POST['a'];
	$b = $_POST['b'];
	
	// on peut aussi envoyer les données par la méthode GET
	// dans ce cas elles passent dans l'adresse URL
	// http://127.0.0.1/resultat.php?a=1&b=2
	// Il faut alors changer dans donnees.php
	//     <form action="resultat.php" method="POST">
	// par <form action="resultat.php" method="GET">
	//$a = $_GET['a'];
	//$b = $_GET['b'];
	
	
	
	// Il faut (par sécurité) toujours filtrer tous les paramètres en entrée
	// d'un script PHP sinon il peut y avoir des failles
	// cf XSS, Injection de SQL, ...
	// http://www.webmaster-hub.com/publication/Securite-et-formulaire-PHP.html
		// htmlentities() permet d'éviter de rentrer du HTML via le formulaire
		// c'est la première sécurité de base
	$a=htmlentities($a);
	$b=htmlentities($b);
		// on n'autorise que les nombres (chiffres et le ".")
	if (!is_numeric($a)) {
		//$a = 0; // mettre une valeur par défaut
		// ou
		header('Location: erreur.php');  // redirige vers une page d'erreur
	}
	if (!is_numeric($b)) {
		//$b = 0; // mettre une valeur par défaut
		// ou
		header('Location: erreur.php');  // redirige vers une page d'erreur
	}
	
	
	// Ici on fait les calculs
	$resultat  = $a + $b;
?>

<html>

<head>
	<title>Calcul - R&eacute;sultat</title>
</head>

<body>

<h1>Calcul</h1>

<h2>Donn&eacute;es</h2>
a: <?php echo $a; ?><br>
b: <?php echo $b; ?>

<h2>R&eacute;sultat</h2>
resultat= <?php echo $resultat; ?>

<br><br>

<a href="donnees.php">Retour</a>

</body>

</html>