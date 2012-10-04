Afficheur dynamique de pages webs
Permet d'afficher plusieurs pages web sur un écran
et les faire défiler (à l'aide de boutons ou à l'aide d'un timer)

Un fichier de conf au format xml est lu
$ cat ~/browser.xml
<!DOCTYPE BrowserML PUBLIC '-//CELLES//DTD Browser 0.1 //EN' 'http://www.celles.net/dtd/browser/browser_data-0_1.dtd'>
<!--This file describe data for a very light browser for dynamic display-->
<!--http://www.celles.net/wiki/Browser-->
<browser timer="5000" >
 <url>http://127.0.0.1/test/0.html</url>
 <url>http://127.0.0.1/test/1.html</url>
 <url>http://127.0.0.1/test/2.html</url>
 <url>http://127.0.0.1/test/3.html</url>
 <url>http://127.0.0.1/test/4.html</url>
 <url>http://127.0.0.1/test/5.html</url>
</browser>

S'il n'existe pas, il est automatiquement créé lors du premier lancement du programme.


Devel :
Dépendances : qt4 qtwebkit


Relancer la lecture du fichier de conf
bin/browser_restart.sh

Rem : à distance on peut relancer la lecture du fichier de conf
mais pas faire stop puis start
(browser: cannot connect to X server)

ToDo : Utilisation de D-Bus pour relancer la lecture du fichier de conf
http://doc.trolltech.com/4.4/qdbus.html
http://doc.trolltech.com/4.4/intro-to-dbus.html
http://doc.trolltech.com/4.4/qdbusadaptorexample.html
