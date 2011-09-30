VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Morpion"
   ClientHeight    =   3495
   ClientLeft      =   120
   ClientTop       =   420
   ClientWidth     =   5880
   LinkTopic       =   "Form1"
   ScaleHeight     =   3495
   ScaleWidth      =   5880
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtDimension 
      Height          =   495
      Left            =   3840
      TabIndex        =   4
      Top             =   360
      Width           =   1215
   End
   Begin VB.CommandButton cmdQuitter 
      Caption         =   "&Quitter"
      Height          =   495
      Left            =   3840
      TabIndex        =   3
      Top             =   2640
      Width           =   1215
   End
   Begin VB.CommandButton cmdRecommencer 
      Caption         =   "&Recommencer"
      Height          =   495
      Left            =   3840
      TabIndex        =   2
      Top             =   1920
      Width           =   1215
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H00FFFFFF&
      Height          =   2775
      Left            =   360
      ScaleHeight     =   2715
      ScaleWidth      =   2715
      TabIndex        =   0
      Top             =   360
      Width           =   2775
   End
   Begin VB.Label lblMessage 
      Height          =   735
      Left            =   3840
      TabIndex        =   1
      Top             =   960
      Width           =   1335
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim i, j As Integer

Const dimension_default = 3
Dim dimension As Integer

Dim nb_coups_restants As Integer

'Dim aJeu(dimension_default, dimension_default) As Integer ' tableau décrivant les pions joués
Dim aJeu() As Integer ' tableau décrivant les pions joués
' 0 pas de coup sur cette case
' 1 un pion du joueur 1
' 2 un pion du joueur 2

Dim joueur As Integer
' joueur=1 ou 2

Dim etat_de_la_partie As Integer
' 0 en cours
' 1 partie gagnée par joueur 1
' 2 partie gagnée par joueur 2
' 3 partie nulle

Private Sub afficher_grille()
For i = 1 To dimension - 1
    Picture1.Line (i, 0)-(i, dimension)
Next i

For j = 1 To dimension - 1
    Picture1.Line (0, j)-(dimension, j)
Next j
End Sub

Private Sub afficher_croix(ByVal i As Integer, ByVal j As Integer)
    Picture1.Line (i - 1, j - 1)-(i, j)
    Picture1.Line (i - 1, j)-(i, j - 1)
End Sub

Private Sub afficher_cercle(ByVal i As Integer, ByVal j As Integer)
    Picture1.Circle (i - 0.5, j - 0.5), 0.5, vbRed
End Sub



Private Sub lancer_partie()
nb_coups_restants = dimension * dimension

' initialiser le tableau de jeu
' c'est nécessaire en cas de redémarrage d'une partie
For i = 1 To dimension
    For j = 1 To dimension
        aJeu(i, j) = 0
    Next j
Next i

joueur = 1
etat_de_la_partie = 0

afficher_message
End Sub

Private Sub cmdQuitter_Click()
End
End Sub

Private Sub cmdRecommencer_Click()
lancer_partie
afficher_jeu
End Sub

Private Sub Form_Load()
txtDimension.Text = dimension_default

lancer_partie

End Sub

Private Sub initialiser_affichage()
Picture1.ScaleMode = 0
Picture1.ScaleWidth = dimension
Picture1.ScaleHeight = -dimension
Picture1.ScaleTop = dimension
End Sub

Private Sub changer_joueur()
    If joueur = 1 Then
        joueur = 2
'    ElseIf joueur = 2 Then
    Else
        joueur = 1
    End If
End Sub

Private Sub Picture1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim Xentier, Yentier As Integer

If Button = 1 And etat_de_la_partie = 0 Then
    Xentier = Int(X) + 1
    Yentier = Int(Y) + 1
    
    ' En cas de clic sur la limite haute du PictureBox
    If Yentier = dimension + 4 Then
        Yentier = dimension
    End If
    
    ' En cas de clic sur la limite droite du PictureBox
    If Xentier = dimension + 1 Then
        Xentier = dimension
    End If
    
    'Debug.Print "(X,Y)=(" + CStr(X) + ";" + CStr(Y) + ")"
    'Debug.Print "(X,Y)=(" + CStr(Xentier) + ";" + CStr(Yentier) + ")"
    
    If aJeu(Xentier, Yentier) = 0 Then ' la case est bien vide
        aJeu(Xentier, Yentier) = joueur
        nb_coups_restants = nb_coups_restants - 1
        tester_victoire Xentier, Yentier
        changer_joueur
    Else ' la case n'est pas vide
        Beep
    End If
