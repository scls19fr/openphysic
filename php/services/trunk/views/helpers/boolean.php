<?php
class BooleanHelper extends AppHelper {
	function yes_no($b) {
		if ( $b ) {
			return __('oui');
		} else {
			return __('non');
		}
	}
}
?>