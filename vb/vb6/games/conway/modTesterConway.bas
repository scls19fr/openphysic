Attribute VB_Name = "modTesterConway"
Option Explicit

Public Sub tester_limites(ByVal nb_colonnes As Integer, ByVal nb_lignes, ByRef aGrille() As Integer)
' Test des limites
aGrille(0, 0) = Cellule.EnCoursDeVie ' haut gauche
aGrille(nb_colonnes - 1, nb_lignes - 1) = Cellule.EnCoursDeVie ' bas gauche
aGrille(0, nb_lignes - 1) = Cellule.EnCoursDeVie ' Bas droite
aGrille(nb_colonnes - 1, 0) = Cellule.EnCoursDeVie ' haut droit
End Sub

Public Sub tester_nb_voisins(ByVal nb_colonnes As Integer, ByVal nb_lignes, ByRef aGrille() As Integer)
' Configuration personnalisée (pour test du nb de voisins)
aGrille(10, 15) = Cellule.EnCoursDeVie
aGrille(10, 16) = Cellule.EnCoursDeVie
aGrille(10, 17) = Cellule.EnCoursDeVie
aGrille(9, 15) = Cellule.EnCoursDeVie
aGrille(9, 16) = Cellule.EnCoursDeVie
aGrille(9, 17) = Cellule.EnCoursDeVie
aGrille(8, 15) = Cellule.EnCoursDeVie
aGrille(8, 16) = Cellule.EnCoursDeVie
aGrille(8, 17) = Cellule.EnCoursDeVie
End Sub


Public Sub tester_blinker1(ByVal nb_colonnes As Integer, ByVal nb_lignes, ByRef aGrille() As Integer)
' Configuration "Blinker 1"
aGrille(3, 3) = Cellule.EnCoursDeVie
aGrille(4, 3) = Cellule.EnCoursDeVie
aGrille(5, 3) = Cellule.EnCoursDeVie
End Sub

Public Sub tester_blinker2(ByVal nb_colonnes As Integer, ByVal nb_lignes, ByRef aGrille() As Integer)
'Configuration "Blinker 2"
aGrille(4, 7) = Cellule.EnCoursDeVie
aGrille(4, 8) = Cellule.EnCoursDeVie
aGrille(4, 9) = Cellule.EnCoursDeVie
End Sub

Public Sub tester_pas_de_changement(ByVal nb_colonnes As Integer, ByVal nb_lignes, ByRef aGrille() As Integer)
' Pas de changement
aGrille(8, 3) = Cellule.EnCoursDeVie
aGrille(9, 3) = Cellule.Morte
aGrille(10, 3) = Cellule.EnCoursDeVie
End Sub

Public Sub tester_naissance(ByVal nb_colonnes As Integer, ByVal nb_lignes, ByRef aGrille() As Integer)
' Naissance
aGrille(13, 3) = Cellule.EnCoursDeVie
aGrille(13, 4) = Cellule.EnCoursDeVie
aGrille(15, 4) = Cellule.EnCoursDeVie
End Sub

Public Sub tester_etouffement(ByVal nb_colonnes As Integer, ByVal nb_lignes, ByRef aGrille() As Integer)
'Mort par étouffement
aGrille(8, 8) = Cellule.EnCoursDeVie
aGrille(9, 8) = Cellule.EnCoursDeVie
aGrille(10, 8) = Cellule.EnCoursDeVie
aGrille(8, 9) = Cellule.EnCoursDeVie
End Sub

Public Sub tester_structure_stable(ByVal nb_colonnes As Integer, ByVal nb_lignes, ByRef aGrille() As Integer)
' Structure stable (bloc de 4)
aGrille(13, 8) = Cellule.EnCoursDeVie
aGrille(14, 8) = Cellule.EnCoursDeVie
aGrille(13, 9) = Cellule.EnCoursDeVie
aGrille(14, 9) = Cellule.EnCoursDeVie
End Sub

Public Sub tester_toutes_configurations(ByVal nb_colonnes As Integer, ByVal nb_lignes, ByRef aGrille() As Integer)
tester_limites nb_colonnes, nb_lignes, aGrille
tester_nb_voisins nb_colonnes, nb_lignes, aGrille
tester_blinker1 nb_colonnes, nb_lignes, aGrille
tester_pas_de_changement nb_colonnes, nb_lignes, aGrille
tester_naissance nb_colonnes, nb_lignes, aGrille
tester_blinker2 nb_colonnes, nb_lignes, aGrille
tester_etouffement nb_colonnes, nb_lignes, aGrille
tester_structure_stable nb_colonnes, nb_lignes, aGrille
End Sub
