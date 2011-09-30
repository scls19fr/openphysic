<?php
class VueMatieresComblesBesoin extends AppModel {

	var $name = 'VueMatieresComblesBesoin';

	//The Associations below have been created with all possible keys, those that are not needed can be removed
	/*
	var $belongsTo = array(
		'Matiere' => array(
			'className' => 'Matiere',
			'foreignKey' => 'matiere_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
	*/
	
	var $hasOne = array('Matiere');

}
?>