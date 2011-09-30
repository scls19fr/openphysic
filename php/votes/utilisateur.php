<?php
class utilisateur {
  public $id;
  public $nom;
  public $prenom;
  public $login;
  public $password;
  public $is_admin = false;

  function __construct() {
    //echo "construct";
  }

  function update_from_db($result) {
    extract($result);
    //echo $result;
    $this->id=$id;
    $this->nom=$nom;
    $this->prenom=$prenom;
    //$this->login=$login;
    //$this->password=$password;
    $this->is_admin=$is_admin;
  }

  function welcome() {
    echo htmlentities("Bienvenue {$this->prenom} {$this->nom} ({$this->login})");
    echo " - ";
    if ($this->is_admin) {
      echo "Vous etes administrateur";
    } else {
      echo "Vous &ecirc;tes simple votant";
    }
  }
}

//$u1 = new utilisateur();
?>
