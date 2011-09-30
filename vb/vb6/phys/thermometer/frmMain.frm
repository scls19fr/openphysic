VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Test thermometer"
   ClientHeight    =   5400
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   11460
   LinkTopic       =   "Form1"
   ScaleHeight     =   5400
   ScaleWidth      =   11460
   StartUpPosition =   3  'Windows Default
   Begin Thermometer.ctlScale ctlScale1 
      Height          =   615
      Left            =   1080
      TabIndex        =   1
      Top             =   600
      Width           =   10095
      _extentx        =   6376
      _extenty        =   450
   End
   Begin Thermometer.ctlThermometer ctlThermometer1 
      Height          =   3495
      Left            =   240
      TabIndex        =   0
      Top             =   480
      Width           =   615
      _extentx        =   3625
      _extenty        =   6376
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
