<?php
class UsersController extends AppController {

	var $name = 'Users';
	var $helpers = array('Html', 'Form');


	var $components = array('Auth', 'Session');
	
	/*
	function beforeFilter() {
		//$this->Auth->allow('login', 'logout');

		//$this->Auth->loginRedirect = array('controller' => 'filieres', 'action' => 'index');		
		//$this->Auth->logoutRedirect  = array('controller' => 'users', 'action' => 'login');
	}
	*/

	function login() {
	}
	
	function logout() {
		$this->Session->setFlash('Au revoir !'); 
		$this->redirect($this->Auth->logout());
	}
	

	function index() {
		$this->User->recursive = 0;
		$this->set('users', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid User.', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->set('user', $this->User->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			if ( $this->data['User']['password'] /* confirm password */
				== $this->Auth->password($this->data['User']['password2']) ) {
				if ( !$this->User->findByUsername($this->data['User']['username']) ) { /* unique username */
					$this->User->create();
					if ($this->User->save($this->data)) {
						$this->Session->setFlash(__('The User has been saved', true));
						$this->redirect(array('action'=>'index'));
					} else {
						$this->Session->setFlash(__('The User could not be saved. Please, try again.', true));
					}
				} else {
					$this->Session->setFlash(__('username already in use.', true));
				}	
			} else {
				$this->Session->setFlash(__('The password wasn\'t confirmed correctly.', true));
			}
		}
		$this->data['User']['password'] = '';
		$this->data['User']['password2'] = '';
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid User', true));
			$this->redirect(array('action'=>'index'));
		}
		if (!empty($this->data)) {
			if ( $this->data['User']['password'] /* confirm password */
				== $this->Auth->password($this->data['User']['password2']) ) {
				if ( !$this->User->findByUsername($this->data['User']['username']) ) { /* unique username */
					if ($this->User->save($this->data)) {
						$this->Session->setFlash(__('The User has been saved', true));
						$this->redirect(array('action'=>'index'));
					} else {
						$this->Session->setFlash(__('The User could not be saved. Please, try again.', true));
					}
				} else {
					$this->Session->setFlash(__('username already in use.', true));				
				}
			} else {
				$this->Session->setFlash(__('The password wasn\'t confirmed correctly.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->User->read(null, $id);
		}

		$this->data['User']['password'] = '';
		$this->data['User']['password2'] = '';
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for User', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->User->del($id)) {
			$this->Session->setFlash(__('User deleted', true));
			$this->redirect(array('action'=>'index'));
		}
	}

}
?>