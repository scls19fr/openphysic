<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Restriction de l'acc&egrave;s Internet</title>
  </head>

  <body>

    <center>

      <h1>Restriction de l'acc&egrave;s Internet</h1>

      <hr>

      <p>
	Par d&eacute;faut, dans certaines salles (voir liste ci-dessous), la connexion Internet sur les postes
	&eacute;l&egrave;ves est d&eacute;sactiv&eacute;e.
      </p>

      <p>
	Cette page permet de l'activer pour une dur&eacute;e
	donn&eacute;e (en minutes). A l'issue de ce temps, la connexion Internet sera
	automatiquement d&eacute;sactiv&eacute;e sur les postes &eacute;l&egrave;ves.
      </p>


      <hr>



      <h2>Salle 31 (Physique)</h2>
      <form method="post" action="index.php"> 
	<input type="hidden" name="room" value="31">

	<table border="0" cellpadding="10">
	    <tr align="center">
	      <td align="center">
		<input type="submit" name="start" value="Lancer la connexion">
		</td>
	      <td align="center">
		<input type="text" name="duree" size="4" value="60">
	      </td>
	      <td width="20%"></td>
	      <td align="center">
		<input type="submit" name="stop" value="Stopper la connexion">
	      </td>
	    </tr>
	</table>
      </form>

      <hr>

      <h2>Salle 32 (Physique)</h2>
      <form method="post" action="index.php"> 
	<input type="hidden" name="room" value="32">

	<table border="0" cellpadding="10">
	    <tr align="center">
	      <td align="center">
		<input type="submit" name="start" value="Lancer la connexion">
		</td>
	      <td align="center">
		<input type="text" name="duree" size="4" value="60">
	      </td>
	      <td width="20%"></td>
	      <td align="center">
		<input type="submit" name="stop" value="Stopper la connexion">
	      </td>
	    </tr>
	</table>
      </form>

      <hr>

      <h2>Salle 32 Bis (Physique)</h2>
      <form method="post" action="index.php"> 
	<input type="hidden" name="room" value="32bis">

	<table border="0" cellpadding="10">
	    <tr align="center">
	      <td align="center">
		<input type="submit" name="start" value="Lancer la connexion">
		</td>
	      <td align="center">
		<input type="text" name="duree" size="4" value="60">
	      </td>
	      <td width="20%"></td>
	      <td align="center">
		<input type="submit" name="stop" value="Stopper la connexion">
	      </td>
	    </tr>
	</table>
      </form>


      
    </center>


<hr>

<?php
	/*
foreach ($_POST as $key => $value)
        echo "post: ".$key."=".$value."<br>";

foreach ($_GET  as $key => $value)
        echo "get: ".$key."=".$value."<br>";
	*/
?>


<?php
$room = $_POST["room"];
$duree = $_POST["duree"];

if ( $_POST["start"] <> "" ) {
    $action = "start";
}

if ( $_POST["stop"] <> "" ) {
    $action = "stop";
    $duree = "";
}


if ( $action <> "" ) {
    $script = "./internet_rules.sh $action $room $duree";
   echo "<pre>$script</pre>";
    exec($script);
}
?>




    <hr>
    <address><a href="mailto:s.cls@laposte.net">S. CELLES</a></address>
    <!-- Created: Wed Apr 19 18:31:51 CEST 2006 -->
    <!-- hhmts start -->
Last modified: Wed Apr 19 21:46:13 CEST 2006
<!-- hhmts end -->
  </body>
</html>
