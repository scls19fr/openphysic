<?php
class Matiere extends AppModel {

	var $name = 'Matiere';

	var $belongsTo = array('Filiere' =>
        array('className'    => 'Filiere',
			'conditions'   => '',
			'order'        => '', // Filiere.name ASC, Matiere.name ASC
			'foreignKey'   => 'filiere_id'
    	)
	);

	var $hasMany = array('MatieresPerso' =>
		array('className'    => 'MatieresPerso',
			'conditions'   => '',
			'order'        => 'h_cours DESC, h_td DESC, h_tp DESC',
			'foreignKey'   => 'matiere_id'
		)
	);

	//var $hasOne = array('VueMatieresTotalBesoin', 'VueMatieresComblesBesoin', 'VueMatieresRestantsBesoin');

	var $validate = array(
		//'name'=>'alphaNumeric',
		'h_cours'=>'numeric',
		'h_td'=>'numeric',
		'h_tp'=>'numeric'
	);

	//var $hasAndBelongsToMany = array('Perso');

	/* Bilan horaire par matiere : $id=... */
	/* Bilan horaire pour toutes les matières $id=null ou 'all' */

	
	/*=============================
	 = Volume horaire à attribuer =
	 =============================*/
	
	function get_vol_horaire_a_attribuer_with_sql_view($id='all') {
		// Méthode 1 : à l'aide d'une vue SQL dans la base

		if ($id==null or $id=='all') {
			$this->VueMatieresTotalBesoin =& ClassRegistry::init('VueMatieresTotalBesoin');
			$this->VueMatieresTotalBesoin->recursive = -1;
			$temp = $this->VueMatieresTotalBesoin->find('all');
			//debug($temp);
			return $temp;
				
		} else {
		

			$this->VueMatieresTotalBesoin =& ClassRegistry::init('VueMatieresTotalBesoin');
			$this->VueMatieresTotalBesoin->recursive = -1;
			$temp = $this->VueMatieresTotalBesoin->read(null, $id);
			return $temp['VueMatieresTotalBesoin'];

		}
	}

	function get_vol_horaire_a_attribuer_with_sql_query($id='all') {
		// Méthode 2
		$prefix = $this->tablePrefix;
		
		if ($id==null or $id=='all') {
			//  à l'aide d'une requête SQL
			$sql = "SELECT {$prefix}matieres.id AS id, {$prefix}matieres.h_cours as h_cours, {$prefix}matieres.h_td * {$prefix}filieres.nb_gr_td AS h_td, h_tp * {$prefix}filieres.nb_gr_tp AS h_tp FROM {$prefix}matieres, {$prefix}filieres WHERE {$prefix}matieres.filiere_id = {$prefix}filieres.id;";
			$temp = $this->query($sql);
			$result = array();
			foreach ( $temp as $key => $matiere ) {
				$matiere_id=$matiere['services_matieres']['id'];
				$result=Set::insert($result, $matiere_id,
					array(	'h_cours'=>$matiere['services_matieres']['h_cours'],
							'h_td'=>$matiere[0]['h_td'],
							'h_tp'=>$matiere[0]['h_tp']
							)
				);
				//debug($matiere_id);
			}
			//$result = Set::combine ($result, '{n}.services_matieres.id', '{n}.0'); // Mise en forme l'array pour avoir matiere_id comme clé
			return $result;


		} else {
			// à l'aide d'une requête read recursive et d'une boucle
			$this->recursive=0;
			$matiere = $this->read(null, $id);
			$result = array(
				'h_cours'=>$matiere['Matiere']['h_cours']*1,
				'h_td'=>$matiere['Matiere']['h_td']*$matiere['Filiere']['nb_gr_td'],
				'h_tp'=>$matiere['Matiere']['h_tp']*$matiere['Filiere']['nb_gr_tp']
			);
			return $result;
		}
		
	}

	function get_vol_horaire_a_attribuer_with_loop($id='all') {
		// Méthode 3
		if ($id==null or $id=='all') {
			// à l'aide d'une requête find all et d'une boucle
			$temp = $this->find('all');
			$result = array();
			foreach ( $temp as $key => $matiere ) {
				$matiere_id=$matiere['Matiere']['id'];
				$result=Set::insert($result, $matiere_id,
					array(	'h_cours'=>$matiere['Matiere']['h_cours'],
							'h_td'=>$matiere['Matiere']['h_td']*$matiere['Filiere']['nb_gr_td'],
							'h_tp'=>$matiere['Matiere']['h_tp']*$matiere['Filiere']['nb_gr_tp']
							)
						);
			}
			return $result;

		} else {
			// à l'aide d'une requête read recursive et du calcul heure_matiere*nb_gr
			$this->recursive=0;
			$matiere = $this->read(null, $id);
			$result = array(
				'h_cours'=>$matiere['Matiere']['h_cours'],
				'h_td'=>$matiere['Matiere']['h_td']*$matiere['Filiere']['nb_gr_td'],
				'h_tp'=>$matiere['Matiere']['h_tp']*$matiere['Filiere']['nb_gr_tp']
			);
			return $result;
		}
	}

