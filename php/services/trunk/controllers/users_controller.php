<?php
class UsersController extends AppController {

	var $name = 'Users';
	var $helpers = array('Html', 'Form', 'Formx', 'Password', 'People');
	var $components = array('Acl', 'Auth', 'Session');
	
	/*
	function beforeFilter() {
        // Login failed. Invalid username or password.
		//$this->Auth->loginError = 'Connexion échouée. Nom d\'utilisateur ou mot de passe incorrect.';
		// You are not authorized to access that location.
		//$this->Auth->authError = 'Vous n\'&ecirc;tes pas autorisé à accéder à cette page.';

		//$this->Auth->allow('*','about');

		//$this->Auth->allow('login');
		
		$this->Auth->allow('login', 'logout');

		$this->Auth->loginRedirect = array('controller' => 'filieres', 'action' => 'index');
		//$this->Auth->loginRedirect = array('controller' => 'persos', 'action' => 'view', 16); // vers fiche de service
		
		$this->Auth->logoutRedirect  = array('controller' => 'users', 'action' => 'login');
		

	}
	*/
	
	function beforeFilter() {
		parent::beforeFilter();
		$this->Auth->allow('logout', 'login');
	} 

	function login() {
	}
	
	function logout() {
		$this->Session->setFlash('Au revoir !'); 

		$this->redirect($this->Auth->logout());
	}
	
	/* fonction pour calculer le hash d'un mot de passe */
	/* attention le hash dépend du sel défini dans app/config/core.php */
	/* http://localhost:8888/services/users/pwd/ */
	/* admin/admin user/user */
	/*
	function pwd($p=null) {
		debug($this->Auth->password($p));
	}
	*/

	function index() {
		$this->User->recursive = 0;
		$this->set('users', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Utilisateur invalide.', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->User->recursive = 0;
		$user=$this->User->read(null, $id);
		$this->set('user', $user);
	}

	function add() {
		if (!empty($this->data)) {
			if ( $this->data['User']['password']==$this->Auth->password($this->data['User']['password2']) ) {
				$this->User->create();
				if ($this->User->save($this->data)) {
					$this->Session->setFlash(__('L\'utilisateur a été sauvegardé', true));
					$this->redirect(array('action'=>'index'));
				} else {
					$this->Session->setFlash(__('L\'utilisateur n\'a pas pu être sauvegardé. Veuillez réessayer, merci.', true));
				}
			} else {
				$this->Session->setFlash(__('Le mot de passe n\'a pas été confirmé correctement.', true));
				$this->data['User']['password'] = '';
				$this->data['User']['password2'] = '';
			}
		} else {
			$this->data['User']['perso_id'] = 0;
		}
		
		$groups = $this->User->Group->find('list');
		$this->set(compact('groups'));
	}
	
	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Utilisateur invalide.', true));
			$this->redirect(array('action'=>'index'));
		}
		if (!empty($this->data)) {
			if ( $this->data['User']['password']==$this->Auth->password($this->data['User']['password2']) ) {
				$this->User->create();
				if ($this->User->save($this->data)) {
					$this->Session->setFlash(__('L\'utilisateur a été sauvegardé', true));
					$this->redirect(array('action'=>'view', $id));
				} else {
					$this->Session->setFlash(__('L\'utilisateur n\'a pas pu être sauvegardé. Veuillez réessayer, merci.', true));
				}
			} else {
				$this->Session->setFlash(__('Le mot de passe n\'a pas été confirmé correctement.', true));
				$this->redirect(array('action'=>'edit', $id));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->User->read(null, $id);
		}

		$this->data['User']['password'] = '';
		$this->data['User']['password2'] = '';
		
		$groups = $this->User->Group->find('list');
		$this->set(compact('groups'));
	}
	
	function change_password($id = null) { // attention il faut préciser dans la vue $form->create('User', array('action' => 'change_password'))
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Utilisateur invalide.', true));
			$this->redirect(array('action'=>'index'));
		}
		if (!empty($this->data)) {
			if ( $this->data['User']['password']==$this->data['User']['password2'] ) {
				$this->data['User']['password'] = Security::hash($this->data['User']['password'], null, true);
				//$this->User->create();
				if ($this->User->saveField('password', $this->data['User']['password'])) {
					$this->Session->setFlash(__('Le mot de passe utilisateur a été sauvegardé', true));
					$this->redirect(array('action'=>'view', $id));
				} else {
					$this->Session->setFlash(__('Le mot de passe n\'a pas pu être sauvegardé. Veuillez réessayer, merci.', true));
				}
			} else {
				$this->Session->setFlash(__('Le mot de passe n\'a pas été confirmé correctement.', true));
				$this->redirect(array('action'=>'change_password', $id));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->User->read(null, $id);
		}

		$this->data['User']['password'] = '';
		$this->data['User']['password2'] = '';
		
		$groups = $this->User->Group->find('list');
		$this->set(compact('groups'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Utilisateur invalide.', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->User->del($id)) {
			$this->Session->setFlash(__('Utilisateur supprimé', true));
			$this->redirect(array('action'=>'index'));
		}
	}
	
	function reset_password($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Utilisateur invalide.', true));
			$this->redirect(array('action'=>'index'));
		}

		//$this->User->set(array());
		//$this->User->create();
		$this->User->recursive = -1;
		$user=$this->User->read(null, $id);
		
		$password = '123';

		//$user['User']['password']=$password;
		//$user=$this->Auth->hashPasswords($user); // necessite un champ username et un champ password pour que la 'magie' de CakePHP fonctionne
		
		$h_password = Security::hash('123', null, true);
		//$user['User']['password'] = $h_password;


		//if ( $this->User->save($user) ) {
		if ( $this->User->saveField('password', $h_password) ) {
			$this->Session->setFlash(__(sprintf("Mot de passe initialisé à '%s'. Merci de le modifier.", $password), true));
		} else {
			$this->Session->setFlash(__('Le mot de passe n\'a pas été modifié', true));		
		}

		$this->redirect(array('action'=>'view', $id));		
	}





	function initDB() {
		$group =& $this->User->Group;
		
		// Allow admins to everything
		//$group->id = 4;
		//$this->Acl->allow($group, 'controllers'); // syntaxe sans alias
		$this->Acl->allow('administrateurs', 'controllers'); // syntaxe avec alias

		// Allow users to do nothing
		//$group->id = 5; // syntaxe sans alias
		$group = 'utilisateurs'; // syntaxe avec alias
		$this->Acl->deny($group, 'controllers'); // deny all
		//     except...
		$this->Acl->allow($group, 'controllers/Pages'); // static pages : home about ...

		$this->Acl->allow($group, 'controllers/Users/login'); // login logout change_password reset_password
		$this->Acl->allow($group, 'controllers/Users/logout'); // login logout change_password reset_password
		$this->Acl->allow($group, 'controllers/Users/change_password'); // login logout change_password reset_password
		$this->Acl->allow($group, 'controllers/Users/reset_password'); // login logout change_password reset_password
		$this->Acl->allow($group, 'controllers/Users/view'); // login logout change_password reset_password

		$this->Acl->allow($group, 'controllers/Persos');

	}


}
?>
