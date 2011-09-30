VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Calcul de la vitesse d'usinage"
   ClientHeight    =   5760
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7125
   LinkTopic       =   "Form1"
   ScaleHeight     =   5760
   ScaleWidth      =   7125
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text2 
      Height          =   495
      Left            =   480
      TabIndex        =   14
      Text            =   "Text2"
      Top             =   3120
      Width           =   1575
   End
   Begin VB.ListBox List2 
      BeginProperty Font 
         Name            =   "Arial Black"
         Size            =   9.75
         Charset         =   0
         Weight          =   900
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1410
      Left            =   2160
      TabIndex        =   11
      Top             =   1440
      Width           =   735
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Cuivre"
      Height          =   375
      Index           =   4
      Left            =   4320
      TabIndex        =   10
      Top             =   2880
      Width           =   1095
   End
   Begin VB.ListBox List1 
      BeginProperty Font 
         Name            =   "Arial Black"
         Size            =   9.75
         Charset         =   0
         Weight          =   900
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1410
      Left            =   480
      MultiSelect     =   1  'Simple
      TabIndex        =   9
      Top             =   1440
      Width           =   1575
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Aluminium"
      Height          =   375
      Index           =   3
      Left            =   4320
      TabIndex        =   8
      Top             =   2400
      Width           =   1095
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Acied dur"
      Height          =   375
      Index           =   2
      Left            =   4320
      TabIndex        =   7
      Top             =   1920
      Width           =   1095
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Acier doux"
      Height          =   375
      Index           =   1
      Left            =   4320
      TabIndex        =   6
      Top             =   1440
      Width           =   1095
   End
   Begin VB.Frame Frame1 
      Caption         =   "Matière"
      Height          =   2535
      Left            =   4080
      TabIndex        =   5
      Top             =   960
      Width           =   1815
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Fin"
      Height          =   735
      Left            =   6000
      TabIndex        =   4
      Top             =   4920
      Width           =   975
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   375
      Left            =   2520
      Max             =   200
      TabIndex        =   3
      Top             =   120
      Width           =   1455
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   1200
      TabIndex        =   0
      Text            =   "0"
      Top             =   120
      Width           =   735
   End
   Begin VB.Frame Frame2 
      Caption         =   "Vitesse de Coupe"
      Height          =   1935
      Left            =   360
      TabIndex        =   15
      Top             =   1080
      Width           =   2655
   End
   Begin VB.Label Label4 
      BackColor       =   &H00C0FFFF&
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3840
      TabIndex        =   13
      Top             =   4200
      Width           =   1455
   End
   Begin VB.Label Label3 
      Caption         =   "VITESSE DE ROTATION (tr/min) :"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   240
      TabIndex        =   12
      Top             =   4200
      Width           =   3735
   End
   Begin VB.Label Label2 
      Caption         =   "(mm)"
      Height          =   255
      Left            =   2040
      TabIndex        =   2
      Top             =   240
      Width           =   495
   End
   Begin VB.Label Label1 
      Caption         =   "DIAMETRE"
      Height          =   375
      Left            =   240
      TabIndex        =   1
      Top             =   240
      Width           =   975
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim matiere, indice, diametre As Integer
Dim VC(1 To 5, 1 To 4) As Integer
Dim vitesse As Double


Private Sub Command1_Click()
End
End Sub


Private Sub Form_Load()
'Chargement des vitesses de coupe

'Chariotage
VC(1, 1) = 36
VC(1, 2) = 25
VC(1, 3) = 80
VC(1, 4) = 60

'Dressage
VC(2, 1) = 30
VC(2, 2) = 25
VC(2, 3) = 80
VC(2, 4) = 55

'Perçage
VC(3, 1) = 25
VC(3, 2) = 18
VC(3, 3) = 45
VC(3, 4) = 30

'Tronçonnage
VC(4, 1) = 20
VC(4, 2) = 15
VC(4, 3) = 35
VC(4, 4) = 25

'Moletage
VC(5, 1) = 10
VC(5, 2) = 8
VC(5, 3) = 20
VC(5, 4) = 15

End Sub

Private Sub HScroll1_Change()
Text1.Text = HScroll1.Value
End Sub

Private Sub List1_Click()
indice = List1.ListIndex + 1
Text2.Text = List1.List(indice - 1)

diametre = CInt(Text1.Text)
If diametre <> 0 Then
    vitesse = 1000 * VC(indice, matiere) / (3.14 * diametre)
    Label4.Caption = Format(vitesse, "0##.#0")
Else
    Label4.Caption = "Diamètre ?? "
End If

End Sub

Private Sub Option1_Click(Index As Integer)
Dim i As Integer

matiere = Index

'remplissage de la liste
List2.Clear
For i = 1 To 5
    List2.AddItem (VC(i, matiere))
Next i

End Sub

