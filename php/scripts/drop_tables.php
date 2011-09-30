<?php 
// This script will make DROP queries for getting rid of tables that HAVE THE SAME PREFIX SPECIFIED
// (i.e. PHP-Nuke's tables nuke_*). This makes it easy to clean up your database after
// you remove such programs.
//
// Syntax http://www.yourserver.com/drop_tables.php?prefix="table_prefix"
//
// Created by Paul Ellis with code from www.php.net. http://www.ellisfoundation.com/freemusic/
// Modified by Brian Simecek - Handled some exceptions, and actually performed drop tables with status messages.

// http://www.celles.net/php/drop_tables.php?prefix=test_

$active = true; // true=actif false=inactif

if (!$active) {
	print '<div style="color: #FF0000;">Script inactif</div>';
	exit;
}

$dbhost = 'XXXXX';
$dbuser = 'XXXXX';
$dbpass = 'XXXXX'; 
$dbname = 'XXXXX';

$db = mysql_connect($dbhost, $dbuser, $dbpass);
if (!$db) {
    print 'Could not connect to mysql';
    exit;
}

$result = mysql_list_tables($dbname);

if (!$result) {
    print "DB Error, could not list tables\n";
    print 'MySQL Error: ' . mysql_error();
    exit;
}

if ($_GET['prefix'] == null) {
    print "<b>TABLE LIST ($dbname):</b><br>";
    
    while ($row = mysql_fetch_row($result)) {
        print "$row[0]<br>";
    }
    print "<br><b>Syntax to drop multiple tables by prefix is 'drop_tables.php?prefix=prefix_that_the_tables_have</b>";
    } else {
    
    
    while ($row = mysql_fetch_row($result)) {
        if (substr($row[0], 0, strlen($_GET['prefix'])) == $_GET['prefix']) {
            
            $tablesucess = "1";
            
            $tablename = $row[0];
            $query = "DROP TABLE " . $tablename;
            
            $status = mysql_query("$query");
            print "DROP TABLE $row[0]";
            
            if ($status)
            {
                $status = "Success";
            }
            
            if (!$status)
            {
                die(mysql_error());
                $status = "Failure";
            }
            
            print "<b>   ...   " . $status . "</b><br>";
            
            
        }
    }
}


if (!$tablesucess)
{
    if ($row[0] == "")
    {
        print "<b>Prefix Does Not Match Any Tables Within Table $dbname.</b><br>";
        die();
    }
}

mysql_free_result($result);
?>