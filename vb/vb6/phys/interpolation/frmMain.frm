VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Interpolation"
   ClientHeight    =   2880
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   5970
   LinkTopic       =   "Form1"
   ScaleHeight     =   2880
   ScaleWidth      =   5970
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdDebug 
      Caption         =   "&Debug"
      Height          =   495
      Left            =   1920
      TabIndex        =   8
      Top             =   2160
      Width           =   1935
   End
   Begin VB.TextBox txtY 
      Height          =   495
      Left            =   480
      TabIndex        =   4
      Text            =   "0"
      Top             =   1200
      Width           =   1215
   End
   Begin VB.CommandButton cmInterpolerY 
      Caption         =   "&Interpoler (y donné)"
      Height          =   495
      Left            =   1920
      TabIndex        =   3
      Top             =   1200
      Width           =   1935
   End
   Begin VB.CommandButton cmdInterpolerX 
      Caption         =   "&Interpoler (x donné)"
      Height          =   495
      Left            =   1920
      TabIndex        =   1
      Top             =   240
      Width           =   1935
   End
   Begin VB.TextBox txtX 
      Height          =   495
      Left            =   480
      TabIndex        =   0
      Text            =   "0"
      Top             =   240
      Width           =   1215
   End
   Begin VB.Label Label2 
      Caption         =   "y="
      Height          =   735
      Left            =   480
      TabIndex        =   7
      Top             =   960
      Width           =   495
   End
   Begin VB.Label Label1 
      Caption         =   "x="
      Height          =   495
      Left            =   480
      TabIndex        =   6
      Top             =   0
      Width           =   495
   End
   Begin VB.Label lblX 
      Height          =   495
      Left            =   4320
      TabIndex        =   5
      Top             =   1200
      Width           =   1215
   End
   Begin VB.Label lblY 
      Height          =   495
      Left            =   4320
      TabIndex        =   2
      Top             =   240
      Width           =   1215
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim interpol As clsInterpolation

Private Sub cmdDebug_Click()
interpol.Test
End Sub

Private Sub Form_Load()
Set interpol = New clsInterpolation
interpol.add_values(0) = 1
interpol.add_values(1) = 2
End Sub

Private Sub cmdInterpolerX_Click()
lblY.Caption = CStr(interpol.linear_interpolation_gety(CDbl(txtX.Text)))
End Sub

Private Sub cmInterpolerY_Click()
lblX.Caption = CStr(interpol.linear_interpolation_getx(CDbl(txtY.Text)))
End Sub


