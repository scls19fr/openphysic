TO DO :


=== IPTABLES ===

Il faut insérer les commandes iptables en début

voir Post du 19/4/2006 14:14 IPtables : interdire/autoriser qu'une adresse IP sorte sur Internet


===

iptables -A FORWARD -s 192.168.0.2 -j REJECT --reject-with net-unreach

A installer *avant* toute règle susceptible d'accepter le paquet. Si ce genre de restriction est temporaire, il peut être intéressant de leur dédier une chaîne utilisateur appelée au bon endroit pour y ajouter ou supprimer les règles de blocage sans perturber le reste du jeu de règles iptables.

[début du script créant le jeu de règles]
# création de la chaîne utilisateur
iptables -N bloque_ip
# appel de la chaîne utilisateur si le paquet entre par l'interface LAN
# <if_lan> et sort par l'interface extérieure <if_ext>
iptables -A FORWARD -i <if_lan> -o <if_ext> -j bloque_ip
[suite et fin du script créant le jeu de règles]

Pour bloquer l'adresse source <adr_ip> :
iptables -A bloque_ip -s <adr_ip> -j REJECT --reject-with net-unreach

Pour supprimer le blocage :
iptables -D bloque_ip -s <adr_ip> -j REJECT --reject-with net-unreach 

===

Il va bien falloir, pourtant. Au pire tu peux insérer (-I au lieu de -A) la règle en début de chaîne FORWARD. L'idéal serait de l'insérer entre les deux règles citées, mais il faut compter le nombre de règles à sauter avant (-I <nombre>). 


=== Exécuter un script en root ===
L'interface web doit exécuter le script Bash
=> en PHP exec(...);

Problème : il faut les droits root pour l'exécution du script

Solutions : sudo ou setuid

 setuid : chmod +s script.sh
 Problème : ne marche pas avec les script Bash

 sudo :
 mettre l'user apache dans /etc/sudoers
 Il ne faut pas que sudo demande de mot de passe

 apache ALL=(root) NOPASSWD: /path/to/my_script.sh