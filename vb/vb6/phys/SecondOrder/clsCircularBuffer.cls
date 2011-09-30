VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsCircularBuffer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' fixed size
'Const m_capacity As Integer = 5
'Dim m_buffer(0 To m_capacity - 1) As Double

' variable size
Dim m_capacity As Integer
Dim m_buffer() As Double

Dim m_used As Integer
Dim m_index As Integer


Enum LogMode
Wrap ' overwrite oldest values
Fill ' launch exception when buffer is full
End Enum
Dim m_mode As LogMode

' Constructor
Public Sub Class_Initialize()
m_capacity = 5
ReDim m_buffer(0 To m_capacity - 1)

clear
End Sub



Public Sub addItem(ByVal item As Double)
m_buffer(m_index) = item

If m_used < m_capacity Then
    m_used = m_used + 1
Else
    m_used = m_capacity
End If

m_index = (m_index + 1) Mod m_capacity

If m_mode = Fill And m_used = m_capacity Then
Err.Raise 2001, "CircularBuffer", "Memory Full"
End If

End Sub

Public Property Get Last() As Double
Last = m_buffer((m_index + m_capacity - 1) Mod m_capacity)
End Property


Public Property Get First() As Double
If m_used < m_capacity Then
    First = m_buffer(0)
Else
    First = m_buffer(m_index)
End If
End Property

Public Property Get FromLast(ByVal offset As Integer) As Double
If offset >= 0 And offset < m_used Then
    FromLast = m_buffer((m_index + m_capacity - 1 - offset) Mod m_capacity)
Else
    Err.Raise 2000, "CircularBuffer", "offset out of bounds"
End If
End Property

Public Property Get FromFirst(ByVal offset As Integer) As Double
'If offset >= 0 And offset < m_used Then
    If m_used < m_capacity Then
        FromFirst = m_buffer(offset)
    Else
        FromFirst = m_buffer((m_index + offset) Mod m_capacity)
    End If
'Else
    'Err.Raise 2000, "CircularBuffer", "offset out of bounds" ' ToFix with Plot scroll window
'End If
End Property


Public Property Get Used() As Double
Used = m_used
End Property


Public Property Get Capacity() As Integer
Capacity = m_capacity
End Property

Public Property Let Capacity(ByVal new_capacity As Integer)
'Err.Raise 1999, "CircularBuffer", "can't redim"

' redim without preserve
ReDim m_buffer(0 To new_capacity)
m_capacity = new_capacity
clear

' ToDo : redim with preserving values (at least latest values)
'ReDim Preserve m_buffer(0 To new_capacity)
End Property

Public Property Get value(ByVal offset) As Double
value = m_buffer(offset)
End Property

Public Property Get Mode() As LogMode
Mode = m_mode
End Property

Public Property Let Mode(ByVal new_mode As LogMode)
m_mode = new_mode
End Property


Private Sub clear()
Dim i As Integer
For i = 0 To m_capacity - 1
    m_buffer(i) = 0
Next i
m_index = 0
m_used = 0
m_mode = LogMode.Wrap
End Sub
