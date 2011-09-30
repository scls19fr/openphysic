<?php
class EnseignantsStage extends AppModel {

	var $name = 'EnseignantsStage';

	//The Associations below have been created with all possible keys, those that are not needed can be removed
	var $belongsTo = array(
		'Stage' => array(
			'className' => 'Stage',
			'foreignKey' => 'stage_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'Enseignant' => array(
			'className' => 'Enseignant',
			'foreignKey' => 'enseignant_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);

}
?>