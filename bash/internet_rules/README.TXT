TO DO :


=== IPTABLES ===

Il faut ins�rer les commandes iptables en d�but

voir Post du 19/4/2006 14:14 IPtables : interdire/autoriser qu'une adresse IP sorte sur Internet


===

iptables -A FORWARD -s 192.168.0.2 -j REJECT --reject-with net-unreach

A installer *avant* toute r�gle susceptible d'accepter le paquet. Si ce genre de restriction est temporaire, il peut �tre int�ressant de leur d�dier une cha�ne utilisateur appel�e au bon endroit pour y ajouter ou supprimer les r�gles de blocage sans perturber le reste du jeu de r�gles iptables.

[d�but du script cr�ant le jeu de r�gles]
# cr�ation de la cha�ne utilisateur
iptables -N bloque_ip
# appel de la cha�ne utilisateur si le paquet entre par l'interface LAN
# <if_lan> et sort par l'interface ext�rieure <if_ext>
iptables -A FORWARD -i <if_lan> -o <if_ext> -j bloque_ip
[suite et fin du script cr�ant le jeu de r�gles]

Pour bloquer l'adresse source <adr_ip> :
iptables -A bloque_ip -s <adr_ip> -j REJECT --reject-with net-unreach

Pour supprimer le blocage :
iptables -D bloque_ip -s <adr_ip> -j REJECT --reject-with net-unreach 

===

Il va bien falloir, pourtant. Au pire tu peux ins�rer (-I au lieu de -A) la r�gle en d�but de cha�ne FORWARD. L'id�al serait de l'ins�rer entre les deux r�gles cit�es, mais il faut compter le nombre de r�gles � sauter avant (-I <nombre>). 


=== Ex�cuter un script en root ===
L'interface web doit ex�cuter le script Bash
=> en PHP exec(...);

Probl�me : il faut les droits root pour l'ex�cution du script

Solutions : sudo ou setuid

 setuid : chmod +s script.sh
 Probl�me : ne marche pas avec les script Bash

 sudo :
 mettre l'user apache dans /etc/sudoers
 Il ne faut pas que sudo demande de mot de passe

 apache ALL=(root) NOPASSWD: /path/to/my_script.sh