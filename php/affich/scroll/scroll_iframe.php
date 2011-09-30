<html>
  <head>
    <title>Scroll an iframe</title>
    <script language="javascript" src="autoscroll.js"></script>
  </head>

<!--
<frameset rows="100%" >
  <frame src="content.php" name="main">
</frameset>
-->

<?php
  $src="content.php";

  /* Pb si domaine différent - same origin policy (SOP) */
  //$src="http://www.celles.net/php/content.php"; // XSS !! Javascript cross-domain !!!
/*
http://developer.yahoo.com/javascript/howto-proxy.html
    <script type="text/javascript">
      document.domain="celles.net";
    </script>
http://blog.pascal-martin.fr/post/Requete-Ajax-Cross-domain-proxy

libapache2-mod-proxy : 
 */
?>

  <body onLoad="pageScroll(document.getElementById('mydata').contentDocument, window.frames['mydataname'])">
  <!-- <body onLoad="pageScroll(document.getElementById('mydata').contentDocument.body, window.frames.getElementById('mydata'))"> -->

    <!-- <h1 onclick="debug()">iFrame</h1> -->

    <iframe id="mydata" name="mydataname" src="<?php echo $src; ?>" height="100%" width="100%" frameborder="0"> -->
    <!-- <iframe id="mydata" name="mydata" src="http://www.rfc-editor.org/rfc/rfc2606.txt" height="100%" width="100%" frameborder="0"> -->
      Alternative text for browsers that do not understand IFrames.
    </iframe>




  </body>

</html>
