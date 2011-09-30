VERSION 5.00
Begin VB.UserControl ctlPlot 
   BackColor       =   &H00FFC0C0&
   ClientHeight    =   2745
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4635
   ScaleHeight     =   2745
   ScaleWidth      =   4635
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   0
      TabIndex        =   1
      Top             =   2400
      Width           =   2415
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H00FFFFFF&
      Height          =   2295
      Left            =   0
      ScaleHeight     =   2235
      ScaleWidth      =   1995
      TabIndex        =   0
      Top             =   0
      Width           =   2055
   End
End
Attribute VB_Name = "ctlPlot"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim m_buffer As clsCircularBuffer

Dim m_window_capacity As Integer ' <= m_buffer.Capacity
Dim m_window_position As Integer ' 0 <= x <= m_buffer.Capacity-m_window_capacity
Dim m_window_real_position As Integer

Dim m_plot_state As Integer
    
Enum Points_Mode
    None
    Dot
    DotCircle
    AddCross
    TimesCross
End Enum
Dim m_points_mode As Points_Mode

Dim m_ray As Double
Dim m_delta_x As Double
Dim m_delta_y As Double


Private Sub UserControl_Initialize()
m_plot_state = 0
'Debug.Print "Initialize"

Set m_buffer = New clsCircularBuffer
'm_buffer.Capacity = 10
'm_window_capacity = 6
'm_window_position = 4 ' =window_capacity => affiche les derniers points
'm_window_position = 0 ' =0 => affiche les premiers points
'm_window_position = 4

m_buffer.Capacity = 30
m_window_capacity = 18
m_window_position = 12

Picture1.ScaleMode = 0

m_points_mode = Points_Mode.DotCircle


'update_scroll_bar
HScroll1.Min = 0

End Sub

Private Sub Picture1_Paint()
Dim points_number As Integer ' number of points to draw
If m_buffer.Used <= m_window_capacity Then
    points_number = m_buffer.Used
Else
    points_number = m_window_capacity
End If

If m_window_position > m_buffer.Used - m_window_capacity Then
    If m_buffer.Used <= m_window_capacity Then
        m_plot_state = 0
        m_window_real_position = 0
        HScroll1.Max = 0
        HScroll1.value = 0
    Else
        m_plot_state = 1
        m_window_real_position = m_buffer.Used - m_window_capacity
        HScroll1.Max = m_buffer.Used - m_window_capacity
        HScroll1.value = m_window_real_position
        m_plot_state = 2
    End If
Else
    m_plot_state = 3
    m_window_real_position = m_window_position
    HScroll1.Max = m_buffer.Used - m_window_capacity
    HScroll1.value = m_window_real_position
    m_plot_state = 4
End If


'Picture1.Line (0, Picture1.Height)-(Picture1.Width, 0)

'Debug.Print "Paint"

Picture1.Cls

Dim xmin As Double
Dim xmax As Double
Dim ymin As Double
Dim ymax As Double

Dim margin_left As Double
Dim margin_right As Double
Dim margin_top As Double
Dim margin_bottom As Double

xmin = 0
xmax = m_window_capacity - 1
ymin = 0
ymax = 5

margin_left = (xmax - xmin) / 10
margin_right = margin_left
margin_top = (ymax - ymin) / 10
margin_bottom = margin_top

Picture1.ScaleWidth = (xmax - xmin) + margin_right + margin_left
Picture1.ScaleHeight = -(ymax - ymin + margin_top + margin_bottom)
Picture1.ScaleTop = 5 + margin_top
Picture1.ScaleLeft = xmin - margin_left

Picture1.DrawWidth = 1
Picture1.ForeColor = vbRed
'Picture1.Line (0, 0)-(xmax, ymax) 'diag pour tester

Picture1.ForeColor = vbBlack
Picture1.DrawWidth = 3
Picture1.Line (xmin, 0)-(xmax, 0) ' axe abs
Picture1.Line (0, ymin)-(0, ymax) ' axe ord

Dim i As Integer

' Lines
Picture1.DrawWidth = 1
Picture1.ForeColor = vbGreen
For i = 1 To points_number - 1
    Picture1.Line (i - 1, m_buffer.FromFirst(i - 1 + m_window_real_position))-(i, m_buffer.FromFirst(i + m_window_real_position))
Next i


