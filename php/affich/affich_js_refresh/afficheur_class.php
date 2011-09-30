<?php

/*
Affiche différentes pages présentes dans l'array $liste
Usage : http://127.0.0.1/php/affich/index.php?page=0
 */

class pages { 
  private $i;

  private $liste;

  private $default_timeout;

  public function __construct($liste) {
    $this->i=0;
    $this->liste=$liste;
    $this->default_timeout=4000;
  }

  public function __destruct() {
    //echo "DESTRUCT";
  }

/*
  private function set_pages($liste) {
    $this->liste=$liste;
  }
*/

  private function set_i($i) {
    if ($i<=count($this->liste)-1) {
      $this->i=$i;
    } else {
      $this->i=0;
    }
  }

  private function get_next_i() {
    if ($this->i==count($this->liste)-1) {
      return 0;
    } else {
      return ($this->i+1);
    }
  }

  private function get_previous_i() {
    if ($this->i==0) {
      return count($this->liste)-1;
    } else {
      return ($this->i-1);
    }    
  }

/*
  public function goto_next_page() {
    $this->i=$this->get_next_i();
    $this->show();
  }

  public function goto_previous_page() {
    $this->i=$this->get_previous_i();
    $this->show();    
  }
*/

  public function set_timeout($t) {
    $this->default_timeout=$t;
  }

  private function get_timeout() {
    return $this->default_timeout;
  }

  private function show() {

    $url_next= "{$_SERVER['PHP_SELF']}?page=" . $this->get_next_i();
    $url_previous= "{$_SERVER['PHP_SELF']}?page=" . $this->get_previous_i();

    //echo "Show page n $this->i : {$this->liste[$this->i]}<br>\n";
    $url_include = $this->liste[$this->i];

echo "<html>
  <head>
    <title>Afficheur</title>
  </head>

  <body>

  <script type=\"text/javascript\"><!--
setTimeout('Redirect()',{$this->get_timeout()});
function Redirect()
{
 location.href = '$url_next';
}
// --></script>

<!-- Show page n $this->i : {$this->liste[$this->i]}<br> -->

    <iframe src=\"$url_include\" height=\"100%\" width=\"100%\" frameborder=\"0\">
      Alternative text for browsers that do not understand IFrames.
    </iframe>
  </body>

<!-- <a href='$url_next'>Page suivante<br></a> -->
<!-- <a href='$url_previous'>Page pr&eacute;c&eacute;dente<br></a> -->
</html>";

  }

  public function goto_page($i) {
    if (!is_numeric($i)) {
      $i=0;
    }
    $this->set_i($i);
    $this->show();
  }
}

?>
