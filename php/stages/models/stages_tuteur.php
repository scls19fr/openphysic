<?php
class StagesTuteur extends AppModel {

	var $name = 'StagesTuteur';

	//The Associations below have been created with all possible keys, those that are not needed can be removed
	var $belongsTo = array(
		'Stage' => array(
			'className' => 'Stage',
			'foreignKey' => 'stage_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'Tuteur' => array(
			'className' => 'Tuteur',
			'foreignKey' => 'tuteur_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);

}
?>