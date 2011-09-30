' LabjackU12
' E/S numérique

' Sébastien CELLES
' IUT de Poitiers
' Génie Thermique et Energie

' Propriétés
'  Mode(i) : Ecriture (0) ou Lecture (1)
'  Port(i) : valeur présente sur le port (en décimal)

Option Explicit On
Option Strict On

Public Class ES_Num_LabjackU12

    Const nb_ports As Byte = 2 ' nb de ports (de 0 à nb_ports-1)

    Dim m_port(nb_ports - 1) As Byte ' 8 bits (contenu de chaque port)

    Enum EMode
        Lecture
        Ecriture
    End Enum
    Dim m_mode(nb_ports - 1) As EMode ' mode de chaque port (False=écriture ; True=Lecture)


    Public Sub New()

        ' Cet appel est requis par le Concepteur Windows Form.
        InitializeComponent()


    End Sub

    Private Sub GroupBox1_Enter(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles GroupBox0.Enter

    End Sub
End Class
