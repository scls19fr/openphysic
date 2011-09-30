VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsInterpolation"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Enum InterpolationMode
Linear
End Enum

Dim m_interpolation_mode As InterpolationMode

Dim m_x() As Double
Dim m_y() As Double
Dim m_size As Integer

Private Sub Class_Initialize()
m_size = 0
m_interpolation_mode = InterpolationMode.Linear
End Sub

Public Property Let add_values(ByVal x As Double, ByVal y As Double)
If m_size > 0 Then
    If x <= m_x(m_size - 1) Then
        Err.Raise 3000, "clsInterpolation", "x doit être strictement supérieur au x précédent"
    End If
End If

m_size = m_size + 1

ReDim Preserve m_x(0 To m_size - 1)
ReDim Preserve m_y(0 To m_size - 1)

m_x(m_size - 1) = x
m_y(m_size - 1) = y
End Property

Public Function linear_interpolation_gety(ByVal x As Double) As Double
Dim xa, xb, ya, yb As Double
Dim i As Integer
Dim flag As Boolean
flag = False
For i = 0 To m_size - 2
    xa = m_x(i)
    ya = m_y(i)
    xb = m_x(i + 1)
    yb = m_y(i + 1)
    If x >= xa And x <= xb Then
        flag = True
        Exit For
    End If
Next i

If flag Then
    linear_interpolation_gety = linear_interpolation(x, xa, ya, xb, yb)
Else
    Err.Raise 3001, "clsInterpolation", "x ne peut pas être interpolé"
End If
End Function

Public Function linear_interpolation_getx(ByVal y As Double) As Double
Dim xa, xb, ya, yb As Double
Dim i As Integer
Dim flag As Boolean
flag = False
For i = 0 To m_size - 2
    xa = m_x(i)
    ya = m_y(i)
    xb = m_x(i + 1)
    yb = m_y(i + 1)
    If x >= xa And x <= xb Then
        flag = True
        Exit For
    End If
Next i

If flag Then
    linear_interpolation_getx = linear_interpolation(y, ya, xa, yb, xb)
Else
    Err.Raise 3002, "clsInterpolation", "y ne peut pas être interpolé"
End If
End Function


Public Function linear_interpolation(ByVal x As Double, ByVal xa As Double, ByVal ya As Double, ByVal xb As Double, ByVal yb As Double) As Double
linear_interpolation = (yb - ya) / (xb - xa) * (x - xa) + ya
End Function

Public Sub Test()
Debug.Print "Test"
Dim i As Integer
For i = 0 To m_size - 1
    Debug.Print m_x(i) & " " & m_y(i)
Next i
End Sub


