VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Conway"
   ClientHeight    =   5805
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9570
   LinkTopic       =   "Form1"
   ScaleHeight     =   5805
   ScaleWidth      =   9570
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdTester 
      Caption         =   "&Tester"
      Height          =   495
      Left            =   120
      TabIndex        =   5
      Top             =   240
      Width           =   1215
   End
   Begin VB.CommandButton cmdRecommencer 
      Caption         =   "&Recommencer"
      Height          =   495
      Left            =   1680
      TabIndex        =   4
      Top             =   5160
      Width           =   1215
   End
   Begin VB.CommandButton cmdQuitter 
      Cancel          =   -1  'True
      Caption         =   "&Quitter"
      Height          =   495
      Left            =   8280
      TabIndex        =   3
      Top             =   5160
      Width           =   1215
   End
   Begin VB.CommandButton cmdSuivant 
      Caption         =   "&Suivant"
      Default         =   -1  'True
      Height          =   495
      Left            =   240
      TabIndex        =   1
      Top             =   5160
      Width           =   1215
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H00FFFFFF&
      Height          =   4695
      Left            =   1680
      ScaleHeight     =   4635
      ScaleWidth      =   5835
      TabIndex        =   0
      Top             =   240
      Width           =   5895
   End
   Begin VB.Label lblMessages 
      Alignment       =   2  'Center
      Height          =   375
      Left            =   3240
      TabIndex        =   2
      Top             =   5280
      Width           =   4695
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Const nb_lignes = 3
Const nb_colonnes = 5

Enum Cellule
    Morte 'PasDeCellule
    EnCoursDeVie
    Naissante
    Mourante
'    UneSeuleGeneration
End Enum
Dim aGrille(0 To nb_colonnes - 1, 0 To nb_lignes - 1) As Integer ' matrice du jeu

Dim nb_coups_joues As Integer ' nb de coups joues

' PictureBox
'  Origine en haut à gauche
'  -->x
' |
' y


Private Sub cmdQuitter_Click()
End
End Sub

Private Sub cmdRecommencer_Click()
initialiser_jeu
afficher_jeu
End Sub

Private Sub cmdSuivant_Click()
evolution
afficher_jeu
End Sub



Private Sub Form_Load()
initialiser_jeu
initialiser_affichage
afficher_jeu
End Sub

Private Sub initialiser_jeu()
Dim i, j As Integer

' Effacement de la matrice de jeu
For j = 0 To nb_lignes - 1
    For i = 0 To nb_colonnes - 1
        aGrille(i, j) = Cellule.Morte
    Next i
Next j

'tester_toutes_configurations nb_colonnes, nb_lignes, aGrille
'tester_blinker1 nb_colonnes, nb_lignes, aGrille
'tester_naissance nb_colonnes, nb_lignes, aGrille
'tester_nb_voisins nb_colonnes, nb_lignes, aGrille
'tester_limites nb_colonnes, nb_lignes, aGrille

nb_coups_joues = 0
End Sub

Private Sub initialiser_affichage()
' initialisation afficheur (PictureBox)
With Picture1
    .ScaleMode = 0
    .ScaleHeight = nb_lignes  '>0 vers le bas
    .ScaleWidth = nb_colonnes
    .ScaleTop = 0 '0 'nb_lignes
    .ScaleLeft = 0 '0
End With
End Sub

Private Sub afficher_grille()
Dim i, j As Integer

' Tracé de la grille
Picture1.ForeColor = vbBlack ' couleur de tracé
Picture1.FillColor = vbBlack ' couleur de remplissage
For i = 1 To nb_lignes - 1
    Picture1.Line (0, i)-(nb_colonnes, i)  ' ligne horizontale
Next i

For j = 1 To nb_colonnes - 1
    Picture1.Line (j, 0)-(j, nb_lignes)  ' ligne verticale
Next j
End Sub

Private Sub afficher_cellules()
Dim X, Y As Integer
For X = 0 To nb_colonnes - 1
    For Y = 0 To nb_lignes - 1
        afficher_cellule X, Y, aGrille(X, Y)
    Next Y
Next X
End Sub


Private Sub afficher_cellule(ByVal X As Integer, ByVal Y As Integer, ByVal etat)
'

Picture1.FillStyle = 0  'rectangle plein

' 0 pas de cellule (cellule morte)
' 1 bleu : cellules en cours de vie
' 2 vert : cellules naissantes
' 3 rouge : cellules mourantes
' 4 jaune : cellules ne vivant qu'une seule génération
Select Case etat
    Case Cellule.EnCoursDeVie
        Picture1.FillColor = vbBlue
        
    Case Cellule.Naissante
        Picture1.FillColor = vbGreen
        
    Case Cellule.Mourante
        Picture1.FillColor = vbRed
    
