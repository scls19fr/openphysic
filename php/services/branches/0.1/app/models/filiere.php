<?php
class Filiere extends AppModel {

	var $name = 'Filiere';
	
	//var $displayField = 'nom';
		
	var $order='Filiere.name ASC';
		
	var $hasMany = array('Matiere' =>
		array('className'    => 'Matiere',
			'conditions'   => null,
			'order'        => 'h_cours DESC, h_td DESC, h_tp DESC, name ASC',
			'foreignKey'   => 'filiere_id'
		)
	);
			
	//var $hasOne = array('VueFilieresTotalBesoin', 'VueFilieresComblesBesoin', 'VueFilieresRestantsBesoin');
	
	
	var $validate = array(
		//'name' => 'alphaNumeric',
		'nb_gr_td' => array( 'rule' => array('custom', '/^[0-9]*$/') ), // ToFix integer <> decimal <> numeric ???
		'nb_gr_tp' => array( 'rule' => array('custom', '/^[0-9]*$/') )
	);
		
	/*
	function isAuthorized($user, $controller, $action) {
		if ($user['User']['role'] == 'admin') {
			return true;
		} else {
			return false;
		}
	}
	*/
	
		
	/*=========================
	 = Volume horaire (bilan) =
	 =========================*/
	function get_vol_horaire($id=null) {
       	$this->recursive = 1;
		$filiere = $this->read(null, $id);
		$matieres = $filiere['Matiere'];
		$result = array(
       		'a_effectuer'=>array('h_cours'=>0, 'h_td'=>0, 'h_tp'=>0),
       		'attribue'=>array('h_cours'=>0, 'h_td'=>0, 'h_tp'=>0),
       		'restant'=>array('h_cours'=>0, 'h_td'=>0, 'h_tp'=>0)
       	);
		foreach($matieres as $key => $matiere) {
			$matiere_total_groupes_a_attribuer=$this->Matiere->get_vol_horaire_a_attribuer($matiere['id']);
			$result['a_effectuer']['h_cours']=$result['a_effectuer']['h_cours']+$matiere_total_groupes_a_attribuer['h_cours'];
			$result['a_effectuer']['h_td']=$result['a_effectuer']['h_td']+$matiere_total_groupes_a_attribuer['h_td'];
			$result['a_effectuer']['h_tp']=$result['a_effectuer']['h_tp']+$matiere_total_groupes_a_attribuer['h_tp'];
			
			$matiere_total_groupes_attribue=$this->Matiere->get_vol_horaire_attribue($matiere['id']);
			$result['attribue']['h_cours']=$result['attribue']['h_cours']+$matiere_total_groupes_attribue['h_cours'];
			$result['attribue']['h_td']=$result['attribue']['h_td']+$matiere_total_groupes_attribue['h_td'];
			$result['attribue']['h_tp']=$result['attribue']['h_tp']+$matiere_total_groupes_attribue['h_tp'];
			
			$result['restant']['h_cours']=$result['a_effectuer']['h_cours']-$result['attribue']['h_cours'];
			$result['restant']['h_td']=$result['a_effectuer']['h_td']-$result['attribue']['h_td'];
			$result['restant']['h_tp']=$result['a_effectuer']['h_tp']-$result['attribue']['h_tp'];
		}
	
	 	return $result;
	}


}
?>