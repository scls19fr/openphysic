<?php

/*
Augmente la luminosité de la couleur d'arrière plan lorsqu'elle est
trop proche de celle du texte
Limitation : Ne fonctionne que pour des couleurs de texte noire
*/


require_once("class_color.inc.php");

function contraster(&$backgroundcolor, &$textcolor) {
  if ($textcolor=="#000000") {
    $c_backgroundcolor=new color();

    $c_backgroundcolor->set_from_rgbhex(substr($backgroundcolor,1,6));
    // il y a un bug dans la méthode set_from_rgbhex de la classe color (à cause de #)
    // je fixe ici en utilisant substr mais il faudrait le faire dans la classe

    //$c_backgroundcolor->set_from_rgb(0,0,255);
    

    //echo "avant=";
    //print_r($c_backgroundcolor->get_luv());

    //echo "<br/>";

    //echo "apres=";
    //print_r($c_backgroundcolor->get_luv());

    //echo "<br/>";

    $luv=$c_backgroundcolor->get_luv();

    /*
      si la luminosité est supérieur à une certaine valeur on ne la change pas
      si elle est inférieur on la fixe à une constante
     */
    $lum_min=50;
    if ($luv[0]<$lum_min) {
      $luv[0]=$lum_min;
    }

    $c_backgroundcolor->set_from_luv($luv[0],$luv[1],$luv[2]);

    $backgroundcolor="#".$c_backgroundcolor->get_rgbhex();

  } else {
    throw new Exception('Impossible car la couleur de texte n\'est pas noire !!!');
  }

}

?>
