<?php

include_once("afficheur_class.php");

$list = new pages(
  array(
    "page0.php",
    "page1.php",
    "page2.php?param1=1",
    "page3.php",
  )
);

/*
    "http://www.celles.net/php/hello.php?name=TOTO",
    "http://www.celles.net/php/content.php",
    "http://127.0.0.1/php/affich/scroll/scroll_iframe.php",
*/

$list->set_timeout(1000); // duree d'une page
$list->set_refresh_timeout(5000); // relecture du script PHP (mise à jour EDT)
$list->show();

?>
