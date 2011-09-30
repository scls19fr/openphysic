<?php
class MyException  extends Exception {
    
    // Constructeur de la classe.
    // Il faut bien penser à rapeller le constructeur de la classe Exception.
    public function __construct($msg) {
        parent :: __construct($msg);
    }
    
    // Pour le fun, on ajoute une méthode qui récupère l'heure de l'erreur.
    public function getTime() {
        return date('Y-m-d H:i:s');
    }
    
    // Méthode retournant un message d'erreur complet et formaté.
    public function getError() {

        // On retourne un message d'erreur complet pour nos besoins.
        $return  = 'Une exception a été gérée :<br/>';
        $return .= '<strong>Message : ' . $this->getMessage() . '</strong><br/>';
        $return .= 'Il était : ' . $this->getTime();
        
        return $return;
    }
}
?>
