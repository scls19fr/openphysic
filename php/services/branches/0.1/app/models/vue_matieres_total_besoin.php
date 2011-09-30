<?php
class VueMatieresTotalBesoin extends AppModel {

	var $name = 'VueMatieresTotalBesoin';

	//The Associations below have been created with all possible keys, those that are not needed can be removed
	/*
	var $belongsTo = array(
		'Matiere' => array(
			'className' => 'Matiere',
			'foreignKey' => 'matiere_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
	*/
	
	var $hasOne = array('Matiere');


	// without SQL View
	//SELECT services_matieres.id AS id, services_matieres.id AS matiere_id, services_matieres.h_cours AS h_cours, services_matieres.h_td * services_filieres.nb_gr_td AS h_td, h_tp * services_filieres.nb_gr_tp AS h_tp FROM services_matieres, services_filieres WHERE services_matieres.filiere_id = services_filieres.id;
	//$this->VueMatieresTotalBesoin->query("SELECT * FROM pictures LIMIT 2;");
	//$this->Matiere->tablePrefix

	//var $useTable = false;

	/*	
	var $_schema = array(
		'id' => array(
			'type' => 'integer',
			'null' => '',
			'default' => 0,
			'length' => 10
				),
		'matiere_id' => array(
			'type' => 'string',
			'null' => '',
			'default' => 0,
			'length' => 10
				),
		'h_cours' => array(
			'type' => 'float',
			'null' => '',
			'default' => 0,
			'length' => ''
				),
		'h_td' => array(
			'type' => 'float',
			'null' => '',
			'default' => 0,
			'length' => ''
				),
		'h_tp' => array(
			'type' => 'float',
			'null' => '',
			'default' => 0,
			'length' => ''
				),
	);
	*/
	
	/*
    function __construct() {
		//debug("Construct VueMatieresTotalBesoin");
    }
    */
    


}
?>