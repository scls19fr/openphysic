VERSION 5.00
Begin VB.Form frmTestVidangeCuve 
   Caption         =   "Test cuve vidangeable"
   ClientHeight    =   7920
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   13725
   LinkTopic       =   "Form1"
   ScaleHeight     =   7920
   ScaleWidth      =   13725
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtP 
      Height          =   495
      Left            =   480
      TabIndex        =   16
      Text            =   "0"
      Top             =   4680
      Width           =   1215
   End
   Begin VB.TextBox txtTin 
      Height          =   495
      Index           =   2
      Left            =   8640
      TabIndex        =   14
      Text            =   "50"
      Top             =   2040
      Width           =   1215
   End
   Begin VB.CheckBox chkRemplir 
      Caption         =   "Remplir"
      Height          =   495
      Index           =   2
      Left            =   8640
      TabIndex        =   12
      Top             =   2640
      Width           =   1215
   End
   Begin VB.TextBox txtQvin 
      Height          =   495
      Index           =   2
      Left            =   8640
      TabIndex        =   11
      Text            =   "0,05"
      Top             =   960
      Width           =   1215
   End
   Begin VB.TextBox txtTin 
      Height          =   495
      Index           =   1
      Left            =   480
      TabIndex        =   9
      Text            =   "10"
      Top             =   2160
      Width           =   1215
   End
   Begin VB.CommandButton cmdTest 
      Caption         =   "Tester"
      Height          =   495
      Left            =   720
      TabIndex        =   7
      Top             =   6480
      Width           =   1215
   End
   Begin VB.TextBox txtKv 
      Height          =   495
      Left            =   8160
      TabIndex        =   4
      Text            =   "0,001"
      Top             =   6360
      Width           =   1215
   End
   Begin VB.TextBox txtQvin 
      Height          =   495
      Index           =   1
      Left            =   480
      TabIndex        =   3
      Text            =   "0,05"
      Top             =   1080
      Width           =   1215
   End
   Begin VB.CheckBox chkVider 
      Caption         =   "Vider"
      Height          =   495
      Left            =   8160
      TabIndex        =   2
      Top             =   6840
      Width           =   1215
   End
   Begin VB.CheckBox chkRemplir 
      Caption         =   "Remplir"
      Height          =   495
      Index           =   1
      Left            =   480
      TabIndex        =   1
      Top             =   2760
      Width           =   1215
   End
   Begin TestVidangeCuve.ctlCuve ctlCuve1 
      Height          =   5295
      Left            =   2160
      TabIndex        =   0
      Top             =   240
      Width           =   5895
      _extentx        =   10398
      _extenty        =   9340
   End
   Begin VB.Label Label4 
      Caption         =   "Puissance résistance (kW)"
      Height          =   375
      Left            =   480
      TabIndex        =   17
      Top             =   4200
      Width           =   1455
   End
   Begin VB.Label Label3 
      Caption         =   "Température liq 2 entrant (°C)"
      Height          =   375
      Index           =   2
      Left            =   8640
      TabIndex        =   15
      Top             =   1560
      Width           =   1455
   End
   Begin VB.Label Label1 
      Caption         =   "Qv_in(2) Débit volumique entrant (m^3/s)"
      Height          =   615
      Index           =   2
      Left            =   8640
      TabIndex        =   13
      Top             =   240
      Width           =   1455
   End
   Begin VB.Label Label3 
      Caption         =   "Température liq 1 entrant (°C)"
      Height          =   375
      Index           =   1
      Left            =   480
      TabIndex        =   10
      Top             =   1680
      Width           =   1455
   End
   Begin VB.Label lblTest 
      Height          =   495
      Left            =   360
      TabIndex        =   8
      Top             =   7080
      Width           =   1935
   End
   Begin VB.Label Label2 
      Caption         =   "Vanne vidange Kv=0 (fermée) ... 1 (ouverte)"
      Height          =   615
      Left            =   8160
      TabIndex        =   6
      Top             =   5640
      Width           =   1095
   End
   Begin VB.Label Label1 
      Caption         =   "Qv_in(1) Débit volumique entrant (m^3/s)"
      Height          =   615
      Index           =   1
      Left            =   480
      TabIndex        =   5
      Top             =   360
      Width           =   1455
   End
End
Attribute VB_Name = "frmTestVidangeCuve"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub chkRemplir_Click(index As Integer)
If chkRemplir(index).Value = 0 Then
    ctlCuve1.Qvin(index) = 0
Else
    txtQvin_Change (index)
    txtTin_Change (index)
End If

End Sub

Private Sub cmdTest_Click()
'lblTest.Caption = ctlCuve1.Level
'lblTest.Caption = ctlCuve1.Kv
lblTest.Caption = ctlCuve1.Qvout
End Sub

Private Sub Form_Load()
chkRemplir_Click (1)
chkRemplir_Click (2)

chkVider_Click
End Sub

Private Sub txtKv_Change()
'If chkVider.Value = True Then
'    ctlCuve1.Kv = CDbl(txtKv.Text)
'End If
chkVider_Click
End Sub

Private Sub chkVider_Click()
If chkVider.Value = 0 Then
    ctlCuve1.Kv = 0
Else
    ctlCuve1.Kv = CDbl(txtKv.Text)
End If
End Sub

Private Sub txtP_Change()
ctlCuve1.Pr = CDbl(txtP.Text) * 1000
End Sub

Private Sub txtQvin_Change(index As Integer)
ctlCuve1.Qvin(index) = CDbl(txtQvin(index).Text)
End Sub

Private Sub txtTin_Change(index As Integer)
ctlCuve1.Tin(index) = CDbl(txtTin(index).Text)
End Sub
