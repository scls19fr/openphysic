VERSION 5.00
Begin VB.Form frmTestCuve 
   Caption         =   "Test cuve"
   ClientHeight    =   6645
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   8430
   LinkTopic       =   "Form1"
   ScaleHeight     =   6645
   ScaleWidth      =   8430
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdTest 
      Caption         =   "Test"
      Height          =   375
      Left            =   360
      TabIndex        =   13
      Top             =   3480
      Width           =   4335
   End
   Begin VB.CommandButton cmdVolume 
      Caption         =   "Test"
      Height          =   495
      Left            =   3480
      TabIndex        =   10
      Top             =   1920
      Width           =   1215
   End
   Begin VB.TextBox txtVolume 
      Height          =   495
      Left            =   3480
      TabIndex        =   9
      Text            =   "0"
      Top             =   1200
      Width           =   1215
   End
   Begin VB.CommandButton cmdSurface 
      Caption         =   "Test"
      Height          =   495
      Left            =   360
      TabIndex        =   6
      Top             =   1920
      Width           =   1215
   End
   Begin VB.TextBox txtSurface 
      Height          =   495
      Left            =   360
      TabIndex        =   5
      Text            =   "1"
      Top             =   1200
      Width           =   1215
   End
   Begin TestCuve.ctlCuve ctlCuve1 
      Height          =   3615
      Left            =   4920
      TabIndex        =   4
      Top             =   240
      Width           =   2295
      _extentx        =   4048
      _extenty        =   6376
   End
   Begin VB.TextBox txtLevel 
      Height          =   495
      Left            =   1920
      TabIndex        =   2
      Text            =   "0"
      Top             =   1200
      Width           =   1215
   End
   Begin VB.CommandButton cmdLevel 
      Caption         =   "Test"
      Height          =   495
      Left            =   1920
      TabIndex        =   0
      Top             =   1920
      Width           =   1215
   End
   Begin VB.Label lblVolume 
      Height          =   495
      Left            =   3480
      TabIndex        =   12
      Top             =   2640
      Width           =   1215
   End
   Begin VB.Label Label4 
      Caption         =   "Volume de la cuve (de 0 à 1m)"
      Height          =   495
      Left            =   3480
      TabIndex        =   11
      Top             =   720
      Width           =   1215
   End
   Begin VB.Label lblSurface 
      Height          =   495
      Left            =   360
      TabIndex        =   8
      Top             =   2640
      Width           =   1215
   End
   Begin VB.Label Label2 
      Caption         =   "Surface de la cuve (de 0 à 1m)"
      Height          =   495
      Left            =   360
      TabIndex        =   7
      Top             =   720
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "Niveau de la cuve (de 0 à 1m)"
      Height          =   495
      Left            =   1920
      TabIndex        =   3
      Top             =   720
      Width           =   1215
   End
   Begin VB.Label lblLevel 
      Height          =   495
      Left            =   1920
      TabIndex        =   1
      Top             =   2640
      Width           =   1215
   End
End
Attribute VB_Name = "frmTestCuve"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdLevel_Click()
ctlCuve1.Level = CDbl(txtLevel.Text)
lblLevel.Caption = ctlCuve1.Level

ctlCuve1.test
End Sub

Private Sub cmdSurface_Click()
ctlCuve1.Surface = CDbl(txtSurface.Text)
lblSurface.Caption = ctlCuve1.Surface

ctlCuve1.test
End Sub

Private Sub cmdTest_Click()
ctlCuve1.test
End Sub

Private Sub cmdVolume_Click()
ctlCuve1.Volume = CDbl(txtVolume.Text)
lblVolume.Caption = ctlCuve1.Volume

ctlCuve1.test

End Sub

Private Sub Form_Load()
'ctlCuve1.Surface = 2
'ctlCuve1.Volume = 1.1
'ctlCuve1.Volume = 1

End Sub
