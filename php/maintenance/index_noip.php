<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
<head>
<title>Demande de maintenance informatique</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="robots" content="noindex,nofollow" />
<style type="text/css">
	body {
		margin: 1em;
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
	code {
		font-size: 1.3em;
	}
	.label, table#inscriptionForm tfoot td {
		text-align: right;
	}
	table#inscriptionForm tbody td fieldset table#coordonnees td, table#inscriptionForm tbody td fieldset table#localisation td, table#inscriptionForm tbody td fieldset table#description td {
		padding: .1em;
		border: none;
		font-size: .9em;
	}
	table#inscriptionForm thead td, table#inscriptionForm tfoot td {
		font: bold 1em arial, hevetica, sans-serif;
		color: white;
		background: #9999FF;
		padding: .5em;
	}
	table#inscriptionForm tbody td fieldset {
		margin-bottom: 1em;
	}
	legend {
		font: bold 1.1em arial, hevetica, sans-serif;
		color: black;
	}
	table#inscriptionForm input[type="submit"] {
		font: bold 1em arial, hevetica, sans-serif;
	}
	table#inscriptionForm tbody td {
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
<body onload="document.getElementById('nom').focus()">
	<form id="inscription" method="post" action="envoi.php">
		<table border="0" align="center" cellpadding="0" cellspacing="0" id="inscriptionForm">
			<thead>
				<tr>
					<td>Demande d'intervention sur le r&eacute;seau p&eacute;dagogique</td>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td><input type="submit" name="submit" id="submit" value="Valider votre demande" tabindex="8" title="Cliquez sur ce bouton pour valider votre demande" /></td>
				</tr>
			</tfoot>
			<tbody>
				<tr>
					<td>
						<fieldset>
							<legend>Vos coordonnées</legend>
							<table id="coordonnees" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td class="label"><label for="nom" title="Veuillez saisir votre nom et votre prénom" class="oblig">* Nom :</label></td>
									<td>
										<input name="nom" type="text" id="nom" size="50" title="Veuillez saisir votre nom et votre prénom" tabindex="1" onfocus="this.className='focus';" onblur="this.className='normal';" />
									</td>
								</tr>
								<tr>
									<td class="label"><label for="mail" title="Veuillez saisir votre adresse email" class="oblig">Mail :</label></td>
									<td><input name="mail" type="text" id="mail" size="50" title="Veuillez saisir votre adresse email" tabindex="2" onfocus="this.className='focus';" onblur="this.className='normal';" /></td>
								</tr>
							</table>
						</fieldset>
						<fieldset>
							<legend>Localisation</legend>
							<table id="localisation" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td class="label"><label for="salle" title="Veuillez saisir le numéro de la salle" class="oblig">Salle :</label></td>
									<td><input name="salle" type="text" id="salle" size="10" title="Veuillez saisir le numéro de la salle" tabindex="3" onfocus="this.className='focus';" onblur="this.className='normal';" /></td>
								</tr>
								<tr>
									<td class="label"><label for="ordinateur" title="Veuillez saisir le nom de l'ordinateur" class="oblig">Ordinateur :</label></td>
									<td><input name="poste" type="text" id="ordinateur" size="10" title="Veuillez saisir le nom de l'ordinateur" tabindex="4" onfocus="this.className='focus';" onblur="this.className='normal';" /></td>
								</tr>
							</table>
						</fieldset>
						<fieldset>
							<legend>*Description du problème</legend>
							<table id="description" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td colspan="2"><textarea name="texte" id="description" rows="4" cols="45" title="Veuillez décrire votre problème" tabindex="5" onfocus="this.className='focus';" onblur="this.className='normal';" /></textarea></td>
								</tr>
							</table>
						</fieldset>
						<span class="legende">* Champs obligatoires</span>
					</td>
				</tr>
			</tbody>
	  </table>
	</form>
	<p align="center" id="footer">
<table align="center">
  <tr>
		<td><form action="login.php" method="post"><input type="submit" value="Accès Administrateur" title="Accédez à la page d'administration" name="submit4"></form></td>
		<td><form action="attente.php" method="post"><input type="submit" value="Demandes en attente" title="Visualisez les demandes d'interventions en attente" name="submit5"></form></td>
		<td><form action="execute.php" method="post"><input type="submit" value="Dernières demandes exécutées" title="Vérifiez si votre demande a été effectuée" name="submit5"></form></td>
  </tr>
</table>
	</p>
	<p align="center" id="footer">
		Maintenance du réseau informatique - Lycée DAUTRY - <a href="http://www.celles.net/wikini/wakka.php?wiki=Contact">S&eacute;bastien CELLES</a>
	</p>
</body>
</html>
