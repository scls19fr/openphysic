<?php
class StagesStagiaire extends AppModel {

	var $name = 'StagesStagiaire';

	//The Associations below have been created with all possible keys, those that are not needed can be removed
	var $belongsTo = array(
		'Stage' => array(
			'className' => 'Stage',
			'foreignKey' => 'stage_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'Stagiaire' => array(
			'className' => 'Stagiaire',
			'foreignKey' => 'stagiaire_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);

}
?>