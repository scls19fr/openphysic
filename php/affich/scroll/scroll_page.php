<html>

<head>
  <title>Scroll</title>
  <script language="javascript" src="autoscroll.js"></script>
  <script language="javascript">
    document.onload=pageScroll(document, window);
  </script>
  
</head>

<body>
<!-- <body onLoad="pageScroll(document, window)"> -->
<!-- <body onLoad="pageScroll()"> -->
<h1>Scroll</h1>
<?php
$str="Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nulla metus velit, lobortis a, tincidunt vitae, bibendum tincidunt, eros. In eget orci aliquam eros tristique feugiat. Vestibulum feugiat vehicula enim. Aenean bibendum ipsum in enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec pharetra mi non odio. Integer orci nisl, placerat non, adipiscing et, congue non, velit. Integer ipsum. Duis ac ipsum at eros egestas aliquam. Praesent quis sem et justo rutrum tincidunt. Morbi mattis pretium urna. Pellentesque eget orci auctor libero tristique condimentum. ";
for ($i==0 ; $i<9 ; $i++) {
  echo $str;
}
echo "\n";
?>

<!--
<script language="javascript">
obj=document.body;
</script>
-->

</body>

</html>
