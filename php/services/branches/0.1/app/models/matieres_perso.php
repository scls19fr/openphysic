<?php
class MatieresPerso extends AppModel {

	var $name = 'MatieresPerso';

	//var $displayField='Matiere.name'; //?
		
	//var $order = 'Matiere.name ASC';
		
		
	var $belongsTo = array('Perso' =>
    	array('className'    => 'Perso',
			'conditions'   => '',
			'order'        => '',
			'foreignKey'   => 'perso_id'
            ),
						'Matiere' =>
		array('className'    => 'Matiere',
			'conditions'   => '',
			'order'        => '',
			'foreignKey'   => 'matiere_id'
			)
	);

	var $validate = array( 'h_cours'=>'numeric', 'h_td'=>'numeric', 'h_tp'=>'numeric' );

	// find occupation (matiere_perso) given a matiere_id
	function findByMatiere($id=null) {
		$this->recursive=0;
		$result=$this->find('all', array( 'conditions' => array('matiere_id'=>$id) ) );
		//debug($result);
		return $result;
	}
		
	// find occupation (matiere_perso) given a perso_id
	function findByPerso($id=null) {
		$this->recursive=0;
		$result=$this->find('all', array( 'conditions' => array('perso_id'=>$id) ) );
		//debug($result);
		return $result;			
	}
		
	// find occupation (matiere_perso) given a filiere_id
	/*
	function findByFiliere($id=null) {
		$this->recursive=0;
		$result=$this->find('all', array( 'conditions' => array('filiere_id'=>$id) ) );
		//debug($result);
		return $result;	
	}
	*/
}
?>