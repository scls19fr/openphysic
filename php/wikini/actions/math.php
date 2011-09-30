<?php
/* 
titre: Action Math pour Wikini
Auteur: Clément Seifert (algebra.com)
Auteur: Sébastien Celles (mimetex)
License: GPL
*/

if (!defined("WIKINI_VERSION"))
 {
         die ("accès direct interdit");
 }
 
$expression = $this->GetParameter("expression");
$baseurl = "http://www.algebra.com/cgi-bin/plot-formula.mpl?expression=";
$fullurl = $baseurl . rawurlencode($expression);

echo "<img src=\"$fullurl\" alt=\"expression math\" valign=\"middle\"/>";

?> 