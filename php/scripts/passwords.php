<?php

$password="***";


$CFG->crypt = ""; // "" "md5" "sha1"

/*
// Comparaison de chaine
function encode ($password, $crypt) {
  if ($crypt=="" or $crypt==false or $crypt=="none") {
    return $password;
  } elseif ($crypt=="md5") {
    return md5($password);
  } elseif ($crypt=="sha1") {
    return sha1($password);
  } else {
    throw new Exception('Encryptage inconnu');
  }
}
*/

// "Pointeur" de fonction
function encode ($password, $crypt) {
  if (function_exists($crypt)) {
    return $crypt($password);
  } else {
    if ($crypt=="" or $crypt==false or $crypt=="none") {
      return $password;
    } else {
      throw new Exception('Encryptage inconnu');      
    }
  }
}


$new_password=encode($password, $CFG->crypt);

echo $new_password;
?>