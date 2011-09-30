<?php
class User extends AppModel {
	var $name = 'User';
	
	//var $belongsTo = array('Group');
	var $belongsTo = array('Group', 'Perso');
	
	//var $hasOne = array('Perso');

	var $actsAs = array('Acl' => 'requester');
	//var $actsAs = array('Acl');

	function parentNode() {
		//return null;

		if (!$this->id && empty($this->data)) {
			return null;
		}
		$data = $this->data;
		if (empty($this->data)) {
			$data = $this->read();
		}
		if (!$data['User']['group_id']) {
			return null;
		} else {
			return array('Group' => array('id' => $data['User']['group_id']));
		}
	}

	function bindNode($object) {
		return array(
			'model' => 'Group',
			'foreign_key' => $object['User']['group_id']
		);
	}

}
?>
