<?php
class HeuresHelper extends AppHelper {
	function h_eq_td($a_heures) {
		return 1.5*$a_heures['h_cours']+$a_heures['h_td']+$a_heures['h_tp'];
	}

	function h_tot($a_heures) {
		return $a_heures['h_cours']+$a_heures['h_td']+$a_heures['h_tp'];
	}
	
	
	function get($a_heures, $param=null) { // param=h_cours or h_td or h_tp or null
		$h0=array('h_cours'=>0, 'h_td'=>0, 'h_tp'=>0);
		
		if ( $param==null ) {
			if ( empty($a_heures) ) {
				return $h0;
			} else {
				return $a_heures;
			}
		} else {
			if ( !empty($a_heures[$param]) ) {
				return $a_heures[$param];
			} else {
				return $h0[$param];
			}
		}
	}
	
}
?>