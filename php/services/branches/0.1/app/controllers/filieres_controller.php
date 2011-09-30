<?php
class FilieresController extends AppController {

	var $name = 'Filieres';
	var $helpers = array('Html', 'Form', 'Couleurs', 'Heures');
	
	var $components = array('Auth', 'Session', 'Acl');

	/*
	function beforeFilter() {
		parent::beforeFilter();
	}
	*/


	function index() {
		//debug($this->Auth->user());
		
		//if (!empty($this->data) && $this->Auth->user('id')) {
		$this->Filiere->recursive = 0;
		$this->set('filieres', $this->paginate());
		//}
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Filière invalide.', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Filiere->recursive = 2; // 1
		$filiere = $this->Filiere->read(null, $id);
		
		$matieres=$filiere['Matiere'];
		$this->Matiere =& ClassRegistry::init('Matiere');
		foreach ( $matieres as $key => $matiere ) {
			$filiere['Matiere'][$key]['vol_horaire_total']=$this->Matiere->get_vol_horaire($filiere['Matiere'][$key]['id']);
		}
				
		//$filiere['vol_horaire_total']['a_effectuer'] = $filiere['VueFilieresTotalBesoin'];
		//$filiere['vol_horaire_total']['attribue'] = $filiere['VueFilieresComblesBesoin'];
		//$filiere['vol_horaire_total']['restant'] = $filiere['VueFilieresRestantsBesoin'];

		$filiere['vol_horaire_total'] = $this->Filiere->get_vol_horaire($id);
		
		$this->set('filiere', $filiere);
		
	}

	function add() {
		if (!empty($this->data)) {
			$this->Filiere->create();
			if ($this->Filiere->save($this->data)) {
				$this->Session->setFlash(__('La filière a été sauvegardée.', true));
				$this->redirect(array('action'=>'index'));
			} else {
				$this->Session->setFlash(__('La filière n\'a pas pu être sauvegardée. Veuillez réessayer, merci.', true));
			}
		}
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Filière invalide.', true));
			$this->redirect(array('action'=>'index'));
		}
		if (!empty($this->data)) {
			if ($this->Filiere->save($this->data)) {
				$this->Session->setFlash(__('La filière a été sauvegardée.', true));
				$this->redirect(array('action'=>'index'));
			} else {
				$this->Session->setFlash(__('La filière n\'a pas pu être sauvegardée. Veuillez réessayer, merci.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Filiere->read(null, $id);
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Filière invalide.', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Filiere->del($id)) {
			$this->Session->setFlash(__('Filière supprimée', true));
			$this->redirect(array('action'=>'index'));
		}
	}
	
	/*
	function debug($id = null) {
		debug("<h1>debug($id)</h1>");
		
		debug("<h2>With SQL Views</h2>");
		$this->Filiere->recursive = 0;
		$filiere = $this->Filiere->read(null, $id);
		debug($filiere);

		debug("<h2>Without SQL Views</h2>");
		debug($this->Filiere->get_vol_horaire($id));
		
	}
	*/
	

}
?>
