<?php

/**
 * definition du plugin "dew tube"
 */
	function dewtube($url){
		static	$player = NULL;
		if ($player == NULL)
			$player = find_in_path('dewtube.swf');
		$playa_ = "
<object type='application/x-shockwave-flash' 
data='$player?movie=$url' width='512' height='384'>
<param name='movie' value='$player?movie=$url'/>
</object>";
	
		return $playa_;
		
	}

	/* static public */
	function dewtube_post_propre($quelquechose) {

		// ne rien faire = retourner ce qu'on nous a envoye
		
		$reg_formats="flv";
		 
		//trouver des liens complets
		unset($matches) ;
		preg_match_all("/<a href=['\"]?(http:\/\/[a-zA-Z0-9 ()\/\:\._%\?+'=~-]*\.($reg_formats))['\"]?[^>]*>(.*)<\/a>/iU", $quelquechose, $matches);
		$url_a=$matches[1];

		if(!$matches[1][0]){
			//trouver des url relatives
			unset($matches) ;
			preg_match_all("/<a(.*)href=['\"]([a-zA-Z0-9 ()\/\._&%\?+'=~-]*\.($reg_formats))['\"](.*)[^>]*>(.*)<\/a>/iU", $quelquechose, $matches);
			$url_a=$matches[2];
		}
		if (is_array($url_a)){
			if ($player == NULL)
				$player = find_in_path('dewtube.swf');
			foreach($url_a as $url){
				$quelquechose .= dewtube($url);
			}
		}
		
		return $quelquechose;
	}

	
?>