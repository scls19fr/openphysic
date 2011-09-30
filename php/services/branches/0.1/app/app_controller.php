<?php
class AppController extends Controller {
	var $components = array('Acl', 'Auth', 'Session');
	
	function beforeFilter() {
		//$this->Auth->allow(''); // ToFix
		
		//debug("beforeFilter");
		//exit();
		
		//$this->Auth->authorize = 'controller'; // isAuthorized()
		$this->Auth->authorize = 'actions'; // ACL : ARO ACO ARO_ACO
		
		$this->Auth->loginAction = array('controller'=>'users','action'=>'login');
        	//$this->Auth->logoutRedirect = array('controller' => 'users', 'action' => 'logout');
        	$this->Auth->loginRedirect = array('controller' => 'filieres', 'action' => 'index');
        	$this->Auth->autoRedirect = true;

		//$this->Auth->recursive = 0;
		//$loggeduser = $this->Auth->user();

		//debug($this->Auth);

		$id = $this->Auth->user('id');
		$this->set('loggedIn', $id);

		//debug($this->Auth);

		//$this->User =& ClassRegistry::init('User');
		//$this->User->recursive = 0;
		//$loggeduser = $this->User->read(null, $id);

		//$this->LoggedUser =& ClassRegistry::init('User');
		//$this->LoggedUser->recursive = 0;
		//$loggeduser = $this->LoggedUser->read(null, $id);

		//$loggeduser=$this->Auth->user();
		//debug($this->Auth->user('group_id'));
		//$loggeduser['Group']['name']="toto";

		$this->User =& ClassRegistry::init('User');
		$loggeduser = $this->User->findById($id);

		//debug($loggeduser);

		$this->set('loggeduser', $loggeduser);

		$this->Auth->actionPath = 'controllers/';

	}
}
?>
