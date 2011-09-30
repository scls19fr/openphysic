<?php
class PasswordHelper extends AppHelper {
	function hide($password) {
		$len=strlen($password);
		$p='';
		for ($i=0 ; $i<$len ; $i++) {
			echo $p.'*';
		}
		return $p;
	}
}
?>