' Diode électroluminescente DEL
' =============================

' Sébastien CELLES
' IUT de Poitiers
' Département Génie Thermique et Energie
' s.celles at gmail.com

' Méthodes publiques
'  Allumer : allume la LED
'  Eteindre : éteint la LED
'  Inverser : inverse l'état de la LED

' Propriétés (en lecture/écriture)
'  Couleur : couleur lorsque la LED est allumée
'   (le calcul de la couleur LED éteinte est automatique)
'  Etat : état de la LED (éteinte ou allumée)

' Evènements
'  Click : clic sur la LED
'  EtatChanged : changement d'état de la LED
'  ? CouleurChanged : changement de la couleur de la LED

Option Explicit On
Option Strict On

Imports System.Math ' pour Math.Sqrt

Public Class Led
    ' Couleur éteint/allumé
    Dim m_ColorOFF, m_ColorON As Color
    'Dim m_ColorOFF As Color = Color.FromArgb(128, 0, 0) ' rouge foncé  au lieu de (128,64,0)
    'Dim m_ColorOFF As Color = Color.FromArgb(128, 0, 0) ' rouge foncé  au lieu de (128,64,0)
    'Dim m_ColorON As Color = Color.FromArgb(255, 0, 0) ' rouge vif
    'Dim m_ColorOFF As Color = Color.FromArgb(0, 128, 0) ' vert foncé
    'Dim m_ColorON As Color = Color.FromArgb(0, 255, 0) ' vert vif

    ' Etat de la LED
    Public Enum LED As Integer
        Eteinte ' 0
        Allumee ' 1
    End Enum
    ' Etat de la LED (éteinte par défaut)
    'Dim m_Etat As LED = LED.Allumee
    Dim m_Etat As LED = LED.Eteinte

    Dim g As Graphics

    Public Event EtatChanged()
    Public Event CouleurChanged()
    Public Shadows Event Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
    Public Shadows Event MouseUp(ByVal sender As System.Object, ByVal e As System.EventArgs)

    Public Sub New()

        ' Cet appel est requis par le Concepteur Windows Form.
        InitializeComponent()

        ' Ajoutez une initialisation quelconque après l'appel InitializeComponent().
        Debug.Print("Led")
        Me.Couleur = Color.Red ' Color.FromArgb(255, 0, 0) ' rouge vif
        'Me.Couleur = Color.FromArgb(0, 255, 0) ' vert vif
    End Sub


    Private Sub PictureBox1_Paint(ByVal sender As Object, ByVal e As System.Windows.Forms.PaintEventArgs) Handles PictureBox1.Paint
        g = e.Graphics

        Dim couleur As Color

        If m_Etat = LED.Eteinte Then
            couleur = m_ColorOFF
        Else ' m_Etat = Etat.Allumee
            couleur = m_ColorON
        End If

        Dim brosse As SolidBrush = New SolidBrush(couleur)

        g.FillEllipse(brosse, 0, 0, PictureBox1.Width, PictureBox1.Height)
    End Sub

    Private Sub PictureBox1_MouseUp(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles PictureBox1.MouseUp
        'Debug.Print(String.Format("Button={0} X={1} Y={2}", e.Button, e.X, e.Y))
        Dim Xc, Yc As Double ' Centre
        Xc = CDbl(PictureBox1.Width) / 2.0
        Yc = CDbl(PictureBox1.Height) / 2.0
        Dim d As Double ' distance par rapport au centre
        d = Sqrt((e.X - Xc) ^ 2 + (e.Y - Yc) ^ 2)
        'Debug.Print(String.Format("Distance={0}", d))
        If d <= Min(Xc, Yc) Then
            Debug.Print("In")
            'RaiseEvent Click()
        Else
            Debug.Print("Out")
        End If
    End Sub

    Private Sub PictureBox1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles PictureBox1.Click

    End Sub

    Public Property Etat() As LED
        Get
            Return m_Etat
        End Get
        Set(ByVal new_etat As LED)
            If m_Etat <> new_etat Then
                m_Etat = new_etat
                RaiseEvent EtatChanged()
            End If
            Afficher()
        End Set
    End Property

    Private Function calculer_couleur_off() As Color
        calculer_couleur_off = Color.FromArgb(CInt(m_ColorON.R / 2.0), CInt(m_ColorON.G / 2.0), CInt(m_ColorON.B / 2.0))
    End Function


    Public Property Couleur() As Color
        ' Couleur désigne Couleur ON
        ' Couleur OFF est automatiquement calculé
        Get
            Return m_ColorON
        End Get
        Set(ByVal value As Color)
            If m_ColorON <> value Then
                m_ColorON = value
                RaiseEvent CouleurChanged()
            End If
            m_ColorOFF = calculer_couleur_off()
            Afficher()
        End Set
    End Property

    Public Sub Allumer()
        If m_Etat = LED.Eteinte Then ' LED éteinte
            RaiseEvent EtatChanged()
        End If

        m_Etat = LED.Allumee

        Afficher()
    End Sub

    Public Sub Eteindre()
        If m_Etat = LED.Allumee Then ' LED Allumée
            RaiseEvent EtatChanged()
        End If

        m_Etat = LED.Eteinte

        Afficher()
    End Sub

    Public Sub Inverser()
        RaiseEvent EtatChanged()

        If m_Etat = LED.Allumee Then
            m_Etat = LED.Eteinte
        Else
            m_Etat = LED.Allumee
        End If

        Afficher()
    End Sub

    Public Sub Afficher()
        PictureBox1.Refresh()
    End Sub

    Private Sub Led_Resize(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Resize
        Debug.Print("Resize UserControl")
        Dim d As Integer ' dimension (largeur ou hauteur car carré !!)
        Debug.Print("Resize")
        'd = Max(PictureBox1.Width, PictureBox1.Height)
        d = Min(PictureBox1.Width, PictureBox1.Height)
        Me.Width = d
        Me.Height = d
    End Sub

    Private Sub Led_SizeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.SizeChanged
        Afficher()
    End Sub




End Class
