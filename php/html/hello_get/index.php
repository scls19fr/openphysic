<?php
$name=htmlentities($_GET['name'], ENT_QUOTES);
// addslashes
// htmlentities
$date=date(DATE_RFC822);

echo "<html>
  <head>
    <title>www.celles.net</title>
  </head>
  <body>
    <h1>Hello $name ! this site is not in your domain !</h1>
$date
  </body>
</html>"
?>
