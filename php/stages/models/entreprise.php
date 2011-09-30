<?php
class Entreprise extends AppModel {

	var $name = 'Entreprise';

	//The Associations below have been created with all possible keys, those that are not needed can be removed
	var $hasMany = array(
		'Stage' => array(
			'className' => 'Stage',
			'foreignKey' => 'entreprise_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		)
	);

}
?>