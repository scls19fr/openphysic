VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Simulator tester"
   ClientHeight    =   4740
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   7695
   LinkTopic       =   "Form1"
   ScaleHeight     =   4740
   ScaleWidth      =   7695
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   500
      Left            =   2760
      Top             =   3000
   End
   Begin VB.TextBox txtInput 
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   2160
      Width           =   1215
   End
   Begin FirstOrder.ctlFirstOrder ctlFirstOrder1 
      Height          =   1215
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   4815
      _extentx        =   8493
      _extenty        =   2143
   End
   Begin VB.Label lblOutput 
      Height          =   255
      Left            =   1920
      TabIndex        =   4
      Top             =   2160
      Width           =   1215
   End
   Begin VB.Label Label2 
      Caption         =   "Sortie"
      Height          =   255
      Left            =   1920
      TabIndex        =   3
      Top             =   1920
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "Entree"
      Height          =   255
      Left            =   120
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
txtInput.Text = CStr(0#)
lblOutput.Caption = CStr(0#)
End Sub

Private Sub Timer1_Timer()
lblOutput.Caption = CStr(ctlFirstOrder1.Sortie)
End Sub

Private Sub txtInput_Change()
ctlFirstOrder1.Entree = CDbl(txtInput.Text)
End Sub
