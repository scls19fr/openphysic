<?
	require_once("class_color.inc.php");

	$c=new color();
	$c->set_from_rgb(224,200,226);
	echo "<table>\n";
	echo "<tr>\n";
	for ($i=0;$i>-1;$i-=0.05) {
		$c2=new color();
		$c2->set_from_rgb(224,200,226);
		$temp=$c2->get_hsl();
		echo "avant:".$temp[0]." ".$temp[1]." ".$temp[2];
		$c2->mod_l_hsl($i);
		$temp=$c2->get_hsl();
                echo "apres:".$temp[0]." ".$temp[1]." ".$temp[2]."<br>";
		echo "<td bgcolor=#".$c2->get_rgbhex().">&nbsp;</td>\n";
	}
	echo "</tr>\n";
	echo "</table>\n";
?>
