1 Création d'un LED avec un PictureBox
 2 boutons : Allumer / Eteindre
 Petite taille ! 255x255
 
2 Création d'un bouton inverser
 -> Nécessité de stocker l'état de la LED dans une donnée membre privée
  m_etat de type Boolean (True ou False)
  Creation d'une méthode dessiner qui dessine de la bonne couleur la LED
  en fonction de l'état m_etat
 
3 Encapsulation dans un contrôle utilisateur
encapsulation = information hiding
On encapsule l'état de la led (la donnée membre m_etat)
ainsi que les méthode s'appliquant à notre objet : allumer eteindre inverser
Ces méthodes doivent être "public" afin de pouvoir être accessible depuis l'extérieur de l'objet
La méthode dessiner

Pb : lorsqu'on lance le prog la LED n'est pas dessinée... (alors qu'elle est initialement éteinte)
Evènement Paint du PictureBox -> dessiner
Picture1.Cls

4 Création d'une propriété permettant d'accéder à l'état (écriture) de la LED
Ecriture sur la propiété etat
Ajout d'un CheckBox (recupération de la propriété value du CheckBox lors de l'évènement Click)
Ajout de Property Let
Public Property Let Etat(new_etat As Boolean)
    m_Etat = new_etat
    dessiner
End Property

5 Création d'un évenement ChangementEtat et Lecture de la propriété Etat
Public Property Get Etat() As Boolean
    Etat = m_Etat
End Property

PropertyChanged "Etat" dans Property Let Etat ainsi que dans toutes les méthodes qui changent l'état de la LED ???? nécessaire
uniquement pour la fenêtre propriété !!!

Déclaration de l'évènement
Event ChangementEtat()

Lancement de l'évènement
RaiseEvent ChangementEtat

Côté feuille principale traitement de l'évènement ChangementEtat
If LED1.Etat Then
    chkEtatLed.Value = 1
Else
    chkEtatLed.Value = 0
End If


Resize !
Private Sub UserControl_Resize()
Picture1.Width = Me.Width
Picture1.Height = Me.Height
End Sub

Propriétés width et height du PictureBox


6 Diagramme UML de l'objet LED et déployment de l'objet

Améliorations possibles :
Ajouter les propriétés Couleur_ON et Couleur_OFF
Faire en sorte que Couleur_OFF soit calculé à partir de Couleur_ON, rendre privé Couleur_ON Couleur_OFF et n'accéder qu'à la propriété Couleur

6 Création d'un bouton basé sur la LED
 Bouton avec commutation à l'appui

Notion d'héritage (Inheritance en anglais) n'existe pas en VB6 -> il faut recopier le code
en VB.Net mot-clé "extends"


Réaction à l'évènement MouseDown sur PictureBox lorsque l'on appuie sur le bouton de gauche (Button=1)


7. Bouton avec commutation jusqu'au relâchement
Réaction à l'évènement MouseDown et MouseUp sur PictureBox


Améliorations possibles :
Propriétés mécaniques différentes pour le bouton avec MouseUp et MouseDown
Ex Labview :
 Commutation à l'appui (FAIT en 6)
 Commutation au relâchement
 Commutation jusqu'au relâchement (FAIT en 7)
 Armement à l'appui
 Armement au relâchement
 Armement jusqu'au relâchement 


8. Afficheur d'octet
notion d'agrégation (aggregation) ou de composition (object composition)
créer un nouveau projet dans lequel vous inclurez le dernier contrôle LED réalisé.
Créeez un nouveau contrôle utilisateur appelé AfficheurOctet.
Ce contrôle doit permettre d'afficher un nombre entier positif codé sur un octet (8 bits).
On créera pour cet objet une propriété (en lecture et en écriture) permettant
de stocker ce nombre dans l'afficheur d'octet et d'allumer les Leds nécessaires.


autres notions objets non abordées :
polymorphisme, template de classe