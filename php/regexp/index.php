<?php

//if (preg_match("** Votre REGEX **", "Ce dans quoi vous faites la recherche"))

//$patterns="#guitare#";
//$str="J'aime jouer de la guitare.";
//VRAI

//$patterns="#===== .* =====#"; // match avec 5 mais aussi 6 !
//$patterns[0]="#={5}[ ]*(.*)={5}#"; // match avec 5 mais aussi 6 !
//$replacements[0]="<h3>$1</h3>";

$patterns[0]='#{{redirect page="(.*)"#';
$replacements[0]="[[->$1]]";

//$str="===== A2c4 4 =====";
// heredoc string
$string = <<<EOF
xsxdb
=====Xx=====
===== Xx=====
=====Xx =====
===== Xx =====
=====  Xx  =====
{{redirect page="Toto"}}
TGhgg
EOF;

/*
if (preg_match($patterns[0], $string))
{
	echo "VRAI"."\n";// : $str et $regex matchent";
	//echo 'Le mot que vous cherchez se trouve dans la chaîne';
}
else
{
	echo "FAUX"."\n";
	//echo 'Le mot que vous cherchez ne se trouve pas dans la chaîne';
}

echo "<br/>"."\n";
*/

$new_string = preg_replace($patterns, $replacements, $string);
//echo $new_string;

$str = <<<EOF
<table border>
  <tr>
    <td>
      <pre>
$string
      </pre>
    </td>
    <td>
      <pre>
$new_string
      </pre>
    </td>
  </tr>
</table>
EOF;

echo $str."\n";

?>
