' FirstOrder SISO simulator
' =========================

' Simulateur d'un système mono-entrée / mono-sortie
' linéaire et du 1er ordre

' Sébastien CELLES
' IUT de Poitiers
' Département Génie Thermique et Energie
' s.celles at gmail.com


' Propriétés
'  Input (en lecture/écriture) : entrée du procédé
'  Output (uniquement en lecture) : sortie du procédé

' Evènements
'  InputChanged : changement de la valeur à l'entrée du procédé

Public Class ctlFirstOrder

    Dim m_input As Double
    Dim m_output As Double
    Dim m_output_old As Double

    Const m_delta_t As Integer = 100

    Const m_K As Double = 1
    Const m_tau As Double = 2 ' seconds

    Public Event InputChanged()

    Private Sub ctlFirstOrder_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Timer1.Enabled = True
    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        'Beep()

        ' calculate output
        m_output_old = m_output
        '
        ' O(p) / I(p) = K / (1 + tau p)

        ' Method 1
        ' O(p) * (1 + tau p) = K I(p)
        ' o(t) + tau * do/dt = K i(t)
        ' with do/dt = ( o(t) - o(t-delta_t) ) / delta_t
        ' we get o(t)=f(K,tau,i,o(t-delta_t))
        m_output = (m_K * m_input + 1000 * m_tau / CDbl(m_delta_t) * m_output_old) / (1 + 1000 * m_tau / CDbl(m_delta_t))

        ' Method 2
        ' do/dt = K/tau i(t) - o(t)
        '
        ' -i-->*K/tau---->+ --|intgrate|---- o
        '                 -              |
        '                 ^--o-----------
        ' integrate do/dt to get o(t) (using trapezium rule or Simpson's Rule)
        ' ToFix
        'dodt = input * K / tau - output
        'output = CDbl(delta_t) / (2.0 * 1000.0) * (dodt + dodt_old)
        'dodt_old = dodt

        Afficher()
    End Sub


    Public Property Input() As Double
        Get
            Return m_input
        End Get
        Set(ByVal new_input As Double)
            If m_input <> new_input Then
                m_input = new_input
                RaiseEvent InputChanged()
            End If
            Afficher()
            'Refresh()
        End Set
    End Property

    Public ReadOnly Property Output() As Double
        Get
            Return m_output
        End Get
    End Property

    Private Sub Afficher()
        txtInput.Text = CStr(input)
        lblOutput.Text = CStr(output)
    End Sub



    ' ToDo
    '
    'Public Overloads Shared Function Differentiate( _
    '    ByVal inputData As Double(), _
    '    ByVal dt As Double, _
    '    ByVal initialCondition As Double, _
    '    ByVal finalCondition As Double _
    ') As Double()
    'Differentiate = System.DBNull
    'End Function


    'Public Shared Function Integrate( _
    '    ByVal inputData As Double(), _
    '    ByVal dt As Double, _
    '    ByVal initialCondition As Double, _
    '    ByVal finalCondition As Double _
    ') As Double()
    'Integrate=
    'End Function

End Class
