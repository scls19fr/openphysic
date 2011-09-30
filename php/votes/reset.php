<?php
//print "Variables globales".$GLOBALS;

if (isset($_SESSION['votes'])) {
  echo 'La variable "votes" existe et vaut: ' . $_SESSION['votes']; 
  $votes=unserialize($_SESSION['votes']);
} else {
  echo 'La variable de session "votes" n\'existe pas';
}

  unset($_SESSION['votes']);
  session_unset();
  session_destroy();
?>
