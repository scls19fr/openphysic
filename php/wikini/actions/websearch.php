<?php

// protection contre un appel direct
if (!defined("WIKINI_VERSION"))
{
	die ("accès direct interdit");
}

// recuperation des parametres
$search = $this->GetParameter("search"); // mot clef
$engine = $this->GetParameter("engine"); // moteur de recherche

if (empty($search)) {
  $search = "wikini"; // parametres par defaut
}

if (empty($engine)) {
  $engine = "google"; // parametres par defaut
}

if ($engine=="google") {
  $strWeb = "http://www.google.fr/search?q=";
  echo '<a href="'.$strWeb.rawurlencode(str_replace(" ","+",$search)).'">'.'Rechercher "'.$search.'" sur Google.fr'.'</a>';
}

?>