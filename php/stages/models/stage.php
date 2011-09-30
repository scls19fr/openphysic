<?php
class Stage extends AppModel {

	var $name = 'Stage';

	//The Associations below have been created with all possible keys, those that are not needed can be removed
	var $belongsTo = array(
		'Entreprise' => array(
			'className' => 'Entreprise',
			'foreignKey' => 'entreprise_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);

	var $hasAndBelongsToMany = array(
		'Tuteur' => array(
			'className' => 'Tuteur',
			'joinTable' => 'stages_tuteurs',
			'foreignKey' => 'stage_id',
			'associationForeignKey' => 'tuteur_id',
			'unique' => true,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'finderQuery' => '',
			'deleteQuery' => '',
			'insertQuery' => ''
		),
		'Stagiaire' => array(
			'className' => 'Stagiaire',
			'joinTable' => 'stages_stagiaires',
			'foreignKey' => 'stage_id',
			'associationForeignKey' => 'stagiaire_id',
			'unique' => true,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'finderQuery' => '',
			'deleteQuery' => '',
			'insertQuery' => ''
		),
		'Enseignant' => array(
			'className' => 'Enseignant',
			'joinTable' => 'enseignants_stages',
			'foreignKey' => 'stage_id',
			'associationForeignKey' => 'enseignant_id',
			'unique' => true,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'finderQuery' => '',
			'deleteQuery' => '',
			'insertQuery' => ''
		),
	);

}
?>