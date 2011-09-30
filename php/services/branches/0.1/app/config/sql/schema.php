<?php 
/* SVN FILE: $Id$ */
/* App schema generated on: 2009-08-16 19:08:57 : 1250443257*/
class AppSchema extends CakeSchema {
	var $name = 'App';

	function before($event = array()) {
		return true;
	}

	function after($event = array()) {
	}

	var $filieres = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => NULL, 'length' => 10, 'key' => 'primary'),
		'name' => array('type' => 'string', 'null' => false, 'length' => 50),
		'nb_gr_td' => array('type' => 'integer', 'null' => false, 'default' => '0', 'length' => 10),
		'nb_gr_tp' => array('type' => 'integer', 'null' => false, 'default' => '0', 'length' => 10),
		'indexes' => array('PRIMARY' => array('column' => 'id', 'unique' => 1))
	);
	var $groups = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => NULL, 'key' => 'primary'),
		'name' => array('type' => 'string', 'null' => false, 'length' => 100),
		'created' => array('type' => 'datetime', 'null' => true, 'default' => NULL),
		'modified' => array('type' => 'datetime', 'null' => true, 'default' => NULL),
		'indexes' => array('PRIMARY' => array('column' => 'id', 'unique' => 1))
	);
	var $matieres = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => NULL, 'length' => 10, 'key' => 'primary'),
		'name' => array('type' => 'string', 'null' => false, 'length' => 50),
		'h_cours' => array('type' => 'float', 'null' => false, 'default' => '0'),
		'h_td' => array('type' => 'float', 'null' => false, 'default' => '0'),
		'h_tp' => array('type' => 'float', 'null' => false, 'default' => '0'),
		'filiere_id' => array('type' => 'integer', 'null' => false, 'default' => '0', 'length' => 10),
		'commentaire' => array('type' => 'string', 'null' => false, 'length' => 50),
		'indexes' => array('PRIMARY' => array('column' => 'id', 'unique' => 1))
	);
	var $matieres_persos = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => NULL, 'length' => 10, 'key' => 'primary'),
		'perso_id' => array('type' => 'integer', 'null' => false, 'default' => '0', 'length' => 10),
		'matiere_id' => array('type' => 'integer', 'null' => false, 'default' => '0', 'length' => 10),
		'h_cours' => array('type' => 'float', 'null' => false, 'default' => '0'),
		'h_td' => array('type' => 'float', 'null' => false, 'default' => '0'),
		'h_tp' => array('type' => 'float', 'null' => false, 'default' => '0'),
		'indexes' => array('PRIMARY' => array('column' => 'id', 'unique' => 1))
	);
	var $persos = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => NULL, 'length' => 10, 'key' => 'primary'),
		'initiales' => array('type' => 'string', 'null' => false, 'length' => 10),
		'nom' => array('type' => 'string', 'null' => false, 'length' => 50),
		'prenom' => array('type' => 'string', 'null' => false, 'length' => 50),
		'statut_id' => array('type' => 'integer', 'null' => false, 'default' => '0', 'length' => 10),
		'permanent' => array('type' => 'boolean', 'null' => false, 'default' => '0'),
		'indexes' => array('PRIMARY' => array('column' => 'id', 'unique' => 1))
	);
	var $statuts = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => NULL, 'length' => 10, 'key' => 'primary'),
		'nom' => array('type' => 'string', 'null' => false, 'length' => 50),
		'h_statut' => array('type' => 'float', 'null' => false, 'default' => '0'),
		'h_sup_max' => array('type' => 'float', 'null' => false, 'default' => '0'),
		'indexes' => array('PRIMARY' => array('column' => 'id', 'unique' => 1))
	);
	var $users = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => NULL, 'length' => 10, 'key' => 'primary'),
		'username' => array('type' => 'string', 'null' => false, 'key' => 'unique'),
		'password' => array('type' => 'string', 'null' => false, 'length' => 40),
		'group_id' => array('type' => 'integer', 'null' => false, 'default' => '0'),
		'created' => array('type' => 'datetime', 'null' => true, 'default' => NULL),
		'modified' => array('type' => 'datetime', 'null' => true, 'default' => NULL),
		'perso_id' => array('type' => 'integer', 'null' => false, 'default' => '0', 'length' => 10),
		'role' => array('type' => 'string', 'null' => true, 'default' => 'www', 'length' => 50),
		'indexes' => array('PRIMARY' => array('column' => 'id', 'unique' => 1), 'username' => array('column' => 'username', 'unique' => 1))
	);
	var $vue_filieres_combles_besoins = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => '0', 'length' => 10, 'key' => 'primary'),
		'filiere_id' => array('type' => 'integer', 'null' => false, 'default' => '0', 'length' => 10),
		'h_cours' => array('type' => 'float', 'null' => true, 'default' => NULL),
		'h_td' => array('type' => 'float', 'null' => true, 'default' => NULL),
		'h_tp' => array('type' => 'float', 'null' => true, 'default' => NULL),
		'indexes' => array()
	);
	var $vue_filieres_restants_besoins = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => '0', 'length' => 10, 'key' => 'primary'),
		'filiere_id' => array('type' => 'integer', 'null' => false, 'default' => '0', 'length' => 10),
		'h_cours' => array('type' => 'float', 'null' => true, 'default' => NULL),
		'h_td' => array('type' => 'float', 'null' => true, 'default' => NULL),
		'h_tp' => array('type' => 'float', 'null' => true, 'default' => NULL),
		'indexes' => array()
	);
	var $vue_filieres_total_besoins = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => '0', 'length' => 10, 'key' => 'primary'),
		'filiere_id' => array('type' => 'integer', 'null' => false, 'default' => '0', 'length' => 10),
		'h_cours' => array('type' => 'float', 'null' => true, 'default' => NULL),
		'h_td' => array('type' => 'float', 'null' => true, 'default' => NULL),
		'h_tp' => array('type' => 'float', 'null' => true, 'default' => NULL),
		'indexes' => array()
	);
	var $vue_matieres_combles_besoins = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => '0', 'length' => 10, 'key' => 'primary'),
		'matiere_id' => array('type' => 'integer', 'null' => false, 'default' => '0', 'length' => 10),
		'h_cours' => array('type' => 'float', 'null' => true, 'default' => NULL),
		'h_td' => array('type' => 'float', 'null' => true, 'default' => NULL),
		'h_tp' => array('type' => 'float', 'null' => true, 'default' => NULL),
		'indexes' => array()
	);
	var $vue_matieres_restants_besoins = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => '0', 'length' => 10, 'key' => 'primary'),
		'matiere_id' => array('type' => 'integer', 'null' => false, 'default' => '0', 'length' => 10),
		'h_cours' => array('type' => 'float', 'null' => true, 'default' => NULL),
		'h_td' => array('type' => 'float', 'null' => true, 'default' => NULL),
		'h_tp' => array('type' => 'float', 'null' => true, 'default' => NULL),
		'indexes' => array()
	);
	var $vue_matieres_total_besoins = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => '0', 'length' => 10, 'key' => 'primary'),
		'matiere_id' => array('type' => 'integer', 'null' => false, 'default' => '0', 'length' => 10),
		'h_cours' => array('type' => 'float', 'null' => false, 'default' => '0'),
		'h_td' => array('type' => 'float', 'null' => false, 'default' => '0'),
		'h_tp' => array('type' => 'float', 'null' => false, 'default' => '0'),
		'indexes' => array()
	);
	var $vue_persos_bilan_services = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => '0', 'length' => 10, 'key' => 'primary'),
		'perso_id' => array('type' => 'integer', 'null' => false, 'default' => '0', 'length' => 10),
		'h_cours' => array('type' => 'float', 'null' => true, 'default' => NULL),
		'h_td' => array('type' => 'float', 'null' => true, 'default' => NULL),
		'h_tp' => array('type' => 'float', 'null' => true, 'default' => NULL),
		'indexes' => array()
	);
}
?>