<?php

// protection contre un appel direct
if (!defined("WIKINI_VERSION"))
{
	die ("accès direct interdit");
}

/*
Crée un lien apt://xxx,yyy,zzz pour installer des paquets sur Debian / Ubuntu
Usage : {{apt-get install="emacs gcc x11"}}
*/

// recuperation des parametres
$install = $this->GetParameter("install"); // liste des paquets à installer

if (empty($install)) {
  //echo "nothing to install";
} else {
  $packages=explode(" ", $install); // explode or split
  $str1=""; // packages séparés par " "
  $str2=""; // packages séparés par ","

  foreach($packages as $i=>$package) {
    if ($i<>0) {
      $str1.=" ";
      $str2.=",";
    }
    $str1.=$package;
    $str2.=$package;
  }
  //$str="emacs";
//<a href="apt://emacs,gcc">apt://emacs,gcc</a>
  echo "<tt><a href=\"apt://$str2\">apt-get install $str1</a></tt>";
}

?>
