<?php
class StatutsController extends AppController {

	var $name = 'Statuts';
	var $helpers = array('Html', 'Form', 'Boolean');

	var $components = array('Auth', 'Session');

	function index() {
		$this->Statut->recursive = 0;
		$this->set('statuts', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Statut invalide.', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->set('statut', $this->Statut->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->Statut->create();
			if ($this->Statut->save($this->data)) {
				$this->Session->setFlash(__('Le statut a été sauvegardé', true));
				$this->redirect(array('action'=>'index'));
			} else {
				$this->Session->setFlash(__('Le statut n\'a pas pu être sauvegardé. Veuillez réessayer, merci.', true));
			}
		}
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Statut invalide.', true));
			$this->redirect(array('action'=>'index'));
		}
		if (!empty($this->data)) {
			if ($this->Statut->save($this->data)) {
				$this->Session->setFlash(__('Le statut a été sauvegardé', true));
				$this->redirect(array('action'=>'index'));
			} else {
				$this->Session->setFlash(__('Le statut n\'a pas pu être sauvegardé. Veuillez réessayer, merci.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Statut->read(null, $id);
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Statut invalide.', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Statut->del($id)) {
			$this->Session->setFlash(__('Statut supprimé', true));
			$this->redirect(array('action'=>'index'));
		}
	}

}
?>