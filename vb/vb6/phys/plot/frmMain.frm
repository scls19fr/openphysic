VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Simulator tester"
   ClientHeight    =   3510
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   9825
   LinkTopic       =   "Form1"
   ScaleHeight     =   3510
   ScaleWidth      =   9825
   StartUpPosition =   3  'Windows Default
   Begin Plot.ctlPlot ctlPlot1 
      Height          =   3255
      Left            =   5040
      TabIndex        =   5
      Top             =   120
      Width           =   4695
      _extentx        =   8281
      _extenty        =   5741
   End
   Begin VB.Timer Timer1 
      Interval        =   500
      Left            =   4440
      Top             =   1560
   End
   Begin VB.TextBox txtInput 
      Height          =   375
      Left            =   240
      TabIndex        =   1
      Top             =   2160
      Width           =   2175
   End
   Begin Plot.ctlFirstOrder ctlFirstOrder1 
      Height          =   1215
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4815
      _extentx        =   8493
      _extenty        =   2143
   End
   Begin VB.Label lblOutput 
      Height          =   255
      Left            =   2640
      TabIndex        =   4
      Top             =   2160
      Width           =   2175
   End
   Begin VB.Label Label2 
      Caption         =   "Sortie"
      Height          =   255
      Left            =   2640
      TabIndex        =   3
      Top             =   1920
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "Entree"
      Height          =   255
      Left            =   240
      TabIndex        =   2
      Top             =   1920
      Width           =   1215
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Private Sub Form_Load()
txtInput.Text = CStr(3#)
lblOutput.Caption = CStr(0#)
End Sub


Private Sub Timer1_Timer()
lblOutput.Caption = CStr(ctlFirstOrder1.Sortie)

'ctlPlot1.Show
ctlPlot1.add (ctlFirstOrder1.Sortie)
End Sub

Private Sub txtInput_Change()
ctlFirstOrder1.Entree = CDbl(txtInput.Text)
End Sub
