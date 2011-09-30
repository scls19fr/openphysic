<?
session_start();// on démarre la session

// on supprime la variable de session
session_unregister("password");
session_unregister("jours");

session_unset(); // on efface toutes les variables de session (inutile ici)
session_destroy(); // on detruit la session en cours.

// On renvoi sur la page login
header('location:login.php') ;
?>