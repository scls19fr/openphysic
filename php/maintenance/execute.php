<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
<head>
<title>Demande de maintenance informatique</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="robots" content="noindex,nofollow" />
<style type="text/css">
	body {
		margin: 1cm;
		padding: 0;
		font: .8em arial, hevetica, sans-serif;
		text-align: left;
		color: black;
		background: white;
		background-image: url(fond.png);
    	background-attachment: fixed;
	    background-repeat: no-repeat;
	    background-position: center center;
	}
	p#notes {
		border-bottom: 1px dotted black;
		padding-bottom: 1em;
	}
	p#footer {
		border-top: 1px dotted black;
		padding-top: 1em;
	}
	
	p#header {
	border-bottom: 1px dotted black;
	padding-bottom: 1em;
	font-family: Arial, Helvetica, sans-serif;
	font-size: medium;
	font-weight: bold;
	letter-spacing: 1.1em;
	}
	
	code {
		font-size: 1.3em;
	}
	.label, table tfoot td {
		text-align: right;
	}
	table#attente tbody td fieldset {
		padding: .1em;
		border: none;
		font-size: .9em;
	}
	table#attente thead td {
	font: bold 1em arial, hevetica, sans-serif;
	color: white;
	background: #9999FF;
	padding: 0.2em;
	border-top: thin dotted #000000;
	}
	
	table#attente tfoot td {
	font: bold 1em arial, hevetica, sans-serif;
	color: white;
	background: #9999FF;
	padding: 0.2em;
	border-bottom: thin dotted #000000;
	}
	
	table#attente tbody td fieldset {
		margin-bottom: 1em;
	}
	legend {
		font: bold 1.1em arial, hevetica, sans-serif;
		color: black;
	}
	
	table#attente tbody td {
		border: 1px solid black;
		background : #CCCCFF;
		padding: 1em;
	}
	label.oblig {
		font-weight: bold;
	}
	.legende {
		font-style: italic;
		color: #666;
	}
	a.aide {
		text-decoration: none;
		position: relative;
		top: -3px;
		margin-left: .5em;
		padding: 0 .2em;
		border: 1px solid black;
		color: black;
		background: beige;
		font: bold 1em arial, helvetica, sans-serif;
		width: .1em;
	}
	html>body a.aide {
		top: -5px;
		width: auto;
	}
	a.aide:hover {
		cursor: help;
	}
	.focus {
		background: beige;
		border 1px solid #7f9db9;
	}
	.normal {
		background: white;
		border 1px solid #7f9db9;
	}
</style>
</head>

<?
require("connexion.php");
$ladate=strtotime (date("Y-m-d H:i:s"));

// affichage des formulaires de la requête
function affiche_form($requete)
       {
            while($row = mysql_fetch_array($requete))
            {
            $id=($row["id"]);
            $nom=($row["nom"]);
            $email=($row["email"]);
            $salle=($row["salle"]);
            $poste=($row["poste"]);
            $probleme=($row["probleme"]);
            $datedebut=$row["datedebut2"];
                       //list($annee1,$mois1,$jour1,$heure1,$minute1,$seconde1) = split('[- :]',$datedebut);
            $intervention=($row["intervention"]);
            $intervenant=($row["intervenant"]);
            $datefin=$row["datefin2"];
                     //list($annee2,$mois2,$jour2,$heure2,$minute2,$seconde2) = split('[- :]',$datefin);
            $duree=($row["duree"]); ?>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%" id="attente">
			<thead>
				<tr>
					<td>
					<?
					if ($datedebut <> 0) {echo "Le ",strftime("%d - %m - %Y à %H h %M mn",$datedebut);}
					if ($salle <> "") {echo ", Salle : $salle";}
                    if ($poste <> "") {echo ", Poste : $poste";}
                    
                    //présence d'info sur la ligne pour l'afficher ou pas'
                    $ligne = false;
                    if ($nom <> "")
                        {
                        echo ", Demande de <b>$nom</b> ";
                        }

                    if ($email <> "")
                        {
                        echo " <i> ( $email ) </i>";
                        }
					$date = strftime("%d - %m - %Y à %H h %M mn",$datefin);
					echo "<br> => Résolu par $intervenant, le $date (durée: $duree)";
						?>
					</td>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td><form action="index.php" method="post"><input type="submit" value="Retour à la page d'accueil" title="Retournez à la page d'accueil" name="submit4"></form></td>
				</tr>
			</tfoot>
			<tbody>
				<tr>
					<td>
            <?
            if ($probleme <> "")
                       {echo "La demande d'intervention était :<br><br><b>".nl2br($probleme)."</b><br>";}
					   ?>
			      </td>
			  </tr>
			  <tr>
					<td>
            <?
            if ($intervention <> "")
                       {echo "La réponse est :<br><br><b>".nl2br($intervention)."</b><br>";}
					   ?>
			      </td>
			  </tr>
  </tbody>
</table>
					  <br>
					  <?
}
}
?>

<body>
	<p align="center" id="header">
		Dernières demandes d'interventions effectuées
	</p>
<?
//affichage des interventions à faire
       //$requete = mysql_query("SELECT * FROM maint_travaux WHERE (intervention = '') ORDER BY id DESC ");
	   $requete = mysql_query("SELECT * FROM maint_travaux  WHERE (intervention <> '') ORDER BY id DESC  ");
	   $nb_result = mysql_numrows($requete);
	   if ($nb_result == 0) echo "<table align=\"center\"><tr><td>Aucune demande en attente !!!</td></tr><tr><td><form action=\"index.php\" method=\"post\"><input type=\"button\" name=\"Submit2\" value=\"Retour à la page d'accueil\" onClick=\"parent.location='index.php'\"></form></td></tr></table>";
       else affiche_form($requete);//fonction ci dessus
?>
	<p align="center" id="footer">
		Maintenance du réseau informatique - Lycée DAUTRY
	</p>
</body>
</html>
