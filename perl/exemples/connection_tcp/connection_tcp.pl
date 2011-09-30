#!/usr/bin/perl 


# imports dont on a besoin 


use Socket; 


use FileHandle; 


# numero de port du serveur à contacter 


$port_serveur = @ARGV[1] || 21; 


$nom_serveur = @ARGV[0] || 'localhost'; 


# protocole mis en jeu : TCP 


$protocole = getprotobyname('tcp'); 


# creation du socket utilisée 


socket(VERS_SERVEUR,AF_INET,SOCK_STREAM,$protocole) || die("Ouverture de socket: $!"); 


# suivant que l'adresse du serveur est sous forme d'adresse IP ou de nom symbolique 


if ($nom_serveur =~ /^(\d+)\.(\d+)\.(\d+)\.(\d+)$/) 


      { 


  $adresse_ip_serveur = pack('A4', $1, $2, $3, $4); 


      } 


    else 


      { 


  #conversion en adresse IP 


  $adresse_ip_serveur = gethostbyname($nom_serveur); 


      } 


# On a toutes les infos, on peut donc se connecter au serveur 


$destination = pack('SnA4x8', AF_INET, $port_serveur, $adresse_ip_serveur); 


# connexion au serveur 


connect(VERS_SERVEUR, $destination) || die("Connect: $!"); 


  


autoflush VERS_SERVEUR, 1; 


    


if (fork) { 


while ($ligne = <STDIN>) 


{ 


print VERS_SERVEUR $ligne; 


} 


close(VERS_SERVEUR); 


} 


else 


{ 


while($ligne = <VERS_SERVEUR>) 


{ print $ligne ; } 


close(VERS_SERVEUR); 


}
