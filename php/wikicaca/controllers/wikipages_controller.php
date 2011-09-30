<?php
class WikipagesController extends AppController {

	var $name = 'Wikipages';
	var $components = array('Wiki');
	var $helpers = array('Html', 'Form'); //, 'Wiki'); //

	function index() {
		$this->Wikipage->recursive = 0;
		$this->set('wikipages', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid Wikipage.', true));
			$this->redirect(array('action'=>'index'));
		}
		$wikipage = $this->Wikipage->read(null, $id);
		
		$wikipage['Wikipage']['bodyRendered'] = $this->Wiki->render($wikipage['Wikipage']['body']);
		$this->set('wikipage', $wikipage);
	}
	
	function viewByName($pagename = "HomePage") {
		/*
		$wikipage = $this->Wikipage->find('all',
			array(
				'conditions' => array('name'=>$pagename),
				'order' => 'modified DESC',
				'limit' => '1'
			)
		);
		$this->view($wikipage['0']['Wikipage']['id']);
		*/
		
		$id = $this->Wikipage->findLatestByName($pagename);
		if ( $id!=null) {
			$this->view($id);
		} else {
			$this->editByName($pagename);
		}
		
	}
	
	function editByName($pagename = "HomePage") {
		debug("ToDo");
	}

	/*
	function addByName($pagename = "HomePage") {
		
	}
	*/

	
// viewByName/HomePage

	function add() {
		if (!empty($this->data)) {
			$this->Wikipage->create();
			if ($this->Wikipage->save($this->data)) {
				$this->Session->setFlash(__('The Wikipage has been saved', true));
				$this->redirect(array('action'=>'index'));
			} else {
				$this->Session->setFlash(__('The Wikipage could not be saved. Please, try again.', true));
			}
		}
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid Wikipage', true));
			$this->redirect(array('action'=>'index'));
		}
		if (!empty($this->data)) {
			if ($this->Wikipage->save($this->data)) {
				$this->Session->setFlash(__('The Wikipage has been saved', true));
				$this->redirect(array('action'=>'index'));
			} else {
				$this->Session->setFlash(__('The Wikipage could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Wikipage->read(null, $id);
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for Wikipage', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Wikipage->del($id)) {
			$this->Session->setFlash(__('Wikipage deleted', true));
			$this->redirect(array('action'=>'index'));
		}
	}

}
?>