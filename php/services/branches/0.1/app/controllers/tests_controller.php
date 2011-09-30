<?php 

	class TestsController extends AppController 
	{
		var $name = 'Tests';
		var $helpers = array('fpdf'); // this will use the pdf.php class
		
    	function viewpdf($id = null) {
    		//Configure::write('debug',0);
    	
	        $this->layout = 'pdf'; //this will use the pdf.ctp layout
    	    $this->render();
    	} 
	}

?>