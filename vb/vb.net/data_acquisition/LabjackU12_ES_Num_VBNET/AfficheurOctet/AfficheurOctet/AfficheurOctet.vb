' Afficheur 8 bits
' ================

' Sébastien CELLES
' IUT de Poitiers
' Département Génie Thermique et Energie
' s.celles at gmail.com


' Propriétés (en lecture/écriture)
'  Couleur : couleur de toutes les LED (allumées)
'  N : nombre à afficher / nombre affiché


' Informations utiles
' Se passer des groupes de contrôles (migration VB6->VB.Net)
'  http://plasserre.developpez.com/v3-9.htm

Option Explicit On
Option Strict On

Public Class AfficheurOctet
    Const Nbits As Integer = 8

    Dim Leds(Nbits - 1) As Led.Led

    Dim m_N As Byte ' nb à afficher (sur 8 bits)
    Dim i As Integer
    ' couleur de toutes les leds (lorsqu'elles sont allumées)
    Dim m_Couleur As Color

    Dim lay As TableLayoutPanel

    Private Sub AfficheurOctet_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'FlowLayoutPanel1.FlowDirection = FlowDirection.RightToLeft
        'layout.
        lay = New TableLayoutPanel
        'lay.BackColor = Color.Red
        lay.SuspendLayout()

        lay.Dock = DockStyle.Fill
        lay.ColumnCount = 8
        lay.RowCount = 2

        lay.RowStyles.Add(New RowStyle(SizeType.Percent, 100.0!))
        'lay.RowStyles.Add(New RowStyle(SizeType.Percent, 100.0!))
        'lay.RowStyles.Add(New RowStyle(SizeType.Absolute, 200.0!))

        For i = 0 To Nbits - 1
            lay.ColumnStyles.Add(New ColumnStyle(SizeType.Percent, 12.5!))
            Leds(i) = New Led.Led
            'Leds(i).Anchor = AnchorStyles.Right And AnchorStyles.Left
            'Leds(i).Anchor = AnchorStyles.Top And AnchorStyles.Bottom And AnchorStyles.Right And AnchorStyles.Left
            Leds(i).Dock = DockStyle.Fill    'DockStyle.Fill
            lay.Controls.Add(Leds(i), Nbits - 1 - i, 0)
        Next i

        Me.Controls.Add(Me.lay)
        lay.ResumeLayout()

        Me.Couleur = Color.FromArgb(0, 255, 0) ' vert
        'Me.Couleur = Color.FromArgb(255, 0, 0) ' rouge
        'Me.Couleur = Color.FromArgb(0, 0, 255) ' bleu
        Me.N = 0

        'Leds(0).Allumer()
        'Leds(7).Eteindre()

    End Sub


    Private Sub Eteindre_toutes()
        For Each ctl As Led.Led In lay.Controls
            ctl.Eteindre()
        Next
        afficher()
    End Sub

    Private Sub Allumer_toutes()
        For Each ctl As Led.Led In lay.Controls
            ctl.Allumer()
        Next
        afficher()
    End Sub

    Public Property N() As Byte
        Get
            N = m_N
        End Get
        Set(ByVal value As Byte)
            If m_N <> value Then
                m_N = value
                'PropertyChanged N
            End If
            afficher()
        End Set
    End Property

    Private Sub afficher()
        'Debug.Print "afficher"
        Dim N As Byte
        N = m_N ' copie afin de ne pas modifier la valeur de m_N
        Dim i As Integer
        For i = Nbits - 1 To 0 Step -1
            If N >= 2 ^ i Then ' bit à 1
                Leds(i).Allumer()
                N = N - CByte(2 ^ i)
            Else ' bit à 0
                Leds(i).Eteindre()
            End If
        Next i
    End Sub

    Public Property Couleur() As Color
        Get
            Couleur = m_Couleur
        End Get
        Set(ByVal value As Color)
            If value <> m_Couleur Then
                m_Couleur = value
                Dim i As Integer
                For i = 0 To Nbits - 1
                    Leds(i).Couleur = m_Couleur
                Next i
                ' PropertyChanged
                afficher()
            End If
        End Set
    End Property

    ' Permet de savoir si un bit est activé ou pas
    ' Cette propriété peut-être volontairement désactivée
    ' afin ne pas faciliter la vie aux élèves
    ' en mettant Private au lieu de Public
    Public Property Bit(ByVal thisbit As Byte) As Boolean
        Get
            Bit = CBool(Leds(thisbit).Etat)
        End Get
                Set(ByVal new_val As Boolean)
            If (Leds(thisbit).Etat = Led.Led.LED.Allumee And new_val = False) Then
                m_N = m_N - CByte(2 ^ thisbit)
            End If
            If (Leds(thisbit).Etat = Led.Led.LED.Eteinte And new_val = True) Then
                m_N = m_N + CByte(2 ^ thisbit)
            End If
            'PropertyChanged(Bit(thisbit))
            afficher()
        End Set
    End Property

    '    Private Sub FlowLayoutPanel1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles FlowLayoutPanel1.Click
    'Debug.Print("Click on the layout")
    'Debug.Print(N.ToString)
    'Debug.Print(Bit(2).ToString)
    'Bit(7) = True
    'Bit(1) = False
    'afficher()
    'Debug.Print(N.ToString)
    'End Sub


End Class