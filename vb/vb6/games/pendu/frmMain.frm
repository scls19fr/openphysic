VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Pendu"
   ClientHeight    =   4290
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   5835
   LinkTopic       =   "Form1"
   ScaleHeight     =   4290
   ScaleWidth      =   5835
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdQuitter 
      Caption         =   "&Quitter"
      Height          =   495
      Left            =   960
      TabIndex        =   3
      Top             =   3600
      Width           =   3615
   End
   Begin VB.CommandButton cmdJouer 
      Caption         =   "&Jouer"
      Height          =   495
      Left            =   960
      TabIndex        =   0
      Top             =   2760
      Width           =   3615
   End
   Begin VB.Label lblMessage 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   480
      TabIndex        =   2
      Top             =   1560
      Width           =   4575
   End
   Begin VB.Label lblMot 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   1920
      TabIndex        =   1
      Top             =   600
      Width           =   1575
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim strMot_A_Trouver As String
Dim strMot_A_Afficher As String
Dim strCaractere As String

Const nb_tentatives_max = 6

Private Sub cmdJouer_Click()
initialiser_jeu

Dim i, j, k As Integer

For i = 1 To nb_tentatives_max
    lblMessage.Caption = "Tentative : " + CStr(i) + "/" + CStr(nb_tentatives_max)
    strCaractere = InputBox("Entrez le caractère")
    For j = 1 To 5
        If strCaractere = Mid(strMot_A_Trouver, j, 1) Then
            Mid(strMot_A_Afficher, j, 1) = strCaractere
            lblMot.Caption = strMot_A_Afficher
        End If
    Next j
    If strMot_A_Afficher = strMot_A_Trouver Or strCaractere = "" Then
        Exit For
    End If
Next i

If strMot_A_Afficher <> strMot_A_Trouver Then
    lblMessage.Caption = "Perdu après " + CStr(i - 1) + " tentatives"
Else
    lblMessage.Caption = "Gagné après " + CStr(i) + " tentatives"
End If

End Sub

Private Sub cmdQuitter_Click()
End
End Sub

Private Sub Form_Load()
'initialiser_jeu
End Sub


Private Sub initialiser_jeu()
Dim i As Integer

strMot_A_Trouver = "merci"

strMot_A_Afficher = ""
For i = 1 To Len(strMot_A_Trouver)
    strMot_A_Afficher = strMot_A_Afficher + "*"
Next i

lblMot.Caption = strMot_A_Afficher
lblMessage.Caption = ""
End Sub