	function get_vol_horaire_a_attribuer($id='all') {
		return $this->get_vol_horaire_a_attribuer_with_sql_query($id);
	}
	
	
	/*==========================
	 = Volume horaire attribué =
	 ==========================*/
	 
	function get_vol_horaire_attribue_with_sql_view($id='all') {
		// Méthode 1 : à l'aide d'une vue SQL dans la base
		
		if ($id==null or $id=='all') {
			throw new Exception('ToDo');
			
		} else {
			$this->VueMatieresComblesBesoin =& ClassRegistry::init('VueMatieresComblesBesoin');
			$this->VueMatieresComblesBesoin->recursive=-1;
			$temp = $this->VueMatieresComblesBesoin->read(null, $id);
			return $temp['VueMatieresComblesBesoin'];
			
		}
	}

	function get_vol_horaire_attribue_with_sql_query($id='all') {
		// Méthode 2 : à l'aide d'une requête SQL
		if ($id==null or $id=='all') {
			throw new Exception('ToDo');
			
		} else {
			throw new Exception('ToDo');
			
		}
	}

	function get_vol_horaire_attribue_with_loop($id='all') {
		// Méthode 3 : à l'aide d'une requête find + boucle pour calculer la somme
		if ($id==null or $id=='all') {
			throw new Exception('ToDo');
			
		} else {
			$this->MatieresPerso =& ClassRegistry::init('MatieresPerso');
			$this->recursive=-1;
			$matieres_persos = $this->MatieresPerso->find('all', array('conditions'=>array('matiere_id' => $id)));

			$result=array('h_cours'=>0, 'h_td'=>0, 'h_tp'=>0);
			//$result=$matieres_perso;
			foreach ( $matieres_persos as $key => $matieres_perso ) {
				$result['h_cours']=$result['h_cours']+$matieres_perso['MatieresPerso']['h_cours'];
				$result['h_td']=$result['h_td']+$matieres_perso['MatieresPerso']['h_td'];
				$result['h_tp']=$result['h_tp']+$matieres_perso['MatieresPerso']['h_tp'];
			}			
			return $result;

		}
	}


	function get_vol_horaire_attribue($id='all') {
		//return $this->get_vol_horaire_attribue_with_sql_view($id);
		//return $this->get_vol_horaire_attribue_with_sql_query($id);
		return $this->get_vol_horaire_attribue_with_loop($id);
	}
	
	
	/*=========================
	 = Volume horaire restant =
	 =========================*/

    function get_vol_horaire_restant_with_sql_view($id='all') {
		//  Méthode 1 : à l'aide d'une vue SQL dans la base
		$this->VueMatieresRestantsBesoin =& ClassRegistry::init('VueMatieresRestantsBesoin');
		$this->VueMatieresRestantsBesoin->recursive=-1;
		$temp = $this->VueMatieresRestantsBesoin->read(null, $id);
		//debug($temp);
		return $temp['VueMatieresRestantsBesoin'];
	}

    function get_vol_horaire_restant_without_sql_view($id='all') {
    	$vol_horaire_a_effectuer=$this->get_vol_horaire_a_attribuer($id);
    	$vol_horaire_attribue=$this->get_vol_horaire_attribue($id);
    	    	
    	$result=array(
    		'h_cours'=>$vol_horaire_a_effectuer['h_cours']-$vol_horaire_attribue['h_cours'],
    		'h_td'=>$vol_horaire_a_effectuer['h_td']-$vol_horaire_attribue['h_td'],
    		'h_tp'=>$vol_horaire_a_effectuer['h_tp']-$vol_horaire_attribue['h_tp']
    	);
		return $result;
	}

    
    function get_vol_horaire_restant($id='all') {
		//return $this->get_vol_horaire_restant_with_sql_view($id);
		return $this->get_vol_horaire_restant_without_sql_view($id);
	}
	
	
	/*=========================
	 = Volume horaire (bilan) =
	 =========================*/
	 function get_vol_horaire($id) {
	 	return array(
       		'a_effectuer'=>$this->get_vol_horaire_a_attribuer($id),
       		'attribue'=>$this->get_vol_horaire_attribue($id),
       		'restant'=>$this->get_vol_horaire_restant($id)
       	);
	 }

		/*
		function test() {
			$matieres = $this->find('all', array('recursive'=>0) );
			$matieres_tot = $matieres;
			foreach ($matieres as $matiere) {
				$matieres_tot['Matiere']['h_tp'] = $matiere['Matiere']['h_tp']*$matiere['Filiere']['nb_gr_tp'];
			}
			return $matieres_tot;
			//return "a test in model";
		}
		*/
        
}
?>