VERSION 5.00
Begin VB.Form frmTestLabjackU12 
   Caption         =   "Form1"
   ClientHeight    =   4080
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   7845
   LinkTopic       =   "Form1"
   ScaleHeight     =   4080
   ScaleWidth      =   7845
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdRien 
      Caption         =   "&Rien"
      Height          =   495
      Left            =   3600
      TabIndex        =   3
      Top             =   3120
      Width           =   1215
   End
   Begin VB.CommandButton cmdTout 
      Caption         =   "&Tout"
      Height          =   495
      Left            =   3600
      TabIndex        =   2
      Top             =   2520
      Width           =   1215
   End
   Begin TestLabjackU12.ES_Analog ES_Analog1 
      Height          =   2295
      Left            =   240
      TabIndex        =   1
      Top             =   240
      Width           =   6975
      _ExtentX        =   12303
      _ExtentY        =   4048
      Nb_entrées_analogiques_utilisées=   8
      Nb_sorties_analogiques_utilisées=   2
   End
   Begin VB.Timer Timer1 
      Interval        =   10
      Left            =   6840
      Top             =   1560
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      Height          =   855
      Left            =   1320
      TabIndex        =   0
      Top             =   2760
      Width           =   1815
   End
End
Attribute VB_Name = "frmTestLabjackU12"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdRien_Click()
ES_Analog1.Sortie(0) = 0
'ES_Analog1.Sortie(0) = -2 ' pour provoquer une erreur

End Sub

Private Sub cmdTout_Click()
ES_Analog1.Sortie(0) = 5
'ES_Analog1.Sortie(0) = 10 ' pour provoquer une erreur
End Sub

Private Sub Form_Load()

    'ES_Analog1.sortie1 = 3
    'ES_Analog1.Sortie(0) = 3
    'ES_Analog1.
End Sub

Private Sub Timer1_Timer()
    'Label1.Caption = ES_Analog1.entrée1
    'Label1.Caption = ES_Analog1.entrée(0)
    Label1.Caption = ES_Analog1.Nb_entrées_analogiques_max
End Sub
