<?php

class Complexe {
  public $reel;
  public $imag;
  function __construct($new_reel=0, $new_imag=0) {
    $this->reel=$new_reel;
    $this->imag=$new_imag;
  }
  function show() {
    echo $this->reel."+i*".$this->imag."\r\n";
  }

  function xmlSave($xmlfilename) {
    $dom = new domDocument();
/*
    $complexe = $dom->appendChild(new DOMElement('complexe'));
    $reel = $complexe->appendChild(new DOMElement('reel'));
    $imag = $complexe->appendChild(new DOMElement('imag'));
    $reel->nodeValue=1;
    $imag->nodeValue=2;
*/
    $complexe = $dom->CreateElement('complexe');
    $dom->appendChild($complexe);
    $reel=$dom->CreateElement('reel', 1);
    $imag=$dom->CreateElement('imag', 2);
    $complexe->appendChild($reel);
    $complexe->appendChild($imag);

// ToDo sérialisation XML

    print $dom->saveXML();
    $dom->save($xmlfilename);
  }

  function xmlLoad($xmlfilename) {

  }

  function xmlValidate($dtdfilename) {

  }

  function xmlTransform($xlsfilename) {

  }
}

$z = new Complexe(1,2);
//$z->reel=2;
//$z->imag=3;
$z->show();

// Création fichier XML
$z->xmlSave('complexe.xml');

// Validation fichier XML via DTD
/*
$document = new domDocument();
$document->load('complexe.xml');
//'complexe.dtd' // ToDo
$document->validate() or die("Le fichier XML n'est pas conforme.");
// création d'une DTD avec Cooktop
// http://www.xmlcooktop.com
*/

// Lecture fichier XML

$tree = new domDocument();
$tree->load('complexe.xml');
echo <<<EOF
L'élément racine est : {$tree->documentElement->nodeName},
il comporte {$tree->documentElement->childNodes->length} 
élément(s) fils.<br/>
EOF;

/*
function domExplore($node, $root=true) {
  if ($root) print "<ol>\n";
  print "<li> {$node->nodeName}<br/>\n";
  if ($node->childNodes->length) print "<ol>\n";
  for ($i=0;$i<$node->childNodes->length;$i++)
    domExplore($node->childNodes->item($i), false);
  if ($node->childNodes->length) print "</ol>\n";
  if ($root) print "</ol>\n";
}
domExplore($tree->documentElement);
*/

// Transformation XSLT (nécessite le paquet php5-xsl)
/*
// ToDo
$processeur = new XSLTProcessor();
$sytle = new domDocument();
$style->load('style.xsl');
$processeur->importStyleSheet($style);
print $processeur->transformToXML($document);
*/
?>
