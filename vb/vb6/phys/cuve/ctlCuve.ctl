VERSION 5.00
Begin VB.UserControl ctlCuve 
   BackColor       =   &H00FFFFFF&
   ClientHeight    =   5370
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   8490
   ScaleHeight     =   5370
   ScaleWidth      =   8490
   Begin VB.PictureBox Picture1 
      Height          =   3135
      Left            =   2040
      ScaleHeight     =   3075
      ScaleWidth      =   1395
      TabIndex        =   12
      Top             =   1080
      Width           =   1455
   End
   Begin VB.Timer Timer1 
      Left            =   5520
      Top             =   0
   End
   Begin VB.Label lblGeom 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "Label2"
      Height          =   975
      Left            =   600
      TabIndex        =   11
      Top             =   2160
      Width           =   1455
   End
   Begin VB.Label lblPelec 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Pelec"
      Height          =   495
      Left            =   600
      TabIndex        =   10
      Top             =   3720
      Width           =   1335
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "Simulation d'une cuve"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   0
      TabIndex        =   9
      Top             =   4560
      Width           =   6255
   End
   Begin VB.Label lblTair 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "Tair"
      Height          =   375
      Left            =   1680
      TabIndex        =   8
      Top             =   0
      Width           =   2415
   End
   Begin VB.Label lblQin2 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Qin"
      Height          =   255
      Left            =   3480
      TabIndex        =   7
      Top             =   480
      Width           =   1815
   End
   Begin VB.Label lblTin2 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Tin"
      Height          =   375
      Left            =   3480
      TabIndex        =   6
      Top             =   720
      Width           =   1815
   End
   Begin VB.Label lblTout 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Tout"
      Height          =   495
      Left            =   3600
      TabIndex        =   5
      Top             =   3840
      Width           =   2415
   End
   Begin VB.Label lblTemp 
      BackColor       =   &H00FFFFFF&
      Caption         =   "T"
      Height          =   375
      Left            =   3600
      TabIndex        =   4
      Top             =   2400
      Width           =   2415
   End
   Begin VB.Label lblTin1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Tin"
      Height          =   495
      Left            =   840
      TabIndex        =   3
      Top             =   720
      Width           =   1815
   End
   Begin VB.Label lblLevel 
      BackColor       =   &H00FFFFFF&
      Caption         =   "level"
      Height          =   375
      Left            =   3600
      TabIndex        =   2
      Top             =   2040
      Width           =   2415
   End
   Begin VB.Label lblQout 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Qout"
      Height          =   495
      Left            =   3600
      TabIndex        =   1
      Top             =   3600
      Width           =   2415
   End
   Begin VB.Label lblQin1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Qin"
      Height          =   495
      Left            =   840
      TabIndex        =   0
      Top             =   480
      Width           =   1815
   End
End
Attribute VB_Name = "ctlCuve"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Simulateur de cuve
' ==================

' Contrôle utilisateur simulant une cuve contenant un liquide
' ce contrôle simule la variation du niveau dans la cuve
' lorsqu'on la remplit ou lorsqu'on la vidange
' il simule en outre la variation de température du liquide
' dans la cuve en fonction des apports/déperditions
'  - liquide entrant à une certaine température et un certain débit
'  - puissance fournie par une résistance chauffante
'  - convection naturelle

' Sébastien CELLES
' IUT de Poitiers
' Département Génie Thermique et Energie
' s.celles at gmail.com


' Propriétés
'  Level (en lecture seule) : niveau de la cuve (en m) - h=0.5m par défaut
'  Surface (en lecture/écriture) : surface de la cuve (en m^2) - S=1m^2 par défaut
'  Qin(index) (en lecture/écriture) : débit volumique entrant (en m^3/s) avec index=1 ou 2
'  Tin(index) (en lecture/écriture) : température liquide entrant (en °C) avec index=1 ou 2
'  Kv (en lecture/écriture) : coefficient de la vanne de vidange (0..1)
'  Qvout (en lecture seule) : débit volumique sortant (en m^3/s)
'  Pr (en lecture/écriture) : puissance fournie par la résistance chauffante (en W)
'  Temp (en lecture/écriture) : température du liquide dans la cuve (en °C)
'  U : coefficient d'échange global (en W.K^-1)
'  Tair : température de l'air extérieur à la cuve (en °C)

