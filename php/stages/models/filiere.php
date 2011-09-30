<?php
class Filiere extends AppModel {

	var $name = 'Filiere';

	//The Associations below have been created with all possible keys, those that are not needed can be removed
	var $hasMany = array(
		'Stagiaire' => array(
			'className' => 'Stagiaire',
			'foreignKey' => 'filiere_id',
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