<?php
if( !extension_loaded('gtk')) {	
    dl( 'php_gtk.' . PHP_SHLIB_SUFFIX);
}

$fdnd = new FileDragNDrop();
$fdnd->buildDialog();
$fdnd->display();

class FileDragNDrop
{
    function buildDialog() {
        $this->window =& new GtkWindow();
        $this->window->set_title('FileDropper');
        $this->window->set_default_size(200, 200);
        $this->window->connect_object('destroy', array('gtk', 'main_quit'));
       
        $scrolledwindow =& new GtkScrolledWindow();
        $scrolledwindow->set_policy(GTK_POLICY_AUTOMATIC, GTK_POLICY_AUTOMATIC);
        $this->window->add($scrolledwindow); 
        
        $this->tree =& new GtkCTree(3, 0, array('title', 'url', 'local path'));
        $scrolledwindow->add($this->tree);
        
        $this->ndToplevel = $this->tree->insert_node(null, null, array('Files', '', ''), 0, null, null, null, null, false, true);
        
        $this->tree->connect('key-press-event', array(&$this, 'keyPressedTree'));
    }
    
    
    function display() {
        $this->window->show_all();
        gtk::main();
    }
    
    function keyPressedTree($tree, $objEvent) {
        if ($objEvent->keyval == GDK_KEY_Delete) {
            $ar =  $tree->selection;
            foreach ($ar as $objNode) {
                $tree->remove_node($objNode);
            }
        }
    }
}
?>