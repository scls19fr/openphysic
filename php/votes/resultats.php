<?php //session_start(); ?> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd"> 
<html>

<head>
  <title>R&eacute;sultats du vote</title>
  <link rel="stylesheet" type="text/css" href="style.css" />

  <meta http-equiv="refresh" content="2">

</head>

<body>

<h1>R&eacute;sultats du vote</h1>

<center>
<?php
require_once('vote.php');

//print_r($_SESSION);

if (!isset($_SESSION['votes'])) {
  //echo 'La variable de session "votes" n\'existe pas';
  require_once('config.php');
  //exit();
}
if (isset($_SESSION['votes'])) {
  //echo 'La variable "votes" existe et vaut: ' . $_SESSION['votes']; 
  $votes=unserialize($_SESSION['votes']);
}


if (!empty($_POST)) {
  if (isset($_POST['nouveau'])) {
    echo "nouveau vote";
    $votes->nouveau();
    //$_SESSION['votes'] = serialize($votes);
    $GLOBALS['votes'] = serialize($votes);

    //exit;
  }
  if (isset($_POST['reset'])) {
    echo "reset";
    unset($_SESSION['votes']);
    session_unset();
    session_destroy();
    //exit;
  }
}



$votes->afficher_resultats();


//date_default_timezone_set('UTC');
//echo date('l jS \of F Y h:i:s A');







?>

<br/>

<form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post">
<input type="submit" name="nouveau" value="Nouveau vote" />
</form> 

<form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post">
<input type="submit" name="reset" value="Reset" />
</form> 


</center>

</body>

</html>
