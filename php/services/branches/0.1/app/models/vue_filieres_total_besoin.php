<?php
class VueFilieresTotalBesoin extends AppModel {

	var $name = 'VueFilieresTotalBesoin';

	//The Associations below have been created with all possible keys, those that are not needed can be removed
	/*
	var $belongsTo = array(
		'Filiere' => array(
			'className' => 'Filiere',
			'foreignKey' => 'filiere_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
	*/
	
	var $hasOne = array('Filiere');

}
?>