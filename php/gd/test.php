<?php
if (function_exists('imagecolorallocate')) {
    print "GD OK... ";
    if (function_exists('imageantialias')) {
        print "avec anti-aliasing!\n";
    } else {
        print "sans anti-aliasing!\n";
    }
} else {
    print "GD absent!\n";
}
?>
