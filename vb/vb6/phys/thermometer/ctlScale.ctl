VERSION 5.00
Begin VB.UserControl ctlScale 
   ClientHeight    =   3855
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6195
   ScaleHeight     =   3855
   ScaleWidth      =   6195
End
Attribute VB_Name = "ctlScale"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim m_min As Double
Dim m_max As Double

Enum ScaleDirection
Normal
Inverted
End Enum
Dim m_inverted As Boolean

Enum ScaleType
Linear
Log
End Enum
Dim m_scaletype As ScaleType

Dim m_major_tick_color As Long
Dim m_minor_tick_color As Long
Dim m_text_color As Long

Enum Direction
HorizontalTop
HorizontalBottom
VerticalLeft
VerticalRight
End Enum
Dim m_direction As Direction

Enum TickType
MinMax
Major
MajorAndMinor
End Enum
Dim m_ticktype As TickType

Enum TextType
MinMax
Major
End Enum
Dim m_texttype As TextType

Const margin_top As Integer = 10
Const margin_bottom As Integer = 10
Const margin_left As Integer = 5
Const margin_right As Integer = 5


Private Sub UserControl_Initialize()
m_min = 90
m_max = 100

m_major_tick_color = vbBlack
m_minor_tick_color = vbBlack
m_text_color = vbBlack

m_scaletype = ScaleType.Linear
m_inverted = ScaleDirection.Normal
m_direction = Direction.HorizontalTop
m_ticktype = TickType.MajorAndMinor
m_texttype = TextType.Major
End Sub

Private Sub UserControl_Paint()
'Line (0, 0)-(Width, Height) ' diag
BackColor = vbWhite

Dim major_tick_interval_nb As Integer
Dim minor_tick_interval_nb As Integer
major_tick_interval_nb = 10
minor_tick_interval_nb = 5
    
Dim major_tick_interval As Double
major_tick_interval = (m_max - m_min) / major_tick_interval_nb
Dim minor_tick_interval As Double
minor_tick_interval = major_tick_interval / minor_tick_interval_nb
    
Dim i, j As Integer

'Dim major_value As Double
'major_value = m_min
'Dim minor_value As Double
'minor_value = major_value
Dim pos As Double
Dim value As Double
Dim strValue As String

If m_direction = Direction.HorizontalTop Then
    ScaleMode = 0
    ScaleWidth = m_max - m_min + margin_left + margin_right
    ScaleLeft = -m_min - margin_left
    ScaleHeight = Height + (margin_top + margin_bottom)
    ScaleTop = -margin_top
    Line (m_min, 0)-(m_max, 0)
    For i = 0 To major_tick_interval_nb
        pos = i * major_tick_interval - m_min
        Line (pos, 0)-(pos, 200)
        value = m_min + i * (m_max - m_min) / major_tick_interval_nb '
        strValue = CStr(value)
        CurrentX = pos - TextWidth(strValue) / 2
        CurrentY = 250
        Print strValue
        
        If i <> major_tick_interval_nb Then
        For j = 1 To minor_tick_interval_nb - 1
            Line (j * minor_tick_interval + pos, 0)-(j * minor_tick_interval + pos, 100)
        Next j
        End If
    Next i
End If
End Sub
