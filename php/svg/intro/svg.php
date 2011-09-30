<?echo '<'.'?xml version="1.0" encoding="iso-8859-1" ?'.'>'?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.0//EN"
 "http://www.w3.org/TR/2001/REC-SVG20010904/DTD/svg10.dtd">
<svg width="600" height="600">
<defs>
<path id="trace" d="M 100 200 C 50 100 300   0 300 200"/>
</defs>
<use xlink:href="#trace" fill="none" stroke="red"  />
<text font-family="Verdana" font-size="42.5" fill="#4b74ac" >
<textPath xlink:href="#trace">
<?echo @$_GET["message"]?>
</textPath>
</text>
</svg>