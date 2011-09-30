<?php

if( !extension_loaded('gtk')) {	
    dl( 'php_gtk.' . PHP_SHLIB_SUFFIX); 
}

function delete_event()
{
    return false;
}

function shutdown()
{
    print("Shutting down...\n");
    gtk::main_quit();
}

function hello()
{
    global $window;
    print "Hello World!\n";
    $window->destroy();
}

$window = &new GtkWindow();
$window->connect('destroy', 'shutdown');
$window->connect('delete-event', 'delete_event');
$window->set_border_width(10);

$button = &new GtkButton('Hello World!');
$button->connect('clicked', 'hello');
$window->add($button);

$window->show_all();

gtk::main();

?>