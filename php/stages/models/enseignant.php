<?php
class Enseignant extends AppModel {

	var $name = 'Enseignant';

	//The Associations below have been created with all possible keys, those that are not needed can be removed
	var $hasAndBelongsToMany = array(
		'Stage' => array(
			'className' => 'Stage',
			'joinTable' => 'enseignants_stages',
			'foreignKey' => 'enseignant_id',
			'associationForeignKey' => 'stage_id',
			'unique' => true,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'finderQuery' => '',
			'deleteQuery' => '',
			'insertQuery' => ''
		)
	);

}
?>