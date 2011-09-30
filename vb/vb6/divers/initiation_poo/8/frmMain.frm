VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Form1"
   ClientHeight    =   885
   ClientLeft      =   120
   ClientTop       =   420
   ClientWidth     =   4860
   LinkTopic       =   "Form1"
   ScaleHeight     =   885
   ScaleWidth      =   4860
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtN 
      Height          =   495
      Left            =   3720
      TabIndex        =   1
      Top             =   120
      Width           =   855
   End
   Begin POO.AfficheurOctet AfficheurOctet1 
      Height          =   255
      Left            =   480
      TabIndex        =   0
      Top             =   240
      Width           =   2895
      _extentx        =   5106
      _extenty        =   450
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub txtN_Change()
Me.AfficheurOctet1.N = txtN.Text
End Sub