End If

afficher_jeu
    
End Sub

Private Sub Picture1_Paint()
afficher_jeu
End Sub

Private Sub afficher_message()
If etat_de_la_partie = 0 Then ' partie en cours
    If joueur = 1 Then
        lblMessage.Caption = "Joueur 1 c'est à vous de jouer !" _
            + vbCrLf + "Il reste " + CStr(nb_coups_restants) + " coup(s)"
    Else
        lblMessage.Caption = "Joueur 2 c'est à vous de jouer !" _
            + vbCrLf + "Il reste " + CStr(nb_coups_restants) + " coup(s)"
    End If
Else
    joueur = 0
    If etat_de_la_partie = 1 Then
        lblMessage.Caption = "Le joueur 1 a gagné !"
    ElseIf etat_de_la_partie = 2 Then
        lblMessage.Caption = "Le joueur 2 a gagné !"
    ElseIf etat_de_la_partie = 3 Then
        lblMessage.Caption = "Match nul"
    End If
End If
End Sub

Private Sub afficher_jeu()
    Picture1.Cls

    afficher_grille

    'afficher_croix 1, 1
    'afficher_cercle 1, 2
    
    ' afficher les pions
    For i = 1 To dimension
        For j = 1 To dimension
            If aJeu(i, j) = 1 Then
                afficher_croix i, j
            End If
            If aJeu(i, j) = 2 Then
                afficher_cercle i, j
            End If
        Next j
    Next i
    
    afficher_message
End Sub

'Private Function nb_coups_restants() As Integer
'For i = 1 To dimension
'    For j = 1 To dimension
'        If aJeu(i, j) = 0 Then
'            nb_coups_restants = nb_coups_restants + 1
'        End If
'    Next j
'Next i
'End Function

Private Sub tester_victoire(ByVal X As Integer, ByVal Y As Integer)
etat_de_la_partie = 0

' on teste la victoire en faisant le produit sur une ligne, une colonne
' ou sur les 2 deux diagonales
' ex joueur 1 dimension 3 : 1*1*1=1^3
' ex joueur 2 dimension 3 : 2*2*2=2^3
' joueur^dimension

Dim res_V As Integer
Dim res_H As Integer
Dim res_D1 As Integer
Dim res_D2 As Integer

res_V = 1 ' verticale
res_H = 1 ' horizontale
res_D1 = 1 ' diagonale /
res_D2 = 1 ' diagonale \

' calcul des produits sur
' lignes verticales et horizontales
' lignes diagonale D1 et D2
For i = 1 To dimension
    res_V = aJeu(i, Y) * res_V
    res_H = aJeu(X, i) * res_H
    res_D1 = aJeu(i, i) * res_D1
    res_D2 = aJeu(dimension + 1 - i, i) * res_D2
Next i

' le joueur gagne s'il a fait une ligne verticale, une horizontale
' ou une (des deux) diagonale
If res_V = joueur ^ dimension Or res_H = joueur ^ dimension _
    Or res_D1 = joueur ^ dimension Or res_D2 = joueur ^ dimension Then
    etat_de_la_partie = joueur
End If

If etat_de_la_partie = 0 And nb_coups_restants = 0 Then
    etat_de_la_partie = 3
End If

End Sub


Private Sub txtDimension_Change()
If IsNumeric(txtDimension.Text) Then
    dimension = CInt(txtDimension.Text)
Else
    dimension = dimension_default
End If
    
ReDim aJeu(1 To dimension, 1 To dimension)
' pas besoin de Redim Preserve car on relance le jeu
' quand on modifie la dimension
lancer_partie
initialiser_affichage
afficher_jeu

End Sub
