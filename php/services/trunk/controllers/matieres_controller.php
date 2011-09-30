<?php
class MatieresController extends AppController {

	var $name = 'Matieres';
	var $helpers = array('Html', 'Form', 'Couleurs', 'Heures');

	var $components = array('Auth', 'Session');

	function index() {
		$this->Matiere->recursive = 0;
		$this->set('matieres', $this->paginate());
	}
	
	function view($id = null) {
		//echo $this->Matiere->test($id);
	
		if (!$id) {
			$this->Session->setFlash(__('Invalid Matiere.', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Matiere->recursive=0;
		$matiere = $this->Matiere->read(null, $id);
		//debug($matiere);
		$this->set('matiere', $matiere);

		$this->MatieresPerso =& ClassRegistry::init('MatieresPerso');
		$matieres_persos = $this->MatieresPerso->findByMatiere($id);
		//debug($matieres_persos);
		$this->set('matieres_persos', $matieres_persos);
		
        
		/* === Volume horaire total === */
		$this->set('vol_horaire_total', $this->Matiere->get_vol_horaire($id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->Matiere->create();
			if ($this->Matiere->save($this->data)) {
				$this->Session->setFlash(__('La matière a été sauvegardée', true));
				//$this->redirect(array('action'=>'index'));
				$this->redirect(array('controller'=>'filieres', 'action'=>'view', $this->data['Matiere']['filiere_id']));
			} else {
				$this->Session->setFlash(__('The Matiere could not be saved. Please, try again.', true));
			}
		}
		
		if (isset($this->passedArgs['filiere'])) {
			$this->data['Matiere']['filiere_id']=$this->passedArgs['filiere'];
		}
		
		$this->data['Matiere']['h_cours'] = 0;
		$this->data['Matiere']['h_td'] = 0;
		$this->data['Matiere']['h_tp'] = 0;
		
		$filieres = $this->Matiere->Filiere->find('list');
		$this->set(compact('filieres'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('id matière invalide', true));
			$this->redirect(array('action'=>'index'));
		}
		if (!empty($this->data)) {
			if ($this->Matiere->save($this->data)) {
				$this->Session->setFlash(__('La matière a été sauvegardée', true));
				//$this->redirect(array('action'=>'index'));
				$this->redirect(array('controller'=>'filieres', 'action'=>'view', $this->data['Matiere']['filiere_id']));
			} else {
				$this->Session->setFlash(__('La matière n\'a pas été sauvegardée. Veuillez réessayer, merci.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Matiere->read(null, $id);
		}
		$filieres = $this->Matiere->Filiere->find('list');
		$this->set(compact('filieres'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('id matière invalide', true));
			$this->redirect(array('action'=>'index'));
		}
		
		$this->Matiere->recursive=-1;
		$matiere = $this->Matiere->read(null, $id);

		if ($this->Matiere->del($id)) {
			$this->Session->setFlash(__('Matière supprimée', true));
			//$this->redirect(array('action'=>'index'));
			$this->redirect(array('controller'=>'filieres', 'action'=>'view', $matiere['Matiere']['filiere_id']));
		}
	}
		
	/*
	function debug() {
		//$id=53;
		$id='all';
		debug("<h1>get_vol_horaire_a_attribuer_with_sql_view($id)</h1>");
		debug($this->Matiere->get_vol_horaire_a_attribuer_with_sql_view($id));
		debug("<h1>get_vol_horaire_a_attribuer_with_sql_query($id)</h1>");
		debug($this->Matiere->get_vol_horaire_a_attribuer_with_sql_query($id));
		debug("<h1>get_vol_horaire_a_attribuer_with_loop($id)</h1>");
		debug($this->Matiere->get_vol_horaire_a_attribuer_with_loop($id));
		
		//debug("<h1>get_vol_horaire_attribue_with_sql_view($id)</h1>");
		//debug($this->Matiere->get_vol_horaire_attribue_with_sql_view($id));		


		//debug("<h1>get_vol_horaire_restant_with_sql_view($id)</h1>");
		//debug($this->Matiere->get_vol_horaire_restant_with_sql_view($id));				
	}
	*/
}
?>