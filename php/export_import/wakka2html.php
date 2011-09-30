<?php

include_once("translator.php");

class wakka2html extends Translator {

  function __construct() {
    //$this->add('#http://www.site.net/wiki[/]?\B#','http://www.site.net/wikini/wakka.php?wiki=PagePrincipale'); // URL Rewriting
    $this->add('#http://www.site.net/wiki/(.+)#','http://www.site.net/wikini/wakka.php?wiki=$1'); // URL Rewriting
    $this->add('/={6}[ ]*(.*)[ ]*={6}/','<h1>$1</h1>'); // h1
    $this->add('/={5}[ ]*(.*)[ ]*={5}/','<h2>$1</h2>'); // h2
    $this->add('#={4}[ ]*(.*)[ ]*={4}#','<h3>$1</h3>'); // h3
    $this->add('#={3}[ ]*(.*)[ ]*={3}#','<h4>$1</h4>'); // h4
    $this->add('#={2}[ ]*(.*)[ ]*={2}#','<h5>$1</h5>'); // h5
    $this->add('#{{redirect page="(.*)"}}#',"[[REDIRECT->$1]]"); // redirect
    $this->add('#[*]{2}(.*)[*]{2}#','<b>$1</b>'); // bold
    $this->add('#[/]{2}(.*)[/]{2}#','<i>$1</i>'); // italic
    $this->add('#[_]{2}(.*)[_]{2}#','<u>$1</u>'); // underline
    $this->add('#[@]{2}(.*)[@]{2}#','<span class="del">$1</span>'); // barré
    $this->add('#[\#]{2}(.*)[\#]{2}#','<tt>$1</tt>'); // texte à espacement fixe
    $this->add('#[\%]{2}\((.*)\)(.*)[\%]{2}#','<li>Code $1 : $2</li>'); // code dont le langage est connu
    $this->add('#[\%]{2}(.*)[\%]{2}#','<li>$1</li>'); // code inconnu
    // Lien interne non nommé
    // Image
    // Lien interne nommé
    // Lien externe nommé
    // Lien externe non-nommé
    // Lien externe non-nommé mais avec [[ ]]
    $this->add('#[\$]{2}(.*)[\$]{2}#','<math style="displaystyle">$1</math>'); // Math (displaystyle)
    $this->add('#[\$]{1}(.*)[\$]{1}#','<math>$1</math>'); // Math (inline)
    $this->add('#(\w+)@([a-zA-Z_]+?)\.([a-zA-Z]{2,4})#','mail=$1@$2.$3'); // E-mail
  }

}

?>