Option Explicit

Const delta_t As Double = 100  ' ms

Const G As Double = 9.81
Const rho As Double = 1000 ' kg/m^3
Const S As Double = 1 ' m^2 ' to_fix

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

Const input_nb As Integer = 2

Dim m_qvin(1 To input_nb) As Double
Dim m_Tin(1 To input_nb) As Double

Dim m_Kv As Double

Dim m_qvout As Double

Dim m_m As Double ' masse

Dim m_cp As Double

Dim m_e As Double ' energie
Dim m_power As Double ' puissance fournie par la résistance électrique à la cuve
Dim m_colormap_r As clsColorMap ' colormap puissance résistance

Dim m_temp_air As Double ' temperature de l'air entourant la cuve (pour convection)
Dim m_U As Double ' coeff d'echange en W.K^-1

Private Sub UserControl_Initialize()
m_surface = 1

m_volume_min = 0#
m_volume_max = 1#

m_temp_min = 10
m_temp_max = 50
m_temp = 10

Set m_colormap_temp_liq = New clsColorMap
m_colormap_temp_liq.colorAt(0#) = vbBlue
'm_colormap_temp_liq.colorAt(0.5) = vbYellow
m_colormap_temp_liq.colorAt(1#) = vbRed
'm_color = vbBlue

m_level = 0.5
m_m = (m_level * m_surface) * rho


Timer1.Interval = delta_t


m_Tin(1) = 10
m_Tin(2) = 50

m_cp = 4186#  ' capacité thermique massique à pression constant (J.K^-1.kg^-1)
m_e = rho * m_cp * m_temp

m_power = 0
Set m_colormap_r = New clsColorMap
m_colormap_r.colorAt(0#) = vbBlack
m_colormap_r.colorAt(1#) = vbRed

m_temp_air = 20
m_U = 20000
End Sub

Private Sub UserControl_InitializePictureBox()
Picture1.ScaleMode = 0
Picture1.ScaleWidth = 1
Picture1.ScaleLeft = 0
'Picture1.ScaleWidth = 1.8
'Picture1.ScaleLeft = -Picture1.ScaleWidth / 4
Picture1.ScaleHeight = -(m_volume_max - m_volume_min)
Picture1.ScaleTop = m_volume_max
End Sub

Private Sub Picture1_Paint()
UserControl_InitializePictureBox

Picture1.Cls
Picture1.DrawWidth = 1
'Picture1.Line (0, m_level_min)-(1, m_level_max)

m_color = m_colormap_temp_liq.colorAt((m_temp - m_temp_min) / (m_temp_max - m_temp_min))

Picture1.ForeColor = m_color
Picture1.FillStyle = 0
Picture1.FillColor = m_color

Picture1.Line (0, 0)-(1, Me.Volume), , B


' Resistance
    Picture1.DrawWidth = 3
    Dim x As Double
    Const m_power_min As Double = 0
    Const m_power_max As Double = 20 * 10 ^ 3
    If m_power_max - m_power_min <> 0 Then
        x = (m_power - m_power_min) / (m_power_max - m_power_min)
        Picture1.ForeColor = m_colormap_r.colorAt(x)
    Else
        Picture1.ForeColor = vbGreen
    End If

    Const h As Double = 0.2
    Picture1.Line (0.2, 0)-(0.2, h) ' | gauche
    Picture1.Line (0.2, h)-(0.4, h * 0.5) ' \
    Picture1.Line (0.4, h * 0.5)-(0.4, h) ' |
    Picture1.Line (0.4, h)-(0.6, h * 0.5) ' \
    Picture1.Line (0.6, h * 0.5)-(0.6, h * 1) ' |
    Picture1.Line (0.6, h)-(0.8, h * 0.5) ' \
    Picture1.Line (0.8, 0)-(0.8, h * 0.5) ' | droit

End Sub

Private Sub Timer1_Timer()

'Debug.Print "ok"

' Bilan de masse
' ==============
' dm/dt = rho * (Qvin - Qvout)
' m = rho * V
' rho = cst => simplif par rho => bilan de volume
m_m = (rho * (Qvin(1) + Qvin(2) - Qvout)) * (delta_t / 1000#) + m_m
Me.Volume = m_m / rho
'ctlCuve1.Volume = (Qvin - Qvout) * (delta_t / 1000#) + ctlCuve1.Volume
'ctlCuve1.Level = (1 / S * (Qin - Qout)) * (delta_t / 1000#) + ctlCuve1.Level


' Bilan d'énergie
' ===============
' le système est un système ouvert... on raisonne en energie volumique (ou massique)
' pour faire le bilan
If Me.Volume <> 0 Then
    m_e = (rho * Qvin(1) * m_cp * (m_Tin(1) - m_temp) _
        + rho * Qvin(2) * m_cp * (m_Tin(2) - m_temp) _
        + m_power + m_U * (m_temp_air - m_temp)) / Me.Volume * (delta_t / 1000#) + m_e
    m_temp = m_e / (rho * m_cp)
Else
    If Qvin(1) <> 0 Or Qvin(2) <> 0 Then
        m_e = rho * m_cp * (Qvin(1) * m_Tin(1) + Qvin(2) * m_Tin(2)) / (Qvin(1) + Qvin(2)) ' to fix qvin2
        m_temp = m_e / (rho * m_cp)
    Else
        m_e = rho * m_cp * m_temp_air
        m_temp = m_e / (rho * m_cp) 'ctlCuve1.TempAir
    End If
End If

' Affichage
' =========
lblQin1.Caption = "Qv_in(1) = " & Format(Qvin(1), "#0.00") & " m^3/s"
lblTin1.Caption = "Tin(1) = " & Format(Tin(1), "##0.0") & " °C"

lblQin2.Caption = "Qv_in(2) = " & Format(Qvin(2), "#0.00") & " m^3/s" ' tofix
lblTin2.Caption = "Tin(2) = " & Format(Tin(2), "##0.0") & " °C" ' tofix

lblLevel.Caption = "h = " & Format(Me.Level, "###0.00") & " m" & " ; V=" & Format(Me.Volume, "###0.00") & " m^3"
lblTemp.Caption = "T = " & Format(m_temp, "##0.0") & " °C"

lblQout.Caption = "Qv_out = " & Format(Qvout, "#0.00") & " m^3/s"
lblTout.Caption = "Tout = " & Format(m_temp, "##0.0") & " °C"

lblTair.Caption = "Tair = " & Format(m_temp_air, "##0.0") & " °C" & " ; U=" & Format(m_U, "####0") & " W/K"

lblPelec.Caption = "Pelec = " & Format(m_power, "####0") & " W"

lblGeom.Caption = "S = " & Me.Surface & " m^2" & vbCrLf _
    & "Vmin = " & Me.VolumeMin & " m^3" & vbCrLf _
    & "Vmax = " & Me.VolumeMax & " m^3"

Picture1_Paint
End Sub

Private Sub UserControl_Resize()
'ctlCuve1.Width = UserControl.Width
'ctlCuve1.Height = UserControl.Height
End Sub

Public Property Get Qvin(ByVal index As Byte) As Double
Qvin = m_qvin(index)
End Property

Public Property Let Qvin(ByVal index As Byte, ByVal new_qvin As Double)
m_qvin(index) = new_qvin
End Property

Public Property Get Kv() As Double
Kv = m_Kv
End Property

Public Property Let Kv(ByVal new_Kv As Double)
m_Kv = new_Kv
End Property

Public Property Get Qvout() As Double
m_qvout = Kv * Sqr(rho * G * Me.Level)
Qvout = m_qvout
'If Qout <> 0 Then
'    Debug.Print Qout
'End If
End Property


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

Public Property Get Tin(ByVal index As Byte) As Double
Tin = m_Tin(index)
End Property

Public Property Let Tin(ByVal index As Byte, ByVal new_Tin As Double)
m_Tin(index) = new_Tin
End Property

Public Property Get Pr() As Double
Pr = m_power
End Property

Public Property Let Pr(ByVal new_power As Double)
m_power = new_power
End Property


Public Property Get U() As Double
U = m_U
End Property

Public Property Let U(ByVal new_U As Double)
m_U = new_U
End Property


Public Property Get Tair() As Double
Tair = m_temp_air
End Property

Public Property Let Tair(ByVal new_Tair As Double)
m_temp_air = new_Tair
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