Picture1.DrawWidth = 1
Picture1.ForeColor = vbRed
Picture1.FillStyle = 0
Picture1.FillColor = vbRed

' Points (dot or circle)

If m_points_mode = Points_Mode.Dot Then ' .
    
    For i = 0 To points_number - 1
        Picture1.PSet (i, m_buffer.FromFirst(i + m_window_real_position))
    Next i

ElseIf m_points_mode = Points_Mode.DotCircle Then ' o

    m_ray = Abs(Picture1.ScaleHeight) / 20
    For i = 0 To points_number - 1
        Picture1.Circle (i, m_buffer.FromFirst(i + m_window_real_position)), m_ray
    Next i

ElseIf m_points_mode = Points_Mode.AddCross Then ' +

    m_delta_x = Picture1.ScaleWidth / 50 ' 1#
    m_delta_y = Abs(Picture1.ScaleHeight) / 50
    Picture1.DrawWidth = 1
    Picture1.ForeColor = vbRed
    Picture1.FillStyle = 0
    Picture1.FillColor = vbRed
    For i = 0 To points_number - 1
        Picture1.Line (i - m_delta_x, m_buffer.FromFirst(i + m_window_real_position))-(i + m_delta_x, m_buffer.FromFirst(i + m_window_real_position))
        Picture1.Line (i, m_buffer.FromFirst(i + m_window_real_position) - m_delta_y)-(i, m_buffer.FromFirst(i + m_window_real_position) + m_delta_y)
    Next i

ElseIf m_points_mode = Points_Mode.TimesCross Then  ' x

    m_delta_x = Picture1.ScaleWidth / 70
    m_delta_y = Abs(Picture1.ScaleHeight) / 70
    Picture1.DrawWidth = 1
    Picture1.ForeColor = vbRed
    Picture1.FillStyle = 0
    Picture1.FillColor = vbRed
    For i = 0 To points_number - 1
        Picture1.Line (i - m_delta_x, m_buffer.FromFirst(i + m_window_real_position) - m_delta_y)-(i + m_delta_x, m_buffer.FromFirst(i + m_window_real_position) + m_delta_y)
        Picture1.Line (i - m_delta_x, m_buffer.FromFirst(i + m_window_real_position) + m_delta_y)-(i + m_delta_x, m_buffer.FromFirst(i + m_window_real_position) - m_delta_y)
    Next i

End If

End Sub



Private Sub UserControl_Resize()
Picture1.Height = Height - HScroll1.Height
Picture1.Width = Width

HScroll1.Left = 0
HScroll1.Top = Height - HScroll1.Height
HScroll1.Width = Width
End Sub

'Public Sub Show()
'Picture1.Line (0, 0)-(Picture1.Width, Picture1.Height)

'Picture1.CurrentX = Picture1.Width / 2
'Picture1.CurrentY = Picture1.Height / 2
'Picture1.Print "hello"
'End Sub

Public Sub add(ByVal value As Double)
m_buffer.addItem (value)
'Debug.Print "add"

Picture1.Refresh
'update_scroll_bar
'Fix_HScroll1_Focus
End Sub

'Public Sub update_scroll_bar()
'HScroll1.Min = 0
'If m_buffer.Used <= m_window_capacity Then
'    HScroll1.Max = 0
'Else
'    HScroll1.Max = m_buffer.Used - m_window_capacity
'End If

'If m_window_position > HScroll1.Max Then
'    HScroll1.value = HScroll1.Max
'Else
'    HScroll1.value = m_window_real_position
'End If


'Debug.Print m_window_position
'Debug.Print HScroll1.value
'End Sub

Private Sub HScroll1_Update()
Debug.Print "HScroll1_Update " & m_plot_state
If m_plot_state = 4 Or m_plot_state = 3 Or m_plot_state = 2 Then
    m_window_position = HScroll1.value
    Picture1.Refresh
    'Fix_HScroll1_Focus
End If

End Sub

Private Sub HScroll1_Change()
'Debug.Print "HScroll1_Change"
HScroll1_Update
'Debug.Print HScroll1.value
End Sub

Private Sub HScroll1_Scroll()
HScroll1_Update
End Sub

Private Sub Fix_HScroll1_Focus()
'HScroll1.Refresh
'Picture1.SetFocus
'HScroll1.SetFocus
'Picture1.SetFocus
'Dim obj As Variant

End Sub
