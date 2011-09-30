<?php
class VuePersosBilanService extends AppModel {

	var $name = 'VuePersosBilanService';

	/*
	var $belongsTo = array(
		'Perso' => array(
			'className' => 'Perso',
			'foreignKey' => 'perso_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
	*/
	
	var $hasOne = array('Perso');

}
?>