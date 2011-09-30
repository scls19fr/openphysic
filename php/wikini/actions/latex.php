<?php
/* 
titre: Action LaTeX pour Wikini
Auteur: Sébastien Celles (mimetex)
License: GPL
*/

if (!defined("WIKINI_VERSION"))
 {
         die ("accès direct interdit");
 }
 
$expression = $this->GetParameter("expression");
$baseurl = "http://www.forkosh.com/mimetex.cgi?";
$fullurl = $baseurl . rawurlencode($expression);

echo "<img src=\"$fullurl\" alt=\"expression math\" valign=\"middle\"/>";

?> 