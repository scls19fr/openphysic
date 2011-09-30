<h2>Test</h2>

<h3>Test 3 couleurs</h3>
<table cellpadding="0" cellspacing="0">
	<tr>
		<th width="33%"><0</th>
		<th width="33%">=0</th>
		<th width="33%">>0</th>
	</tr>
	<tr>
		<td <?php echo $couleurs->three_colors(-1); ?>>x</td>
		<td <?php echo $couleurs->three_colors(0); ?>>x</td>
		<td <?php echo $couleurs->three_colors(1); ?>>x</td>
	</tr>
</table>

<h3>Test dégradé de couleurs</h3>
<?php
	$nb=15;
	$eps=0.1;
	$nb_tot=2*$nb+1;
	$w=100/$nb_tot;
	
	function head($w, $x) {
		echo "		<th width=\"$w%\">$x</th>"."\n";
	}

?>
<?php
echo "<table cellpadding=\"0\" cellspacing=\"0\">";
echo "	<tr>";
for ($i=0 ; $i<$nb ; $i++) {
	$x=-$eps*($nb-$i);
	head($w, $x);
}
	$x=0;
	head($w, $x);
for ($i=1 ; $i<=$nb ; $i++) {
	$x=$eps*$i;
	head($w, $x);
}
echo "	</tr>"."\n";
echo "	<tr>"."\n";
for ($i=-$nb ; $i<=$nb ; $i++) {
	$x=$i*$eps;
	echo "		<td {$couleurs->gradient_3colors($x)}>x</td>"."\n";
}
echo "	</tr>"."\n";
?>
</table>