'    Case Cellule.UneSeuleGeneration
'        Picture1.FillColor = vbYellow
    
    Case Else ' 0 ou autre ne rien afficher
        Picture1.FillColor = vbWhite
End Select

'Picture1.ForeColor = Picture1.FillColor ' contour
Picture1.Line (X, Y)-(X + 1, Y + 1), , B

End Sub

Private Sub afficher_jeu()
afficher_grille

afficher_cellules
'afficher_cellule 2, 3, Cellule.EnCoursDeVie

afficher_messages
End Sub

Private Sub afficher_messages()
If nb_coups_joues = 0 Then
    lblMessages.Caption = "Cliquez sur suivant pour voir évoluer la colonie"
Else
    lblMessages.Caption = "Coup n°" + CStr(nb_coups_joues)
End If
End Sub

Private Sub Picture1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = 1 Then
    Dim Xentier As Integer
    Dim Yentier As Integer
    
    Xentier = Int(X) + 1
    Yentier = Int(Y) + 1
    
    Debug.Print "Clic sur case", Xentier, Yentier, aGrille(Xentier, Yentier), nb_voisins(Xentier, Yentier, Cellule.EnCoursDeVie)
End If
End Sub

Private Sub Picture1_Paint()
afficher_jeu
End Sub

Private Function bordure(ByVal X As Integer, ByVal Xmin As Integer, ByVal Xmax As Integer) As Integer
    ' la bordure droite et la bordure gauche sont confondues
    ' la bordure haute et la la bordure basse sont confondues
    bordure = X
    
    If X < Xmin Then
        bordure = Xmax
    End If
    
    If X > Xmax Then
        bordure = Xmin
    End If
End Function


Private Function nb_voisins(ByVal X As Integer, ByVal Y As Integer, ByVal etat As Cellule) As Integer
nb_voisins = 0

'123  H
'8*4 G D
'765  B

Dim Xg, Xd As Integer ' Gauche/Droite
Dim Yh, Yb As Integer ' Haut/Bas
Xg = bordure(X - 1, 0, nb_colonnes - 1)
Xd = bordure(X + 1, 0, nb_colonnes - 1)
Yh = bordure(Y - 1, 0, nb_lignes - 1)
Yb = bordure(Y + 1, 1, nb_lignes - 1)

If aGrille(Xg, Yh) = etat Then '1
    nb_voisins = nb_voisins + 1
End If

If aGrille(X, Yh) = etat Then ' 2
    nb_voisins = nb_voisins + 1
End If

If aGrille(Xd, Yh) = etat Then ' 3
    nb_voisins = nb_voisins + 1
End If

If aGrille(Xd, Y) = etat Then ' 4
    nb_voisins = nb_voisins + 1
End If
 
If aGrille(Xd, Yb) = etat Then ' 5
    nb_voisins = nb_voisins + 1
End If

If aGrille(X, Yb) = etat Then ' 6
    nb_voisins = nb_voisins + 1
End If

If aGrille(Xg, Yb) = etat Then ' 7
    nb_voisins = nb_voisins + 1
End If

If aGrille(Xg, Y) = etat Then ' 8
    nb_voisins = nb_voisins + 1
End If

End Function


Private Sub evolution()
nb_coups_joues = nb_coups_joues + 1

Dim X, Y As Integer
Dim v As Integer ' nb de voisins
Dim etat As Cellule ' etat

For X = 1 To nb_colonnes
    For Y = 1 To nb_lignes


        v = nb_voisins(X, Y, Cellule.EnCoursDeVie) '+ nb_voisins(X, Y, Cellule.Mourante) + nb_voisins(X, Y, Cellule.Naissante)
        etat = aGrille(X, Y)
        
        'If X = 4 And Y = 3 Then
        '    Debug.Print "ok", etat, v, nb_voisins(X, Y, Cellule.EnCoursDeVie)
        'End If
        
        If etat = Morte Then
            If v = 3 Then
                aGrille(X, Y) = Cellule.EnCoursDeVie
            End If
        ElseIf etat = EnCoursDeVie Then
            If v = 2 Or v = 3 Then
                'aGrille(X, Y) = Cellule.EnCoursDeVie
            Else ' surpopulation ou isolement
                aGrille(X, Y) = Cellule.Morte
            End If
        End If

    Next Y
Next X
End Sub

Private Sub evolution2()

End Sub

Private Sub cmdTester_Click()
    Debug.Print nb_voisins(4, 3, Cellule.EnCoursDeVie)
End Sub



