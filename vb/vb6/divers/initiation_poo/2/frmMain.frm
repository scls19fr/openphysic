VERSION 5.00
Begin VB.Form frmMain 
   BackColor       =   &H8000000E&
   Caption         =   "Form1"
   ClientHeight    =   3060
   ClientLeft      =   120
   ClientTop       =   420
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   3060
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdInverser 
      Caption         =   "&Inverser"
      Height          =   495
      Left            =   2400
      TabIndex        =   3
      Top             =   1560
      Width           =   1215
   End
   Begin VB.CommandButton cmdEteindre 
      Caption         =   "&Eteindre"
      Height          =   495
      Left            =   2400
      TabIndex        =   2
      Top             =   840
      Width           =   1215
   End
   Begin VB.CommandButton cmdAllumer 
      Caption         =   "&Allumer"
      Height          =   495
      Left            =   2400
      TabIndex        =   1
      Top             =   120
      Width           =   1215
   End
   Begin VB.PictureBox Picture1 
      Height          =   2445
      Left            =   240
      ScaleHeight     =   2385
      ScaleWidth      =   2025
      TabIndex        =   0
      Top             =   120
      Width           =   2085
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim m_etat As Boolean

Private Sub cmdAllumer_Click()
m_etat = True
dessiner
End Sub

Private Sub cmdEteindre_Click()
m_etat = False
dessiner
End Sub

Private Sub dessiner()
If m_etat Then
    ' Picture1.Width = Picture1.Height
    'Picture1.Line (0, 0)-(Picture1.Width, Picture1.Height)
    'Picture1.Circle (Xcentre, Ycentre), Rayon
    Picture1.FillColor = vbRed
    Picture1.ForeColor = Picture1.FillColor
    Picture1.Circle (50, 50), 50
Else
    ' A propos des couleurs dans VB6
    ' &HBBGGRR
    '  RR composante rouge en hexadécimal de 00 à FF (soit de 0 à 255 en décimal)
    '  GG composante verte en hexadécimal de 00 à FF (soit de 0 à 255 en décimal)
    '  BB composante bleue en hexadécimal de 00 à FF (soit de 0 à 255 en décimal)

    Picture1.FillColor = &H90
    Picture1.ForeColor = Picture1.FillColor
    Picture1.Circle (50, 50), 50
End If
End Sub

Private Sub cmdInverser_Click()
m_etat = Not m_etat

' ou
'If etat Then
'    etat = False
'Else
'    etat = True
'End If

dessiner
End Sub

Private Sub Form_Activate()
'dessiner
End Sub

Private Sub Form_Load()
m_etat = False ' LED initialement éteinte

Picture1.ScaleHeight = 100
Picture1.ScaleWidth = 100

Picture1.BorderStyle = 0 ' pas de bordure = None
Picture1.FillStyle = 0 ' opaque
End Sub

Private Sub Picture1_Paint()
dessiner
End Sub
