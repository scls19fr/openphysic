<?php

include_once("wakka2html.php");


$txt_from = <<<EOF
xsxdb
====== T6 ======
=====T5=====
===== T5=====
=====T5 =====
===== T5 =====
=====  T5  =====
==== T4 ====
=== T3 ===
== T2 ==
{{redirect page="Toto"}}
**bold**
//italic//
__underline__
@@barr&eacute;@@
##texte &agrave; espacement fixe##
%%code%%
%%(php) PHP code%%
%%(delphi) code delphi ou pascal%%
[[LienInterne]]
[[www.snakpak.info/unit/wiki.jpg image de wikipedia]]
[[LienInterne Lien interne]]
[[http://www.site.fr Lien externe]]
http://www.site.fr/test
[[http://www.site.fr/test]]
$\frac{1}{1+x}$
$$\frac{1}{1+x}$$
 indent1
  indent2

 - item1
 - item2
----

noone@undef.fr

http://www.site.net
http://www.site.net/
http://www.site.net/wiki
http://www.site.net/wiki/
http://www.site.net/wiki/PageWiki
http://www.site.net/wiki/PageWiki/edit

TGhgg
EOF;

$trans = new wakka2html();
$txt_to=$trans->execute($txt_from);

echo $txt_to;
?>