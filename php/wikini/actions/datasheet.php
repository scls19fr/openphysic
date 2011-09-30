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
  $search = "dac800"; // parametres par defaut
}

if (empty($engine)) {
  $engine = "google"; // parametres par defaut
}

if ($engine=="google") {
  $strWeb = "http://www.google.com/search?q=datasheet+";
  echo '<a href="'.$strWeb.rawurlencode(str_replace(" ","+",$search)).'">'.'Rechercher datasheet "'.$search.'" sur Google.com'.'</a>';
}

?>
