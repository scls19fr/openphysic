Option Explicit On
Option Strict On

Public Class clsCircularBuffer(Of itemType) ' generics

    ' variable size
    Dim m_capacity As Integer
    Dim m_buffer() As itemType

    Dim m_used As Integer
    Dim m_index As Integer


    Enum LogMode
        Wrap ' overwrite oldest values
        Fill ' launch exception when buffer is full
    End Enum
    Dim m_mode As LogMode

    ' Constructor
    Public Sub New()
        m_capacity = 5
        ReDim m_buffer(0 To m_capacity - 1)

        clear()
    End Sub

    Public Sub addItem(ByVal item As itemType)
        m_buffer(m_index) = item

        If m_used < m_capacity Then
            m_used = m_used + 1
        Else
            m_used = m_capacity
        End If

        m_index = (m_index + 1) Mod m_capacity

        If m_mode = LogMode.Fill And m_used = m_capacity Then
            'Err.Raise(2001, "CircularBuffer", "Memory Full")
            Throw New Exception("Memory Full")
        End If

    End Sub

    Public ReadOnly Property Last() As itemType
        Get
            Return m_buffer((m_index + m_capacity - 1) Mod m_capacity)
        End Get
    End Property

    Public ReadOnly Property First() As itemType
        Get
            If m_used < m_capacity Then
                First = m_buffer(0)
            Else
                First = m_buffer(m_index)
            End If
        End Get
    End Property

    Public ReadOnly Property FromLast(ByVal offset As Integer) As itemType
        Get
            If offset >= 0 And offset < m_used Then
                FromLast = m_buffer((m_index + m_capacity - 1 - offset) Mod m_capacity)
            Else
                'Err.Raise(2000, "CircularBuffer", "offset out of bounds")
                Throw New Exception("offset out of bounds")
            End If
        End Get
    End Property

    Public ReadOnly Property FromFirst(ByVal offset As Integer) As itemType
        Get
            If offset >= 0 And offset < m_used Then
                If m_used < m_capacity Then
                    FromFirst = m_buffer(offset)
                Else
                    FromFirst = m_buffer((m_index + offset) Mod m_capacity)
                End If
            Else
                'Err.Raise(2000, "CircularBuffer", "offset out of bounds")
                Throw New Exception("offset out of bounds")
            End If
        End Get
    End Property


    Public Property Capacity() As Integer
        Get
            Return m_capacity
        End Get
        Set(ByVal new_capacity As Integer)
            ReDim m_buffer(0 To new_capacity)
            m_capacity = new_capacity
            clear()
        End Set
    End Property

    Public ReadOnly Property Used() As Integer
        Get
            Return m_used
        End Get
    End Property

    Public ReadOnly Property value(ByVal offset As Integer) As itemType
        Get
            Return m_buffer(offset)
        End Get
    End Property

    Public Property Mode() As LogMode
        Get
            Return m_mode
        End Get
        Set(ByVal new_mode As LogMode)
            m_mode = new_mode
        End Set
    End Property


    Private Sub clear()
        'Dim i As Integer
        'For i = 0 To m_capacity - 1
        'm_buffer(i) = DBNull 'itemType
        'Next i
        m_index = 0
        m_used = 0
        m_mode = LogMode.Wrap
    End Sub

End Class
