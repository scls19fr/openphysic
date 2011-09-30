<?php
class Tuteur extends AppModel {

	var $name = 'Tuteur';

	//The Associations below have been created with all possible keys, those that are not needed can be removed
	var $hasAndBelongsToMany = array(
		'Stage' => array(
			'className' => 'Stage',
			'joinTable' => 'stages_tuteurs',
			'foreignKey' => 'tuteur_id',
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