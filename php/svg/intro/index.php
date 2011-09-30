<html>
<head>
<title></title>
</head>
<body>
<form>
<input type=text name=mes maxlength=12><br>
<input type=submit value="Générer le SVG">
</form>
<embed src="svg.php?message=<? echo @$_GET["mes"]?>" 
width="600" height="600" type="image/svg+xml">
</body>
</html>