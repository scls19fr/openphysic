Exemples permettant de cacher/afficher des parties d'un VI LabVIEW.

Un mot de passe permet par exemple de faire en sorte qu'un VI minimal avec juste
les données devienne un VI "complet" avec tous les calculs expérimentaux effectués
Dans mon exemple le mot de passe est 123 (suivi de entrée ou suivi d'un clic à l'extérieur
de la zone de saisie du mot de passe).

main.vi
Avec le noeud de propriété (clic droit sur un élément du diagramme / Créer noeud de propriété)
on peut changer la propriété "Visible" et la mettre à VRAI ou FAUX.

main_tab.vi
Le concept est similaire mais j'utilise un conteneur (tab control) que je rends visible ou pas.
Sur un autre tab control je modifie la propriété "Visible" d'une page donnée via
une référence au tab control, un noeud de propriétés pour récupérer un tableau de page.
A partir du tableau de pages je récupère la page à cacher/afficher via le noeud de propriété Visible.