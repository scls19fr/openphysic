<?php
App::import('Vendor','xtcpdf'); 
$tcpdf = new XTCPDF();
$textfont = 'freesans'; // looks better, finer, and more condensed than 'dejavusans'

$tcpdf->SetAuthor("Sebastien Celles - http://www.celles.net");
$tcpdf->SetAutoPageBreak( false );
$tcpdf->setHeaderFont(array($textfont,'',20));
$tcpdf->xheadercolor = array(150,0,0);

$tcpdf->xheadertext = 'Gestion prévisionnelle des services';
//$tcpdf->xheadertext = 'celles.net';
$tcpdf->xfootertext = 'celles.net - CakePHP Powered';

// Now you position and print your page content
// example: 
$tcpdf->SetTextColor(0, 0, 0);
$tcpdf->SetFont($textfont,'B',20);
$tcpdf->Cell(0,14, "Hello World", 0,1,'L');
// ...
// etc.
// see the TCPDF examples 

echo $tcpdf->Output('persos_bilan.pdf', 'D');

?>