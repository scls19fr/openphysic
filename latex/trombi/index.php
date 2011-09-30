<?php // Const

/*****************************************************************
 * Script en PHP permettant de générer un trombinoscope          *
 * Technique : ce script est exécuté sur un serveur web (Apache) *
 *  il renvoie une page web qui peut ensuite être visualisée     *
 *  via un navigateur web (Firefox, Internet Explorer...)        *
 *  Les photos doivent être stockées dans un répertoire ./img    *
 *  Les noms/prénoms des personnes sont dans un fichier .csv     *
 *****************************************************************/

/*****************************************************************
 * Prérequis :                                                   *
 *  Installation d'un serveur web Apache                         *
 *  Installation du module Pear php-file pour la lecture de      *
 *    fichiers CSV                                               *
 *    http://pear.php.net/package/File                           *
 *  Copie du répertoire contenant script, images et fichier .csv *
 *    dans /var/www/trombi                                       *
 *  Lancement du navigateur à l'adresse                          *
 *    http://127.0.0.1/trombi/index.php                          *
 *****************************************************************/

$liste = "main.csv";
$nb_colonnes = 8;
$titre = "Trombinoscope";

// Header

print "<html>
  <head>
    <title>
      $titre
    </title>
  </head>
  <body>
    <center>
      <h1>$titre</h1>
    </center>

    <center>
      <table>
";

// Partie centrale
$indice=0;
$ligne=1;
$colonne=1;

for ($indice=0 ; $indice<100 ; $indice++) { // ToDo lecture fichier CSV
  if ($colonne==1) {
    print "        <tr>"."\r\n";
  }

/*
  print "          <td>
            X
          </td>
";
*/

  $PHOTO='1';
  $NOM='NOM';
  $PRENOM='PRENOM';
  $NOMPRENOM='NOMPRENOM';

  if ($PHOTO=='') {
    $PHOTO="img/"."nophoto.png";
  } else {
    //try {
      $numphoto=$PHOTO; //int($PHOTO); // ToDo voir conversion string vers integer
    //}
      //catch {
      //$numphoto=null;
      if (numphoto!=null) {
        $PHOTO=sprintf("img/%06d.jpg",$PHOTO);
      }
  }

  print "          <td>
            <table>
              <tr><td><img src=\"$PHOTO\" align='bottom' alt=\"$NOMPRENOM\"></td></tr>
              <tr><td>$NOM</td></tr>
              <tr><td>$PRENOM</td></tr>
           </table>
          </td>
";


  $colonne=$colonne+1; // nouvelle colonne
			
  if ($colonne==$nb_colonnes+1) { // nouvelle ligne
    $colonne=1;
    $ligne=$ligne+1;
  }

  if ($colonne==1) {
    print "        </tr>"."\r\n";
  }

  //$indice=$indice+1
}


// Fin du fichier
print "      </table>
    </center>
  </body>
</html>
";
?>

