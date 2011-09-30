<?php
//require_once "gradient.php";

class CouleursHelper extends AppHelper {

	/*
	function test() {
		debug("Test");
		//return "Ok";
	}
	*/
	
	function heures_restantes($h_restantes, $h_a_attribuer) {
		return $this->three_colors($h_restantes);
		
		/*
		if ($h_a_attribuer<>0) {
			$x=$h_restantes/$h_a_attribuer;
		} else {
			$x=0;
		}
		return $this->gradient_3colors($x);
		*/
	}
	
	function three_colors($x) {
		if ($x==0) {
			$rgb="00ff00"; // vert
		} elseif ($x<0) {
			$rgb="ff8000"; // orange
		} else { // $x>0
			$rgb="ff0000"; // rouge
		}
		return "style='background: #$rgb;'";
	}
	
	function gradient_3colors($x) { /* ToDo */
		$aRGB = array('R'=>255, 'G'=>255, 'B'=>255); // blanc
		
		$rgb="ffffff"; // blanc
	
		if ($x==0) {
			$aRGB = array('R'=>0, 'G'=>255, 'B'=>0); // vert
			//$rgb="00ff00"; // vert
		} elseif ($x<=-1) {
			$aRGB = array('R'=>255, 'G'=>127, 'B'=>0); // orange
			//$rgb="ff8000"; // orange
		} elseif ($x>=1) {
			$aRGB = array('R'=>255, 'G'=>0, 'B'=>0); // rouge
			//$rgb="ff0000"; // rouge
		} elseif ($x>0 and $x<1) { // vert-rouge
			$aRGB = array('R'=>255*$x, 'G'=>255*(1-$x), 'B'=>0); // vert-rouge
			//$rgb="ff8000"; // orange
		} elseif ($x<0 and $x>-1) { // vert-orange
			$aRGB = array('R'=>255*-$x, 'G'=>(255-127)*(1+$x)+127, 'B'=>0); // vert-rouge		
			//$rgb="ff0000"; // rouge
		} else {
		}
		
		//debug($x);
		//debug($aRGB);
		
		// ToDo : conversion aRGB en array d'entiers décimal puis en hexa
		$rgb = $this->rgb2html($aRGB['R'], $aRGB['G'], $aRGB['B']);
		
		return "style='background: $rgb;'";
	}

	function rgb2html($r, $g=-1, $b=-1) {
		if (is_array($r) && sizeof($r) == 3)
			list($r, $g, $b) = $r;

		$r = intval($r);
		$g = intval($g);
		$b = intval($b);

		$r = dechex($r<0?0:($r>255?255:$r));
		$g = dechex($g<0?0:($g>255?255:$g));
		$b = dechex($b<0?0:($b>255?255:$b));

		$color = (strlen($r) < 2?'0':'').$r;
		$color .= (strlen($g) < 2?'0':'').$g;
		$color .= (strlen($b) < 2?'0':'').$b;

	    return '#'.$color;
	}

}
?>