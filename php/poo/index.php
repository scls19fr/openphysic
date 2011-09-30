<?php
  // La POO en PHP5
  // http://www.journaldunet.com/developpeur/tutoriel/php/040902-php5-objet-1a.shtml

class Personne {
  public $nom;
  public $metier;
  private $distance;
  private $direction;

  function __tostring() {
    return "Cette classe permet de définir et manipuler une personne.<br/>";
    }

  function __construct($nom, $metier, $distance=0, $direction=0) {
    $this->nom = $nom;
    $this->metier = $metier;
    $this->distance = $distance;
    $this->direction = $direction;
    }

  function arreter() {
    echo "$this->nom a arrêté toute activité en cours.<br/>";
    }

  function marcher($pas) {
    $this->distance += $pas;
    echo "$this->nom avance de $pas pas.<br/>";
    }

  function tourne($degres) {
    $this->direction += $degres;
    echo "$this->nom a tourné de $degres degré(s).<br/>";
    }

  function etat() {
    echo "Le $this->metier $this->nom a avancé de $this->distance pas depuis le début, il fait maintenant face au degré     $this->direction.<br/>";
    }
  }

$xavier = new Personne('Xavier Borderie', 'rédacteur', 0, 27);
$xavier->etat();
$xavier->marcher(50);
$xavier->tourne(-90);
$xavier->arreter(2);
$xavier->etat();
?>
