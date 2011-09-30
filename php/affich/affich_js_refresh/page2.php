<html>
  <head>
    <title>Title</title>
  </head>
  <body>
    <h1>Page 2</h1>
<?php
$param1 = $_GET['param1'];

  if ($param1==1) {
echo "OK ! param1 est bien passé !";
  } else {
echo "Erreur param1 $param1 n'est pas passé<br>\n";
  }
?>
  </body>
</html>
