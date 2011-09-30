<?php

include_once("wikini2wikka.php");

$txt_from = <<<EOF
====== Titre ======
ZZZdssdd [[http://www.monsite.com/image.png image]] SDDSdsd
<br>
ZZZdssdd [[http://www.monsite.com/image.gif image]] SDDSdsd
<br>
ZZZdssdd [[http://www.monsite.com/image.jpg image]] SDDSdsd
<br>
ZZZdssdd [[http://www.monsite.com/image.jpeg image]] SDDSdsd
<br>
ZZZdssdd [[http://www.monsite.com/image.exe image]] SDDSdsd
<br>
ZZZdssdd [[http://www.monsite.com/blabla/testpng image]] SDDSdsd
<br>
texte
<br>
EOF;

$trans = new wikini2wikka();
$txt_to=$trans->execute($txt_from);

echo $txt_to;
?>