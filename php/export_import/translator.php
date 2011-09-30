<?php

// Wiki translator using PCRE
// (also called Formatters)

class Translator {
  public $patterns;
  public $replacements;
  //public $i;

  function __construct() {
    $this->i = 0;
    $this->patterns = array();
    $this->replacements = array();
    //echo "construct";
  }

  function add($pattern, $replacement) {
    $this->patterns[] = $pattern;
    $this->replacements[] = $replacement;
    //$this->i = $this->i + 1;
    //echo $this->patterns[i];
    //echo $this->i;
  }

  function execute($string_from) {
    ksort($this->patterns);
    ksort($this->replacements);
    // http://fr.php.net/manual/fr/function.preg-replace.php
    return preg_replace($this->patterns, $this->replacements, $string_from);
  }

/*
  function show() {
    print_r($this->patterns);
    print_r($this->replacements);
    echo "i=$i";
  }
*/

}

?>
