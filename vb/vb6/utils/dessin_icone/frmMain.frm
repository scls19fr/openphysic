VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Dessin Icônes"
   ClientHeight    =   5160
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6810
   LinkTopic       =   "Form1"
   ScaleHeight     =   5160
   ScaleWidth      =   6810
   StartUpPosition =   3  'Windows Default
   Begin VB.OptionButton Option3 
      Caption         =   "Bleu"
      Height          =   495
      Left            =   4320
      TabIndex        =   4
      Top             =   2280
      Width           =   1935
   End
   Begin VB.OptionButton Option2 
      Caption         =   "Vert"
      Height          =   375
      Left            =   4320
      TabIndex        =   3
      Top             =   1560
      Width           =   1815
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Rouge"
      Height          =   495
      Left            =   4320
      TabIndex        =   2
      Top             =   840
      Value           =   -1  'True
      Width           =   1815
   End
   Begin VB.CommandButton cmdGrille 
      Caption         =   "&Grille"
      Height          =   375
      Left            =   240
      TabIndex        =   1
      Top             =   240
      Width           =   855
   End
   Begin VB.PictureBox Picture1 
      Height          =   2415
      Left            =   1320
      ScaleHeight     =   2355
      ScaleWidth      =   2355
      TabIndex        =   0
      Top             =   840
      Width           =   2415
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim x_entier As Integer
Dim y_entier As Integer
Dim couleur As Long
Dim i, j As Integer

Private Sub cmdGrille_Click()
Picture1.ScaleMode = 0
Picture1.ScaleWidth = 10
Picture1.ScaleHeight = -10
Picture1.ScaleTop = 10

For i = 1 To 10
Picture1.Line (i, 0)-(i, 10)
Next i

For j = 1 To 10
Picture1.Line (0, j)-(10, j)
Next j


End Sub

Private Sub Form_Load()
couleur = vbRed
End Sub


Private Sub Picture1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Option1.Value = True Then
    couleur = vbRed
ElseIf Option2.Value = True Then
    couleur = vbGreen
ElseIf Option3.Value = True Then
    couleur = vbBlue
End If


If Button = 1 Then
    x_entier = CInt(X)
    y_entier = CInt(Y)
    
    If (X - (x_entier)) < 0 Then
        x_entier = x_entier - 1
    End If
    
    If (Y - (y_entier)) < 0 Then
        y_entier = y_entier - 1
    End If

    Picture1.Line (x_entier, y_entier)-(x_entier + 1, y_entier + 1), couleur, BF
End If

End Sub

