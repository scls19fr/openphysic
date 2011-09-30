<?php
include_once("color_manipulations.php");

$textcolor="#000000";

//$backgroundcolor="#000000"; // noir -> pb div par zero 
//$backgroundcolor="#FFFFFF"; // blanc
//$backgroundcolor="#FF0000"; // rouge vif
//$backgroundcolor="#00FF00"; // vert vif
//$backgroundcolor="#0000FF"; // bleu vif

$backgroundcolor=substr($_GET["backgroundcolor"],0,6);
if ($backgroundcolor=="") {
  $backgroundcolor="#400000"; // rouge foncé
  //$backgroundcolor="#005000"; // vert foncé
  //$backgroundcolor="#000080"; // bleu foncé
} else {
  $backgroundcolor="#".$backgroundcolor;
}
$oldbackgroundcolor=$backgroundcolor;


/* A commenter si on ne veut pas modifier les couleurs */
contraster($backgroundcolor, $textcolor);


?>

<html>
  <head>
   <title>Essais de couleurs</title>

   <style>
.avant{
 font-size: 20pt;
 color: <?=$textcolor ?>;
 background: <?=$oldbackgroundcolor?>;
}
.apres{
 font-size: 20pt;
 color: <?=$textcolor ?>;
 background: <?=$backgroundcolor?>;
}
   </style>

  </head>

  <body>

<h1>Essais de couleurs</h1>

<div class='avant'>
Ceci est un test avant
</div>

<br>

<div class='apres'>
Ceci est un test apres
</div>

<p>
Paragraphe non color&eacute;
</p>

  </body>

</html>
