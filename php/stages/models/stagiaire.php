<?php
class Stagiaire extends AppModel {

	var $name = 'Stagiaire';

	//The Associations below have been created with all possible keys, those that are not needed can be removed
	var $belongsTo = array(
		'Filiere' => array(
			'className' => 'Filiere',
			'foreignKey' => 'filiere_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);

	var $hasAndBelongsToMany = array(
		'Stage' => array(
			'className' => 'Stage',
			'joinTable' => 'stages_stagiaires',
			'foreignKey' => 'stagiaire_id',
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