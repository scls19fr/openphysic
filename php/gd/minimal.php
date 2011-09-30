<?php
header("Content-type: image/png"); //la ligne qui change tout !
$x = 50; //largeur de mon image en PIXELS uniquement !
$y = 100; //hauteur de mon image en PIXELS uniquement !

/* on créé l'image en vraies couleurs avec une largeur de 50 pixels et une hauteur de 100 pixels */
$image = imagecreatetruecolor($x,$y);
imagepng($image); //renvoie une image sous format png
imagedestroy($image); //détruit l'image, libérant ainsi de la mémoire
?>
