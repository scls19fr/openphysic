<?php
/*
Insére un fichier multimédia et l'affiche avec le player Flash adapté
Usage : {{player src="fichier.ext" params="..."}}
A utiliser conjointement avec une action permettant l'upload de fichiers
*/

// protection contre un appel direct
if (!defined("WIKINI_VERSION"))
{
	die ("accés direct interdit");
}

if (!function_exists('file_ext_not_supported')) { // an action can be loaded several times for the same page
  function file_ext_not_supported($url, $ext) {
    echo "<b>Format non pris en charge</b>";
  }
}

$base="http://www.celles.net";
$media="media/samples";
$players="media/players";

// recuperation des parametres
$src = $this->GetParameter("src"); // adresse du fichier multimedia

if (empty($src)) {
  //echo "nothing to DO";
} else {
  $filename=strtolower($src);
  $ext = split("[/\\.]", $filename);
  $n = count($ext)-1;
  $ext = $ext[$n];

  $url="$base/$media/$src"; // urlencode ? rawurlencode ?

  if ($ext=="png" or $ext=="gif" or $ext=="jpg" or $ext=="jpeg") {
    //echo "Image $ext $url";
    file_ext_not_supported($url, $ext);


  } else if ($ext=="mp3") {
    $player = "$base/$players/dewplayer/dewplayer.swf";
    //echo "Son $ext $url";
    echo <<<EOT
<object type="application/x-shockwave-flash" data="$player?mp3=$url&amp;showtime=1" width="200" height="20">
  <param name="wmode" value="transparent" />
  <param name="movie" value="$player?mp3=$url&amp;showtime=1" />
</object>
EOT;


  } else if ($ext=="flv") {
    $player = "$base/$players/player_flv/player_flv_maxi.swf";
    //echo "Video $ext $url";
    echo <<<EOT
<object class="playerpreview" type="application/x-shockwave-flash" data="$player" width="320" height="240">
	<param name="movie" value="$player" />
	<param name="allowFullScreen" value="true" />
	<param name="FlashVars" value="flv=$url&amp;width=320&amp;height=240&amp;showstop=1&amp;showvolume=1&amp;showtime=1&amp;startimage=$base/$players/player_flv/startimage_fr.jpg&amp;showfullscreen=1&amp;bgcolor1=189ca8&amp;bgcolor2=085c68&amp;playercolor=085c68" />
</object>
EOT;


  } else if ($ext=="swf") {
    //file_ext_not_supported($url, $ext);
    /* ToDo : obtenir côté serveur la taille width/height du fichier
        voir libMing http://www.libming.org
     */
    echo <<<EOT
<object type="application/x-shockwave-flash" data="$url" width="320" height="240">
<param name="movie" value="$url" />
</object>
EOT;

  } else {
    file_ext_not_supported($url, $ext);
  }
/*
ToDo :
support de liste de fichiers séparés par des pipes |
support de l'extension XSPF (format xml de liste de fichiers multimédia)
  http://kent1.sklunk.net/SPIP-Plugin-XSPF-plugin
*/
}

?>
