<html>
  <head>
    <title>Title</title>
  </head>
  <body>
    <h1>Page 2</h1>
<?php
echo date(DATE_RFC822);

echo "<br>";

$param1 = $_GET['param1'];

  if ($param1==1) {
echo "OK ! param1 est bien pass&eacute; !";
  } else {
echo "Erreur param1 $param1 n'est pas passé<br>\n";
  }

?>
  </body>
</html>
