<?php
class Wikipage extends AppModel {

	var $name = 'Wikipage';

	//var $order = 'modified DESC';
	
	function findLatestByName($pagename = "HomePage") {
		$wikipage = $this->find('all',
			array(
				'conditions' => array('name'=>$pagename),
				'order' => 'modified DESC',
				'limit' => '1',
				'fields' => 'id'
			)
		);
		
		if ( !empty($wikipage['0']['Wikipage']['id']) ) {
			return $wikipage['0']['Wikipage']['id'];
		} else {
			return null;
		}
		
	}
}
?>