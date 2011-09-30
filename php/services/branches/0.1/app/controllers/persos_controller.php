<?php
class PersosController extends AppController {

	var $name = 'Persos';
	var $helpers = array('Html', 'Form', 'Heures', 'Boolean');
	
	//var $scaffold;
	
	var $components = array('Auth', 'Session');
	
	function index() {
		$this->Perso->recursive = 0;
		$persos =  $this->paginate();
		
		$bilanservice=$this->Perso->getBilanService('all');
		
		foreach($persos as $key => $perso) {
			$id=$perso['Perso']['id'];
			if (!empty($bilanservice[$id])) {
				$persos[$key]['BilanService']=$bilanservice[$id];
			} else {
				$persos[$key]['BilanService']=array('h_cours'=>0, 'h_td'=>0, 'h_tp'=>0);
			}
		}

		
		$this->set('persos', $persos);
	}
        
	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Personnel inexistant.', true));
			$this->redirect(array('action'=>'index'));
		}		

		$this->Perso->recursive = 0;
		$perso = $this->Perso->read(null, $id);
		$perso['BilanService'] = $this->Perso->getBilanService($id);
		$this->set('perso', $perso);
		
		$this->MatieresPerso =& ClassRegistry::init('MatieresPerso');
		$matieres_persos = $this->MatieresPerso->findByPerso($id);
		
        $this->Filiere =& ClassRegistry::init('Filiere');
		foreach($matieres_persos as $key=>$matieres_perso) {
			$this->Filiere->recursive = -1;
			$filiere = $this->Filiere->read(null, $matieres_persos[$key]['Matiere']['filiere_id']);
			$matieres_persos[$key]['Filiere'] = $filiere['Filiere'];
		}
		
		$this->set('matieres_persos', $matieres_persos);        
	}

	function add() {
		if (!empty($this->data)) {
			$this->Perso->create();
			if ($this->Perso->save($this->data)) {
				$this->Session->setFlash(__('Le personnel a été sauvegardé', true));
				$this->redirect(array('action'=>'index'));
			} else {
				$this->Session->setFlash(__('Le personnel n\'a pas pus être sauvegardé. Veuillez réessayer, merci.', true));
			}
		}
		$statuts = $this->Perso->Statut->find('list');
		$this->set(compact('statuts'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Personnel inexistant.', true));
			$this->redirect(array('action'=>'index'));
		}
		if (!empty($this->data)) {
			if ($this->Perso->save($this->data)) {
				$this->Session->setFlash(__('Le personnel a été sauvegardé', true));
				$this->redirect(array('action'=>'index'));
			} else {
				$this->Session->setFlash(__('Le personnel n\'a pas pus être sauvegardé. Veuillez réessayer, merci.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Perso->read(null, $id);
		}
		$statuts = $this->Perso->Statut->find('list');
		$this->set(compact('statuts'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Personnel inexistant.', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Perso->del($id)) {
			$this->Session->setFlash(__('Personnel supprimé', true));
			$this->redirect(array('action'=>'index'));
		}
	}
	
	/*
	function debug() {
		//debug($this->Perso->getBilanService(16));
		//debug($this->Perso->getBilanService());
		//debug($this->Perso->getBilanService('all'));
		//debug($this->Perso->getBilanService(null));
		
		$id=16;
		debug("<h1>getBilanServiceWithSqlView($id)</h1>");
		debug($this->Perso->getBilanServiceWithSqlView($id));
		debug("<h1>getBilanServiceWithSqlQuery($id)</h1>");
		debug($this->Perso->getBilanServiceWithSqlQuery($id));
		debug("<h1>getBilanServiceWithLoop($id)</h1>");
		debug($this->Perso->getBilanServiceWithLoop($id));
		
		debug("<h1>getBilanServiceWithSqlView('all')</h1>");
		debug($this->Perso->getBilanServiceWithSqlView('all'));
		debug("<h1>getBilanServiceWithSqlQuery('all')</h1>");
		debug($this->Perso->getBilanServiceWithSqlQuery('all'));
		debug("<h1>getBilanServiceWithLoop('all')</h1>");
		debug($this->Perso->getBilanServiceWithLoop('all'));

		//exit();
	}
	*/
	
	function bilan() {
		$this->Perso->recursive = 1;
				
		$this->Matiere =& ClassRegistry::init('Matiere');
		$this->Matiere->recursive = 0;
		//$this->Matiere->unbindModel( array( 'hasMany'=>array() ) );
		
		$persos =  $this->Perso->find('all');
		
		$bilanservice=$this->Perso->getBilanService('all');
		
		foreach($persos as $key => $perso) {
			$id=$perso['Perso']['id'];
			
			if (!empty($bilanservice[$id])) {
				$persos[$key]['BilanService']=$bilanservice[$id];
			} else {
				$persos[$key]['BilanService']=array('h_cours'=>0, 'h_td'=>0, 'h_tp'=>0);
			}
			
			foreach($persos[$key]['MatieresPerso'] as $key_matieresperso => $matieresperso) {
				$persos[$key]['MatieresPerso'][$key_matieresperso]['Matiere'] = $this->Matiere->read(null, $matieresperso['matiere_id']) ; //'x';
			}
			
		}
		
		$this->set('persos', $persos);

		Configure::write('debug',0);
		
		$this->layout = 'print';
    	$this->render();
	}
	
	function bilanPdf() {	    	
		$this->layout = 'pdf';
    	$this->render();
    	
	    //$this->redirect(array('action'=>'bilan'));
	}

}
?>