VERSION 5.00
Begin VB.Form frmMain 
   BackColor       =   &H8000000E&
   Caption         =   "Form1"
   ClientHeight    =   4275
   ClientLeft      =   120
   ClientTop       =   420
   ClientWidth     =   6780
   LinkTopic       =   "Form1"
   ScaleHeight     =   4275
   ScaleWidth      =   6780
   StartUpPosition =   3  'Windows Default
   Begin POO.LED LED1 
      Height          =   975
      Left            =   480
      TabIndex        =   3
      Top             =   240
      Width           =   975
      _ExtentX        =   1720
      _ExtentY        =   1720
   End
   Begin VB.CommandButton cmdInverser 
      Caption         =   "&Inverser"
      Height          =   495
      Left            =   2400
      TabIndex        =   2
      Top             =   1560
      Width           =   1215
   End
   Begin VB.CommandButton cmdEteindre 
      Caption         =   "&Eteindre"
      Height          =   495
      Left            =   2400
      TabIndex        =   1
      Top             =   840
      Width           =   1215
   End
   Begin VB.CommandButton cmdAllumer 
      Caption         =   "&Allumer"
      Height          =   495
      Left            =   2400
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdAllumer_Click()
LED1.allumer
End Sub

Private Sub cmdEteindre_Click()
LED1.eteindre
End Sub

Private Sub cmdInverser_Click()
LED1.inverser
End Sub

