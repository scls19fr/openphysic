VERSION 5.00
Begin VB.UserControl ctlCuve 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3495
   ScaleHeight     =   3600
   ScaleWidth      =   3495
   Begin VB.PictureBox Picture1 
      Height          =   2415
      Left            =   0
      ScaleHeight     =   2355
      ScaleWidth      =   2475
      TabIndex        =   0
      Top             =   0
      Width           =   2535
   End
End
Attribute VB_Name = "ctlCuve"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Contrôle utilisateur niveau de cuve
' ===================================

' Contrôle utilisateur représentant une cuve contenant un liquide

' Sébastien CELLES
' IUT de Poitiers
' Département Génie Thermique et Energie
' s.celles at gmail.com


' Propriétés
'  Level (en lecture/écriture) : niveau de la cuve (S=1m^2)

' Evènements
'  LevelChanged : changement de la valeur à l'entrée du procédé

Option Explicit

Dim m_color As Long ' couleur liquide

Dim m_level As Double ' niveau liquide

Dim m_surface As Double

Dim m_volume_min As Double ' volume min
Dim m_volume_max As Double ' volume max
'Dim m_volume As Double

Dim m_temp_min As Double ' temperature min
Dim m_temp_max As Double ' temperature max
Dim m_temp As Double ' temperature
Dim m_colormap_temp_liq As clsColorMap ' colormap temperature liquide

Public Event VolumeChanged() ' changement de volume
'Public Event CuveVidée() '
'Public Event CuveRemplie() '

Private Sub UserControl_Initialize()
m_surface = 1

m_volume_min = 0#
m_volume_max = 1#

Me.Volume = 0

m_temp_min = 10
m_temp_max = 50
m_temp = 10

Set m_colormap_temp_liq = New clsColorMap
m_colormap_temp_liq.colorAt(0#) = vbBlue
'm_colormap_temp_liq.colorAt(0.5) = vbYellow
m_colormap_temp_liq.colorAt(1#) = vbRed
'm_color = vbBlue

End Sub

Private Sub UserControl_Resize()
Picture1.Width = UserControl.Width
Picture1.Height = UserControl.Height

UserControl_InitializePictureBox
End Sub

Private Sub UserControl_InitializePictureBox()
Picture1.ScaleMode = 0
Picture1.ScaleWidth = 1
Picture1.ScaleLeft = 0
Picture1.ScaleHeight = -(m_volume_max - m_volume_min)
Picture1.ScaleTop = m_volume_max
End Sub


Private Sub Picture1_Paint()

Picture1.Cls

'Picture1.Line (0, m_level_min)-(1, m_level_max)

m_color = m_colormap_temp_liq.colorAt((m_temp - m_temp_min) / (m_temp_max - m_temp_min))

Picture1.ForeColor = m_color
Picture1.FillStyle = 0
Picture1.FillColor = m_color

Picture1.Line (0, 0)-(1, Me.Volume), , B

End Sub

Public Property Get Level() As Double
Level = m_level
End Property

Public Property Let Level(ByVal new_level As Double)
If new_level >= m_volume_min / m_surface And new_level <= m_volume_max / m_surface Then
    m_level = new_level
ElseIf new_level < m_volume_min / m_surface Then
    m_level = m_volume_min / m_surface
    Debug.Print "Vide"
ElseIf new_level > m_volume_max / m_surface Then
    m_level = m_volume_max / m_surface
    Debug.Print "Trop plein"
End If
RaiseEvent VolumeChanged
Picture1_Paint
End Property


Public Property Get Surface() As Double
Surface = m_surface
End Property

Public Property Let Surface(ByVal new_surface As Double)
If new_surface <> m_surface Then
    If new_surface > 0 Then
        Me.Level = Me.Volume / new_surface   ' conservation du volume
        m_surface = new_surface
        UserControl_InitializePictureBox
    End If
End If
End Property


Public Property Get Volume() As Double
Volume = m_surface * m_level
End Property

Public Property Get VolumeMin() As Double
VolumeMin = m_volume_min
End Property

Public Property Get VolumeMax() As Double
VolumeMax = m_volume_max
End Property

Public Property Let Volume(ByVal new_volume As Double)
If new_volume <> Me.Volume Then
    Me.Level = new_volume / m_surface
    m_level = Me.Level
End If
End Property

Public Sub test()
    Debug.Print "S=" & Me.Surface & " ; h=" & Me.Level & " ; V=" & Me.Volume _
        & " ; Vmin=" & Me.VolumeMin & " ; Vmax=" & Me.VolumeMax
    
End Sub

Public Property Get Temp() As Double
Temp = m_temp
End Property

Public Property Let Temp(ByVal new_temp As Double)
If new_temp <> m_temp Then
    m_temp = new_temp
End If
End Property

Public Sub Refresh()
Picture1_Paint
End Sub
