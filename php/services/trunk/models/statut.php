<?php
class Statut extends AppModel {

	var $name = 'Statut';

	var $displayField = 'nom';
		
	var $order = 'Statut.nom ASC';
	
	var $hasMany = array('Perso' =>
       	array('className'    => 'Perso',
			'conditions'   => '',
			'order'        => 'permanent DESC, nom ASC, prenom ASC',
			'foreignKey'   => 'statut_id'
		)
	); // utile principalement pour afficher sur la vue d'un statut la liste des Perso ayant ce statut
		
	var $validate = array(
		//'nom'=>'alphaNumeric',
		'h_statut'=>'numeric',
		'h_sup_max'=>'numeric'
	);

}
?>