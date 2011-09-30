<?php
/* 
titre: Action NbPages pour Wikini
description: donne le nombre de pages du wiki
License: GPL
*/

if (!defined("WIKINI_VERSION"))
 {
         die ("accès direct interdit");
 }

$res = $this->LoadSingle("SELECT count(*) as nbrPg FROM ".$this->config["table_prefix"]."pages WHERE latest='Y' and comment_on = '';");
if ($res) echo $res["nbrPg"];
?> 