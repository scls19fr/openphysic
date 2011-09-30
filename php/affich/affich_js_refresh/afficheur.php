<?php

include_once("afficheur_class.php");

$list = new pages(
  array(
    "page0.php",
    "page1.php",
    "page2.php?param1=1",
    "page3.php")
);
$list->set_timeout(2000);
$page=$_GET['page'];
$list->goto_page($page);

?>
