<?php

/*
Affiche différentes pages présentes dans l'array $liste
Principe : les différentes pages à afficher sont placées
 dans différents iframes.
 Tous les iframes sont cachés sauf celui à afficher
 */

class pages { 
  private $liste;
  private $default_timeout;
  private $default_refresh_timeout;

  public function __construct($liste) {
    $this->liste=$liste;
    $this->default_timeout=4000; // duree d'une page : 4s par défaut
    $this->set_refresh_timeout(60000); // relecture du script : 60s par défaut
  }

  public function __destruct() {
  }

  public function nb() {
    return count($this->liste)-1;
  }

  public function set_timeout($t) {
    $this->default_timeout=$t;
  }

  private function get_timeout() {
    return $this->default_timeout;
  }

  public function set_refresh_timeout($t) {
    $this->default_refresh_timeout=$t;
  }

  private function get_refresh_timeout() {
    return $this->default_refresh_timeout;
  }

  public function show() {
echo "<html>
  <head>
    <title>Afficheur avec iframes cach&eacute;s</title>
  </head>

  <body onload=\"load()\">

  <script type=\"text/javascript\"><!--

var i_affich = 0;

function load()
{
  /*
   Rappel du script PHP
    1000=1s
   60000=60s=1min
  300000=5min
  */
  //setTimeout('refresh()',{$this->get_refresh_timeout()});

  update();
}

/*
 Appel periodique du script PHP en cas de mise à jour de l'emploi du temps
*/
function refresh()
{

req = new XMLHttpRequest();
req.open('GET', '{$_SERVER['PHP_SELF']}', true);
req.onreadystatechange = function ()
   {
     if (req.readyState == 4)
       {
         if(req.status == 200) {
           // Page accessible
           // Reloader la page
           location.href = '{$_SERVER['PHP_SELF']}';
           //document.getElementById(\"status\").style.backgroundColor=\"#00FF00\";
           //document.getElementById(\"status\").innerHTML=\"status OK\";
         } else {
           // Page non accessible
           // Ne rien faire
           //alert(\"page {$_SERVER['PHP_SELF']} non accessible (status<>200)\");
           //document.getElementById(\"status\").style.backgroundColor=\"#FFFF00\";
           //document.getElementById(\"status\").innerHTML=\"page {$_SERVER['PHP_SELF']} non accessible (status<>200)\";
         }
       } else {
           //alert(\"page {$_SERVER['PHP_SELF']} non accessible (readyState<>4)\");
           //document.getElementById(\"status\").style.backgroundColor=\"#FF0000\";
           //document.getElementById(\"status\").innerHTML=\"page {$_SERVER['PHP_SELF']} non accessible (readyState<>4)\";
       }
   };
req.send(null);	
}

function next_page() {
  if (i_affich=={$this->nb()}) {
    i_affich=0;
  } else {
    i_affich++;
  }
}

/*
 Changement de page
*/
function update()
{
//  Cache tous les iframes
for(i=0;i<={$this->nb()};i++) {
  document.getElementById(\"page\"+i).style.display=\"none\"; // ou style.visibility=\"hidden\"
}

// Affiche l'iframe actuel
document.getElementById(\"page\"+i_affich).style.display=\"\"; // ou removeAttribute(\"style\")

next_page();

setTimeout('update()',{$this->get_timeout()}); // refresh périodique
}
// --></script>

";

/*
echo "
    <div id=\"status\">Status</div>";
*/

for ($i=0;$i<=count($this->liste)-1;$i++) {
echo "

    <iframe id=\"page$i\" name=\"page$i\" src=\"{$this->liste[$i]}\" height=\"100%\" width=\"100%\" frameborder=\"0\">
      Alternative text for browsers that do not understand IFrames.
    </iframe>
";
}

echo "
  </body>

</html>";

  }

}



?>
