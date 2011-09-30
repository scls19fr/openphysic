VERSION 5.00
Begin VB.UserControl LED 
   ClientHeight    =   1005
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1005
   ScaleHeight     =   1005
   ScaleWidth      =   1005
   Begin VB.PictureBox Picture1 
      Height          =   1000
      Left            =   0
      ScaleHeight     =   945
      ScaleWidth      =   945
      TabIndex        =   0
      Top             =   0
      Width           =   1000
   End
End
Attribute VB_Name = "LED"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim m_etat As Boolean


Private Sub UserControl_Initialize()
m_etat = False ' LED initialement éteinte

Picture1.ScaleHeight = 100
Picture1.ScaleWidth = 100

Picture1.BorderStyle = 0 ' pas de bordure = None
Picture1.FillStyle = 0 ' opaque
End Sub

Public Sub allumer()
m_etat = True
dessiner
End Sub

Public Sub eteindre()
m_etat = False
dessiner
End Sub

Public Sub inverser()
m_etat = Not m_etat

' ou
'If etat Then
'    etat = False
'Else
'    etat = True
'End If

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

Private Sub Picture1_Paint()
dessiner
End Sub

