VERSION 5.00
Begin VB.Form frmTestLed 
   Caption         =   "Form1"
   ClientHeight    =   3060
   ClientLeft      =   120
   ClientTop       =   420
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   3060
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
   Begin TestLed.Led Led1 
      Height          =   855
      Left            =   600
      TabIndex        =   0
      Top             =   600
      Width           =   1215
      _extentx        =   2143
      _extenty        =   1508
   End
   Begin VB.Timer Timer1 
      Interval        =   400
      Left            =   2760
      Top             =   1080
   End
End
Attribute VB_Name = "frmTestLed"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Timer1_Timer()
Led1.inverser
End Sub
