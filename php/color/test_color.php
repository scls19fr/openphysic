<?
	require_once("class_color.inc.php");

	$c=new color();

	$step=10;

	$type_test="xyz";

	if ($type_test=="xyz")
		$max=array(95.047,100,108.883);
	if (($type_test=="cmy")||($type_test=="cmyk"))
		$max=array(1,1,1);
	if ($type_test=="luv")
		$max=array(120,255,255);
	if ($type_test=="hsl")
		$max=array(1,1,1);
	$steps[0]=$max[0]/$step;
	$steps[1]=$max[1]/$step;
	$steps[2]=$max[2]/$step;

	for ($v1=0;$v1<$max[0];$v1+=$steps[0]) {
		echo $v1."<br>\n";
		echo "<table>\n";
		for ($v2=0;$v2<$max[1];$v2+=$steps[1]) {
			echo "<tr>\n";
			for ($v3=0;$v3<$max[2];$v3+=$steps[2]) {
				if ($type_test=="xyz") {
					$c->set_from_xyz($v1,$v2,$v3);
					$values=$c->get_xyz();
				}
				if ($type_test=="cmy") {
					$c->set_from_cmy($v1,$v2,$v3);
					$values=$c->get_cmy();
				}
				if ($type_test=="cmyk") {
					$c->set_from_cmyk($v1,$v2,$v3,0.5);
					$values=$c->get_cmyk();
				}
				if ($type_test=="luv") {
					$c->set_from_luv($v1,$v2,$v3);
					$values=$c->get_luv();
				}
				if ($type_test=="hsl") {
					$c->set_from_hsl($v1,$v2,$v3);
					$values=$c->get_hsl();
				}
				echo "<td bgcolor=#".$c->get_rgbhex().">";
				if (round($v1,2)!=round($values[0],2))
					echo $v1."-".$values[0]."<br>\n";
				if (round($v2,2)!=round($values[1],2))
					echo $v2."-".$values[1]."<br>\n";
				if (round($v3,2)!=round($values[2],2))
					echo $v3."-".$values[2];
				echo "</td>\n";
			}
			echo "</tr>\n";
		}
		echo "</table>\n";
		echo "<br>\n";
	}
?>
