VERSION 5.00
Begin VB.UserControl ctlThermometer 
   BackColor       =   &H80000009&
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   330
   ScaleHeight     =   3600
   ScaleWidth      =   330
End
Attribute VB_Name = "ctlThermometer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim m_color As Long
Dim m_backcolor As Long

Dim m_t_min As Double
Dim m_t_max As Double
Dim m_t As Double

Private Sub UserControl_Initialize()
m_color = vbRed

m_t_min = 0
m_t_max = 100
m_t = 70

BackColor = vbWhite '&H8000000F  '&H909090 'vbWhite
m_backcolor = &H909090
End Sub

Private Sub UserControl_Paint()
Cls


'Line (0, 0)-(1, 1)
'Line (0, Height)-(Width, 0)

'Line (0, 0)-(1, m_t / (m_t_max - m_t_min)), , B

ForeColor = m_color
FillStyle = 0
FillColor = m_color
'Line (0, 0)-(1, m_t / (m_t_max - m_t_min)), , B

'Line (0, 0)-(1, m_t / (m_t_max - m_t_min)), , B

Dim margin_vertical As Integer
margin_vertical = Width - 1

ForeColor = m_color
FillColor = m_color
Circle (margin_vertical / 2#, Height - margin_vertical / 2), margin_vertical / 2 ' demi-cercle bas

ForeColor = m_backcolor
FillColor = m_backcolor
Circle (margin_vertical / 2#, margin_vertical / 2#), margin_vertical / 2# ' demi-cercle haut

Line (0, margin_vertical / 2#)-(Width, Height - m_t / (m_t_max - m_t_min) * Height - margin_vertical / 2#), , B

ForeColor = m_color
FillColor = m_color
Line (0, Height - margin_vertical / 2#)-(Width, Height - m_t / (m_t_max - m_t_min) * Height - margin_vertical / 2#), , B





End Sub

Private Sub UserControl_Resize()
'UserControl.ScaleMode = 0
'UserControl.ScaleWidth = 1
'UserControl.ScaleLeft = 0
'UserControl.ScaleHeight = -1
'UserControl.ScaleTop = 1
End Sub
