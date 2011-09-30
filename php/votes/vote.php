<?php

//require_once('config.php');

/**
 * Définition de la classe Vote
 */
class Vote {
  //public $id;

  //public $choix = array('Abstention','D&eacute;favorable','R&eacute;serv&eacute;','Assez favorable','Favorable','Tr&egrave;s favorable');
  public $choix = array('Abstention','Défavorable','Réservé','Assez favorable','Favorable','Très favorable');
  public $resultats; // liste comportant les résultats d'un vote
  public $nb_choix; // nb de choix ( = sizeof($choix) )

  private $nb_votes; // nb de votes (y compris les abstentions/nuls explicites)
  private $nb_votants; // nb de votants
  // le nb d'absentions réel est le nb d'absentions explicites + nb_votants-nb_votes

  public function nouveau() {
    $this->nb_choix = sizeof($this->choix);
    for ($i=0 ; $i<$this->nb_choix ; $i++) {
      $this->resultats[$i]=0;
    }
  }

  public function voter($avis) {
    $this->resultats[$avis]++;
    $this->nb_votes++;
  }

  private function moyenne() {
    $somme = 0;
    $nb = 0;
    for ($i=1 ; $i<$this->nb_choix ; $i++) { // $i=1 car on ne compte pas les absentions
      $somme = $somme + $this->resultats[$i]*$i;
      $nb = $nb + $this->resultats[$i];
    }
    if ($nb<>0) {
      return $somme/$nb;
    } else {
      return 0;
    }
  }

  private function moyenne_arrondie() {
    return round($this->moyenne());
  }

  private function choix_moyen() {
    return $this->choix[round($this->moyenne())];
  }

  private function afficher_resultats_table() {
    print '<table border="1">'."\r\n";
    print '  <tr>'."\r\n";
    for ($i=0 ; $i<$this->nb_choix ; $i++) {
       print "    <th align=\"center\">".htmlentities($this->choix[$i])."</th>"."\r\n";
    }
    print '  </tr>'."\r\n";
    print '  <tr>'."\r\n";
    for ($i=0 ; $i<$this->nb_choix ; $i++) {
       print "    <td align=\"center\">".$this->resultats[$i]."</td>"."\r\n";
    }
    print '  </tr>'."\r\n";
    print '</table>'."\r\n";

    print "Moyenne : ".$this->moyenne()."\r\n";
    print "Moyenne arrondie : ".$this->moyenne_arrondie()."\r\n";
    print "Avis moyen : ".$this->choix_moyen()."\r\n";
  }

  private function afficher_resultats_graph() {
    //print "graph";
    /* Graphique avec GD2 */
        $max = 1;
        for ($i=0;$i<$this->nb_choix;$i++){
          if ($this->resultats[$i] > $max)$max=$this->resultats[$i];  // find the largest data
        }
	$width=640;
	$height=255;
	$margeX=10;
        $im = imagecreate($width,$height); // width , height px

        $white = imagecolorallocate($im,255,255,255); // allocate some color from RGB components remeber Physics
        $black = imagecolorallocate($im,0,0,0);   //
        $red = imagecolorallocate($im,255,0,0);   //
        $green = imagecolorallocate($im,0,255,0); //
        $blue = imagecolorallocate($im,0,0,255);  //
        //
        // create background box
        //imagerectangle($im, 1, 1, 319, 239, $black);
        //draw X, Y Co-Ordinate
        imageline($im, 10, 5, 10, 230, $blue );
        imageline($im, $margeX, 230, $width-$margeX, 230, $blue );
        //Print X, Y
        imagestring($im,3,15,5,"Résultats",$black);

        // what next draw the bars
        $x1 = $margeX;    // bar x1 position
        $y = 230;    // bar $y1 position
        $x_width = 100;  // width of bars
        $y_ht = 0; // height of bars, will be calculated later
        // get into some meat now, cheese for vegetarians;
	$x=$x1;
	$xdiff = 0; // diff between two bars;
        for ($i=0;$i<$this->nb_choix;$i++){
          $y_ht = ($this->resultats[$i]/$max)* 200;    // no validation so check if $max = 0 later;
          imagerectangle($im,$x,$y,$x+$x_width,($y-$y_ht),$red);
          imagestring( $im,2,$x+5,$y+1,$this->choix[$i],$black);
          imagestring( $im,2,$x-1+$x_width/2,$y+10,$this->resultats[$i],$black);
          $x += ($x_width+$xdiff);   
        }
	$moy = $this->moyenne();
	//$moy=5;
	$x=$moy*($x_width+$xdiff)+$x1+$x_width/2;
	imageline($im, $x, 0, $x, $height, $black );
        imagejpeg( $im, "graph.jpeg", 90);
        imagedestroy($im);
        echo "<img src='graph.jpeg'><p></p>"; 

    /* Graphique avec JP-Graph */
    /* Requiert GD2 */
    /* JpGraph Error Your PHP installation does not seem to have the required GD 2.x library enabled. Please see the PHP documentation, "Image" section. Make sure that "php_gd2.dll" statement is uncomment in the [modules] section in the php.ini file. */
    /* /etc/php5/apache2/php.ini */

    /* Graphique avec PEAR Image_Graph */
    /*
    require_once 'Image/Graph.php';

    // create the graph
    $Graph =& Image_Graph::factory('graph', array(400, 300)); 
    // add a TrueType font
    $Font =& $Graph->addNew('font', 'Verdana');
    // set the font size to 11 pixels
    $Font->setSize(8);

    $Graph->setFont($Font);

    $Graph->add(
        Image_Graph::vertical(
            Image_Graph::factory('title', array('Bar Chart Sample', 12)),        
            Image_Graph::vertical(
                $Plotarea = Image_Graph::factory('plotarea'),
                $Legend = Image_Graph::factory('legend'),
                90
            ),
            5
        )
    );   

    $Legend->setPlotarea($Plotarea);        

    // create the dataset
    $this->resultatsset =& Image_Graph::factory('random', array(10, 2, 15, false));
    // create the 1st plot as smoothed area chart using the 1st dataset
    $Plot =& $Plotarea->addNew('bar', array(&$this->resultatsset));

    // set a line color
    $Plot->setLineColor('gray');

    // set a standard fill style
    $Plot->setFillColor('blue@0.2');

    // output the Graph
    $Graph->done(); 
    */

  }

  public function afficher_resultats() {
    print "<br/>"."\r\n";
    print "<center>"."\r\n";
    $this->afficher_resultats_table();
    print "<br/><br/>"."\r\n";
    $this->afficher_resultats_graph();
    print "</center>"."\r\n";
  }

  // Déclare un contructeur public
  public function __construct() {
    $this->nouveau();
  }

}

?>
