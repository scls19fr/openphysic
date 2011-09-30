VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Noise simulator tester"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   3720
      Top             =   480
   End
   Begin VB.TextBox txtInput 
      Height          =   495
      Left            =   240
      TabIndex        =   0
      Top             =   360
      Width           =   2535
   End
   Begin VB.Label Label2 
      Caption         =   "Ouput (input+noise)"
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   1080
      Width           =   2655
   End
   Begin VB.Label Label1 
      Caption         =   "Input"
      Height          =   375
      Left            =   240
      TabIndex        =   2
      Top             =   0
      Width           =   1215
   End
   Begin VB.Label lblOutput 
      Height          =   615
      Left            =   240
      TabIndex        =   1
      Top             =   1440
      Width           =   2415
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim noisy_signal As clsNoise

Private Sub Form_Load()
Set noisy_signal = New clsNoise

txtInput.Text = CStr(5#)
lblOutput.Caption = CStr(0#)
End Sub

Private Sub Timer1_Timer()



noisy_signal.Entree = CDbl(txtInput.Text)
lblOutput.Caption = CStr(noisy_signal.Sortie)

'noisy_signal.Show
End Sub
