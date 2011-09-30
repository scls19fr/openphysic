<?php 
/* SVN FILE: $Id$ */
/* EnseignantsStagesController Test cases generated on: 2009-08-09 17:08:47 : 1249833467*/
App::import('Controller', 'EnseignantsStages');

class TestEnseignantsStages extends EnseignantsStagesController {
	var $autoRender = false;
}

class EnseignantsStagesControllerTest extends CakeTestCase {
	var $EnseignantsStages = null;

	function startTest() {
		$this->EnseignantsStages = new TestEnseignantsStages();
		$this->EnseignantsStages->constructClasses();
	}

	function testEnseignantsStagesControllerInstance() {
		$this->assertTrue(is_a($this->EnseignantsStages, 'EnseignantsStagesController'));
	}

	function endTest() {
		unset($this->EnseignantsStages);
	}
}
?>