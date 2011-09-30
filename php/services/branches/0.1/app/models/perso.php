<?php
class Perso extends AppModel {
	var $name = 'Perso';
		
	var $displayField = 'initiales';
	//var $displayField = 'nom';
		
	var $order='Perso.permanent DESC, Perso.nom ASC, Perso.prenom ASC';
				
	var $belongsTo = array('Statut' =>
		array('className'    => 'Statut',
			'conditions'   => '',
			'order'        => '',
			'foreignKey'   => 'statut_id'
			)
	);

	var $hasMany = array('MatieresPerso' =>
		array('className'    => 'MatieresPerso',
			'conditions'   => '',
			'order'        => 'h_cours DESC, h_td DESC, h_tp DESC',
			'foreignKey'   => 'perso_id',
			//'joinTable' => 'Matieres' 
		)
	);
	
	//var $hasOne = array('User');
	
	//var $hasAndBelongsToMany = array('Matieres');
	
	//var $hasOne = array('VuePersosBilanService');
	
	//var $validate = array(
		//'initiales'=>'alphaNumeric',
		//'nom'=>'alphaNumeric',
		//'prenom'=>'alphaNumeric'
	//);
	
	function getBilanService($id='all') {
		//return $this->getBilanServiceWithSqlView($id);
		return $this->getBilanServiceWithSqlQuery($id);
		//return "ToFix";
	}
	
	function getBilanServiceWithSqlView($id='all') {
		//  Méthode 1 : à l'aide d'une vue SQL dans la base
		$this->VuePersosBilanServices =& ClassRegistry::init('VuePersosBilanServices');
		$this->VuePersosBilanServices->recursive=-1;
		if($id=='all' or $id==null) {
			$temp = $this->VuePersosBilanServices->find('all');
			// ToDo : mettre en forme l'array pour avoir perso_id comme clé
			//$temp=Set::combine($temp, '{n}.VuePersosBilanServices.id', '{n}.VuePersosBilanServices.h_tp');
			$result=array();
			foreach ( $temp as $key => $matieresperso ) {
				//debug($result($matieresperso['VuePersosBilanServices']['id'])=1);
				//$result($matieresperso['VuePersosBilanServices']['id'])=$matieresperso['VuePersosBilanServices']['h_cours'];
				$result=Set::insert($result, $matieresperso['VuePersosBilanServices']['id'],
					array(	'h_cours'=>$matieresperso['VuePersosBilanServices']['h_cours'],
							'h_td'=>$matieresperso['VuePersosBilanServices']['h_td'],
							'h_tp'=>$matieresperso['VuePersosBilanServices']['h_tp']
							)
				);
			}
			return $result;			
			//return $temp;
		} else {
			$temp = $this->VuePersosBilanServices->read(null, $id);
			return $temp['VuePersosBilanServices'];
		}
	}
		
	function getBilanServiceWithLoop($id='all') {
		//  Méthode 2 : à l'aide d'une d'une boucle
		//ToDo

		$this->MatieresPerso =& ClassRegistry::init('MatieresPerso');
		$this->MatieresPerso->recursive=-1;

		if($id=='all' or $id==null) {
			$temp = $this->MatieresPerso->find('all');
			//$h = array('h_cours'=>0, 'h_td'=>0, 'h_tp'=>0);
			/*
			foreach ( $temp as $key => $matieresperso  ) {
				$h['h_cours'] = $h['h_cours'] + $matieresperso['MatieresPerso']['h_cours'];
				$h['h_td'] = $h['h_td'] + $matieresperso['MatieresPerso']['h_td'];
				$h['h_tp'] = $h['h_tp'] + $matieresperso['MatieresPerso']['h_tp'];				
			}
			return $result;
			*/
			//return $temp;
			// ToDo ToFix
			
			return "ToDo";
			
		} else {
			$temp = $this->MatieresPerso->find('all', array('conditions'=>array('perso_id' => $id)));
			$h = array('h_cours'=>0, 'h_td'=>0, 'h_tp'=>0);
			foreach ( $temp as $key => $matieresperso  ) {
				$h['h_cours'] = $h['h_cours'] + $matieresperso['MatieresPerso']['h_cours'];
				$h['h_td'] = $h['h_td'] + $matieresperso['MatieresPerso']['h_td'];
				$h['h_tp'] = $h['h_tp'] + $matieresperso['MatieresPerso']['h_tp'];				
			}
			return $h;
		}
	}

	function getBilanServiceWithSqlQuery($id='all') {
		//  Méthode 3 : à l'aide d'une requête SQL directe
		$prefix = $this->tablePrefix;
		if($id=='all' or $id==null) {
			$sql = "SELECT perso_id AS id, perso_id, SUM( h_cours ) AS h_cours, SUM( h_td ) AS h_td, SUM( h_tp ) AS h_tp FROM {$prefix}matieres_persos AS MatieresPerso GROUP BY perso_id";
			$result = $this->query($sql);
			$result = Set::combine ($result, '{n}.MatieresPerso.id', '{n}.0'); // Mise en forme l'array pour avoir perso_id comme clé
			return $result;
        } else {
			App::import('Sanitize');
			$id=Sanitize::paranoid($id); // use Sanitize for $id to avoid SQL injection
			$sql = "SELECT perso_id AS id, perso_id, SUM( h_cours ) AS h_cours, SUM( h_td ) AS h_td, SUM( h_tp ) AS h_tp FROM {$prefix}matieres_persos AS MatieresPerso WHERE perso_id=$id GROUP BY perso_id LIMIT 1";
			$result = $this->query($sql);
			if (!empty($result[0])) {
				//$result = Set::merge($result[0]["MatieresPerso"], $result[0][0]);
				//return $result;
				return $result[0][0];
			} else {
				return array('h_cours'=>0, 'h_td'=>0, 'h_tp'=>0);				
			}
		}
	}
}
?>