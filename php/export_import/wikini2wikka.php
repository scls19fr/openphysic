<?php

include_once("translator.php");

class wikini2wikka extends Translator {

  function __construct() {
    $this->add('/={6}[ ]*(.*)[ ]*={6}/','<h1>$1</h1>'); // h1
    //$this->add('/^\b[a-z0-9]+:\/\/[^ \t\n\r\f"\|\\\\\^\`\{\}\[\]><]+$/', 'URL'); // link
    //$this->add('/:\/\//', 'URL'); // link
    //$this->add('/\[{2}([a-z0-9]+:\/\/[^ \t\n\r\f"\|\\\\\^\`\{\}\[\]><]+) (.*)\]{2}/', 'URL=$1 ALT=$2FIN');
    $this->add('/\[{2}([a-z0-9]+:\/\/[^ \t\n\r\f"\|\\\\\^\`\{\}\[\]><]+\.(gif|png|jpg|jpeg)) (.*)\]{2}/', '{{image url="$1" title="$2" alt="$2"}}');
  }

}

?>
