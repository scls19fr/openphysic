VERSION 5.00
Object = "{E46BCC02-8469-11D5-B00B-00008654A834}#1.0#0"; "ljackuwx.ocx"
Begin VB.UserControl ES_Analog 
   ClientHeight    =   4185
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   8790
   ScaleHeight     =   4185
   ScaleWidth      =   8790
   Begin LJACKUWXLib.Ljackuwx Ljackuwx1 
      Height          =   495
      Left            =   5520
      TabIndex        =   15
      Top             =   1920
      Visible         =   0   'False
      Width           =   615
      _Version        =   65536
      _ExtentX        =   1085
      _ExtentY        =   873
      _StockProps     =   0
   End
   Begin VB.Frame fraEntreesSortiesAnalogiques 
      BackColor       =   &H00C0FFFF&
      Caption         =   "Entrées/Sorties Analogiques"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1935
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   6855
      Begin VB.Frame fraEntréesAnalogiques 
         BackColor       =   &H00C0E0FF&
         Caption         =   "Entrées analogiques"
         Height          =   615
         Left            =   120
         TabIndex        =   5
         Top             =   960
         Width           =   6255
         Begin VB.ComboBox cboEntréesAnalogiques 
            BackColor       =   &H00FFFFFF&
            Height          =   315
            Left            =   120
            TabIndex        =   14
            Text            =   "Voies?"
            Top             =   240
            Width           =   1095
         End
         Begin VB.TextBox canal_entrée 
            BackColor       =   &H00C0FFC0&
            Height          =   285
            Index           =   7
            Left            =   5640
            TabIndex        =   13
            Text            =   "2"
            Top             =   240
            Width           =   495
         End
         Begin VB.TextBox canal_entrée 
            BackColor       =   &H00C0FFC0&
            Height          =   285
            Index           =   6
            Left            =   5040
            TabIndex        =   12
            Text            =   "2"
            Top             =   240
            Width           =   495
         End
         Begin VB.TextBox canal_entrée 
            BackColor       =   &H00C0FFC0&
            Height          =   285
            Index           =   5
            Left            =   4440
            TabIndex        =   11
            Text            =   "2"
            Top             =   240
            Width           =   495
         End
         Begin VB.TextBox canal_entrée 
            BackColor       =   &H00C0FFC0&
            Height          =   285
            Index           =   4
            Left            =   3840
            TabIndex        =   10
            Text            =   "2"
            Top             =   240
            Width           =   495
         End
         Begin VB.TextBox canal_entrée 
            BackColor       =   &H00C0FFC0&
            Height          =   285
            Index           =   3
            Left            =   3240
            TabIndex        =   9
            Text            =   "2"
            Top             =   240
            Width           =   495
         End
         Begin VB.TextBox canal_entrée 
            BackColor       =   &H00C0FFC0&
            Height          =   285
            Index           =   2
            Left            =   2640
            TabIndex        =   8
            Text            =   "2"
            Top             =   240
            Width           =   495
         End
         Begin VB.TextBox canal_entrée 
            BackColor       =   &H00C0FFC0&
            Height          =   285
            Index           =   1
            Left            =   2040
            TabIndex        =   7
            Text            =   "2"
            Top             =   240
            Width           =   495
         End
         Begin VB.TextBox canal_entrée 
            BackColor       =   &H00C0FFC0&
            Height          =   285
            Index           =   0
            Left            =   1440
            TabIndex        =   6
            Text            =   "2"
            Top             =   240
            Width           =   495
         End
      End
      Begin VB.Frame fraSortiesAnalogiques 
         BackColor       =   &H00C0E0FF&
         Caption         =   "Sorties analogiques"
         Height          =   615
         Left            =   120
         TabIndex        =   1
         Top             =   360
         Width           =   6255
         Begin VB.TextBox canal_sortie 
            BackColor       =   &H00C0C0FF&
            Height          =   285
            Index           =   2
            Left            =   2640
            TabIndex        =   28
            Text            =   "1"
            Top             =   240
            Width           =   495
         End
         Begin VB.TextBox canal_sortie 
            BackColor       =   &H00C0C0FF&
            Height          =   285
            Index           =   3
            Left            =   3240
            TabIndex        =   27
            Text            =   "1"
            Top             =   240
            Width           =   495
         End
         Begin VB.TextBox canal_sortie 
            BackColor       =   &H00C0C0FF&
            Height          =   285
            Index           =   4
            Left            =   3840
            TabIndex        =   26
            Text            =   "1"
            Top             =   240
            Width           =   495
         End
         Begin VB.TextBox canal_sortie 
            BackColor       =   &H00C0C0FF&
            Height          =   285
            Index           =   5
            Left            =   4440
            TabIndex        =   25
            Text            =   "1"
            Top             =   240
            Width           =   495
         End
         Begin VB.TextBox canal_sortie 
            BackColor       =   &H00C0C0FF&
            Height          =   285
            Index           =   6
            Left            =   5040
            TabIndex        =   24
            Text            =   "1"
            Top             =   240
            Width           =   495
         End
         Begin VB.TextBox canal_sortie 
            BackColor       =   &H00C0C0FF&
            Height          =   285
            Index           =   7
            Left            =   5640
            TabIndex        =   23
            Text            =   "1"
            Top             =   240
            Width           =   495
         End
         Begin VB.ComboBox cboSortiesAnalogiques 
            BackColor       =   &H00FFFFFF&
            Height          =   315
            ItemData        =   "ES_Analog.ctx":0000
            Left            =   120
            List            =   "ES_Analog.ctx":0002
            TabIndex        =   4
            Text            =   "Voies?"
            Top             =   240
            Width           =   1095
         End
         Begin VB.TextBox canal_sortie 
            BackColor       =   &H00C0C0FF&
            Height          =   285
            Index           =   0
            Left            =   1440
            TabIndex        =   3
            Text            =   "1"
            Top             =   240
            Width           =   495
         End
         Begin VB.TextBox canal_sortie 
            BackColor       =   &H00C0C0FF&
            Height          =   285
            Index           =   1
            Left            =   2040
            TabIndex        =   2
            Text            =   "1"
            Top             =   240
            Width           =   495
         End
      End
      Begin VB.Label lblNVoie 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "N° voie"
         Height          =   255
         Left            =   240
         TabIndex        =   30
         Top             =   1560
         Width           =   1455
      End
      Begin VB.Label lblNum 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "1"
         Height          =   255
         Index           =   1
         Left            =   2160
         TabIndex        =   29
         Top             =   1560
         Width           =   495
      End
      Begin VB.Label lblNum 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "7"
         Height          =   255
         Index           =   7
         Left            =   5760
         TabIndex        =   22
         Top             =   1560
         Width           =   495
      End
      Begin VB.Label lblNum 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "6"
         Height          =   255
         Index           =   6
         Left            =   5160
         TabIndex        =   21
         Top             =   1560
         Width           =   495
      End
      Begin VB.Label lblNum 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "5"
         Height          =   255
         Index           =   5
         Left            =   4560
         TabIndex        =   20
         Top             =   1560
         Width           =   495
      End
      Begin VB.Label lblNum 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "4"
         Height          =   255
         Index           =   4
         Left            =   3960
         TabIndex        =   19
         Top             =   1560
         Width           =   495
      End
      Begin VB.Label lblNum 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "3"
         Height          =   255
         Index           =   3
         Left            =   3360
         TabIndex        =   18
         Top             =   1560
         Width           =   495
      End
      Begin VB.Label lblNum 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "2"
         Height          =   255
         Index           =   2
         Left            =   2760
         TabIndex        =   17
         Top             =   1560
         Width           =   495
      End
      Begin VB.Label lblNum 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         Height          =   255
         Index           =   0
         Left            =   1560
         TabIndex        =   16
         Top             =   1560
         Width           =   495
      End
   End
   Begin VB.Timer Timer1 
      Left            =   6120
      Top             =   1800
   End
End
Attribute VB_Name = "ES_Analog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
' Labjack U12
' objet ES_Analog (entrée/sortie analogique) pour VB 6
' Sebastien CELLES
' IUT de Poiters
' Département Génie Thermique et Energie

' Propriétés
'  Entrée(i) (Lecture) val = entrée(i)
'  Sortie(i) (Ecriture) sortie(i) = val
'  Nb_entrées_analogiques_max
'  Nb_sorties_analogiques_max
'  Nb_entrées_analogiques_utilisées
'  Nb_sorties_analogiques_utilisées

Option Explicit

Dim i As Integer

' Nb d'entrées/sorties max supportées par cet objet
'nb_es_max = Max(nb_entrées_analogiques_max, nb_sorties_analogiques_max)
Const nb_es_max = 8

' nb d'entrées/sorties analogiques maximum
Dim m_nb_entrées_analogiques_max As Byte
Const m_def_nb_entrées_analogiques_max = 8 ' nb d'entrées analogiques max par défaut
Dim m_nb_sorties_analogiques_max As Byte
Const m_def_nb_sorties_analogiques_max = 2 ' nb de sorties analogiques max par défaut

' nb d'entrées/sorties analogiques utilisées
Dim m_nb_entrées_analogiques_utilisées As Byte
Const m_def_nb_entrées_analogiques_utilisées = 1 ' 8 ou 1
Dim m_nb_sorties_analogiques_utilisées As Byte
Const m_def_nb_sorties_analogiques_utilisées = 1 ' 2 ou 1

Const Tension_Entrée_Analogique_Max = -20
Const Tension_Entrée_Analogique_Min = 20

Const Tension_Sortie_Analogique_Max = 5
Const Tension_Sortie_Analogique_Min = 0

Const Voie0 = 0 ' 0 ou 1 : indice de départ des entrées/sorties


' Stockage des données
Dim entrees_tensions_analogiques(nb_es_max - 1) As Single
Dim sorties_tensions_analogiques(nb_es_max - 1) As Single



Private Sub canal_sortie_Change(Index As Integer)
Dim val As Single

If Not IsNumeric(canal_sortie(Index)) Then
    If canal_sortie(Index).Text <> "-" Then
        canal_sortie(Index).Text = 0
    Else
        val = 0
        ' todo
    End If
Else
    val = CSng(canal_sortie(Index))
End If

val = limitation_tension_sortie(val)
canal_sortie(Index).Text = val
'If val < Tension_Sortie_Analogique_Min Then
'    Erreur ("Erreur tension sortie analogique : " + CStr(val) + " demandé en sortie")
'    canal_sortie(Index).Text = Tension_Sortie_Analogique_Min
'End If

'If val > Tension_Sortie_Analogique_Max Then
'    Erreur ("Erreur tension sortie analogique : " + CStr(val) + " demandé en sortie")
'    canal_sortie(Index).Text = Tension_Sortie_Analogique_Max
'End If

sorties_tensions_analogiques(Index) = val

End Sub





Private Sub UserControl_Initialize()
    'Debug.Print "Initialize"

    'cboEntreesAnalogiques_Click
    'cboSortiesAnalogiques_Click

    Timer1.Enabled = True
    Timer1.Interval = 10

End Sub

Private Sub maj_combo()
    'Debug.Print " maj_combo" + " ; " + CStr(Nb_entrées_analogiques_utilisées) + " ; " + CStr(Nb_sorties_analogiques_utilisées)

    ' Numerotation des voies (début à 0)
    For i = Voie0 To CByte(Nb_entrées_analogiques_max) - 1 + Voie0
        lblNum(i - Voie0).Caption = CStr(i)
    Next i

    ' Remplissage combobox entrées analogiques
    For i = 1 To CByte(Nb_entrées_analogiques_max)
        cboEntréesAnalogiques.AddItem CStr(i) & " entrée(s)"
    Next i
    'cboEntréesAnalogiques.ListIndex = 0

    ' Remplissage combobox sorties analogiques
    For i = 1 To CByte(Nb_sorties_analogiques_max)
        cboSortiesAnalogiques.AddItem CStr(i) & " sortie(s)"
    Next i
    'cboSortiesAnalogiques.ListIndex = 0


    cboEntréesAnalogiques.ListIndex = m_nb_entrées_analogiques_utilisées - 1
    cboSortiesAnalogiques.ListIndex = m_nb_sorties_analogiques_utilisées - 1
End Sub

Private Sub cboEntréesAnalogiques_Click()
    'Debug.Print "cboEntreesAnalogiques_Click"
    m_nb_entrées_analogiques_utilisées = cboEntréesAnalogiques.ListIndex + 1

    For i = 1 To nb_es_max
        ' Initialisation des labels entrées
        canal_entrée(i - 1).Text = ""

        ' Rendre invisible les labels entrées inutiles
        If i <= m_nb_entrées_analogiques_utilisées Then
            canal_entrée(i - 1).Visible = True
            lblNum(i - 1).Visible = True
        Else
            canal_entrée(i - 1).Visible = False
            lblNum(i - 1).Visible = False
        End If
    Next i
End Sub

Private Sub cboSortiesAnalogiques_Click()
    'Debug.Print "cboSortiesAnalogiques_Click"
    m_nb_sorties_analogiques_utilisées = cboSortiesAnalogiques.ListIndex + 1

    For i = 1 To nb_es_max
        canal_sortie(i - 1).Text = "0"

        ' Rendre invisible les labels sorties inutiles
        If i <= m_nb_sorties_analogiques_utilisées Then
            canal_sortie(i - 1).Visible = True
        Else
            canal_sortie(i - 1).Visible = False
        End If
    Next i

End Sub

Private Sub cboEntreesAnalogiques_Change()
    'Debug.Print "cboEntréesAnalogiques_Change"
    m_nb_entrées_analogiques_utilisées = cboEntréesAnalogiques.ListIndex + 1
End Sub

Private Sub cboSortiesAnalogiques_Change()
    'Debug.Print "cboSortiesAnalogiques_Change"
    m_nb_sorties_analogiques_utilisées = cboSortiesAnalogiques.ListIndex + 1
End Sub

' Initialise les propriétés
'(lorsqu'on place un contrôle utilisateur sur une feuille)
Private Sub UserControl_InitProperties()
    'Debug.Print "InitProperties"
    Nb_entrées_analogiques_max = m_def_nb_entrées_analogiques_max
    m_nb_sorties_analogiques_max = m_def_nb_sorties_analogiques_max
    m_nb_entrées_analogiques_utilisées = m_def_nb_entrées_analogiques_utilisées
    m_nb_sorties_analogiques_utilisées = m_def_nb_sorties_analogiques_utilisées
End Sub

' Chargement des propriétés par défault
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    'Debug.Print "ReadProperties"
    m_nb_entrées_analogiques_max = PropBag.ReadProperty("Nb_entrées_analogiques_max", m_def_nb_entrées_analogiques_max)
    m_nb_sorties_analogiques_max = PropBag.ReadProperty("Nb_sorties_analogiques_max", m_def_nb_sorties_analogiques_max)
    m_nb_entrées_analogiques_utilisées = PropBag.ReadProperty("Nb_entrées_analogiques_utilisées", m_def_nb_entrées_analogiques_utilisées)
    m_nb_sorties_analogiques_utilisées = PropBag.ReadProperty("Nb_sorties_analogiques_utilisées", m_def_nb_sorties_analogiques_utilisées)

    maj_combo
End Sub

' Sauvegarde des propriétés
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    'Debug.Print "WriteProperties"
    Call PropBag.WriteProperty("Nb_entrées_analogiques_max", m_nb_entrées_analogiques_max, m_def_nb_entrées_analogiques_max)
    Call PropBag.WriteProperty("Nb_sorties_analogiques_max", m_nb_sorties_analogiques_max, m_def_nb_sorties_analogiques_max)
    Call PropBag.WriteProperty("Nb_entrées_analogiques_utilisées", m_nb_entrées_analogiques_utilisées, m_def_nb_entrées_analogiques_utilisées)
    Call PropBag.WriteProperty("Nb_sorties_analogiques_utilisées", m_nb_sorties_analogiques_utilisées, m_def_nb_sorties_analogiques_utilisées)
End Sub



Private Sub Timer1_Timer()

    acquérir_tensions_analogiques
    ' affichage tensions analogiques
    For i = 0 To Nb_entrées_analogiques_max - 1
        canal_entrée(i) = Format(entrees_tensions_analogiques(i), "###0.00")
    Next i

    sortir_tensions_analogiques

End Sub

' Accesseurs (Get) pour les entrées
' =================================
' voie allant de 1 à 8
'Public Property Get entrée(voie As Byte) As String
'    entrée = canal_entrée(voie - 1).Text
'End Property

' voie allant de 0 à 7
Public Property Get entrée(voie As Byte) As Single
    'entrée = canal_entrée(voie).Text
    entrée = entrees_tensions_analogiques(voie)
End Property


' Modificateurs (Let) pour les sorties
' ====================================
' voie allant de 0 à 7
Public Property Let Sortie(ByVal voie As Byte, ByVal tension As Single)
    Debug.Print tension
    tension = limitation_tension_sortie(tension)
    canal_sortie(voie).Text = CStr(tension)
    PropertyChanged "sortie"
    PropertyChanged "sortie" + CStr(voie)
End Property

' Fonction limitant la valeur de la tension de sortie
' ===================================================
Private Function limitation_tension_sortie(ByVal tension As Single) As Single
    If tension < Tension_Sortie_Analogique_Min Then
        limitation_tension_sortie = Tension_Sortie_Analogique_Min
        Erreur ("Erreur tension sortie analogique : " + CStr(tension) + " demandé en sortie")
    ElseIf tension > Tension_Sortie_Analogique_Max Then
        limitation_tension_sortie = Tension_Sortie_Analogique_Max
        Erreur ("Erreur tension sortie analogique : " + CStr(tension) + " demandé en sortie")
    Else
        limitation_tension_sortie = tension
    End If
End Function


' Accesseur/modificateur nb_entrées_analogiques_max
' =================================================
Public Property Let Nb_entrées_analogiques_max(ByVal New_entrée As Byte)
    m_nb_entrées_analogiques_max = CByte(New_entrée)
    PropertyChanged "Nb_entrées_analogiques_max"
End Property

Public Property Get Nb_entrées_analogiques_max() As Byte
    Nb_entrées_analogiques_max = m_nb_entrées_analogiques_max
End Property

' Accesseur/modificateur nb_sorties_analogiques_max
' =================================================
Public Property Let Nb_sorties_analogiques_max(ByVal New_sortie As Byte)
    m_nb_sorties_analogiques_max = New_sortie
    PropertyChanged "Nb_sorties_analogiques_max"
End Property

Public Property Get Nb_sorties_analogiques_max() As Byte
    Nb_sorties_analogiques_max = m_nb_sorties_analogiques_max
End Property



' Accesseur/modificateur nb_entrées_analogiques_utilisées
' =======================================================
Public Property Let Nb_entrées_analogiques_utilisées(ByVal New_entrée As Byte)
    If New_entrée <= Nb_entrées_analogiques_max Then
        m_nb_entrées_analogiques_utilisées = New_entrée
    Else
        m_nb_entrées_analogiques_utilisées = m_nb_entrées_analogiques_max
        Erreur ("Dépassement de Nb_entrées_analogiques_utilisées")
    End If
    cboEntréesAnalogiques.ListIndex = m_nb_entrées_analogiques_utilisées - 1
    PropertyChanged "Nb_entrées_analogiques_utilisées"
End Property

Public Property Get Nb_entrées_analogiques_utilisées() As Byte
    Nb_entrées_analogiques_utilisées = m_nb_entrées_analogiques_utilisées
End Property

' Accesseur/modificateur nb_sorties_analogiques_utilisées
' =======================================================
Public Property Let Nb_sorties_analogiques_utilisées(ByVal New_sortie As Byte)
    If New_sortie <= m_nb_sorties_analogiques_max Then
        m_nb_sorties_analogiques_utilisées = New_sortie
    Else
        m_nb_sorties_analogiques_utilisées = m_nb_sorties_analogiques_max
        Erreur ("Dépassement de Nb_sorties_analogiques_utilisées")
    End If
    cboSortiesAnalogiques.ListIndex = m_nb_sorties_analogiques_utilisées - 1
    PropertyChanged "Nb_sorties_analogiques_utilisées"
End Property

Public Property Get Nb_sorties_analogiques_utilisées() As Byte
    Nb_sorties_analogiques_utilisées = m_nb_sorties_analogiques_utilisées
End Property


' Partie spécifique à la carte
' ============================

Private Sub acquérir_tensions_analogiques()
'Ljackuwx1 utilisation de l'objet ActiveX fourni par Labjack (et non de la DLL)
    Dim lngIDNum As Long
    Dim lngDemo As Long
    Dim lngStateIO As Long
    Dim lngUpdateIO As Long
    Dim chkLED As Long
    Dim lngNumChannels As Long
    Dim lngCP As Long
    Dim lngGP As Long
    Dim lngDisableCal As Long
    Dim lngOV As Long
    
    Dim lngErrorcode As Long
    
    lngIDNum = -1
    lngDemo = 0
        chkLED = 0
    lngUpdateIO = 0
    lngNumChannels = 4
    lngDisableCal = 0
    
    lngCP = Ljackuwx1.FourPack(0, 1, 2, 3) ' voies
    lngGP = Ljackuwx1.FourPack(0, 0, 0, 0) ' gains
    lngErrorcode = Ljackuwx1.AISampleX(lngIDNum, lngDemo, lngStateIO, lngUpdateIO, _
        chkLED, lngNumChannels, lngCP, lngGP, lngDisableCal, lngOV, _
        entrees_tensions_analogiques(0), entrees_tensions_analogiques(1), entrees_tensions_analogiques(2), entrees_tensions_analogiques(3))

    ' ToDo : traitement d'erreurs

    lngCP = Ljackuwx1.FourPack(4, 5, 6, 7) ' voies
    lngGP = Ljackuwx1.FourPack(0, 0, 0, 0) ' gains
    lngErrorcode = Ljackuwx1.AISampleX(lngIDNum, lngDemo, lngStateIO, lngUpdateIO, _
        chkLED, lngNumChannels, lngCP, lngGP, lngDisableCal, lngOV, _
        entrees_tensions_analogiques(4), entrees_tensions_analogiques(5), entrees_tensions_analogiques(6), entrees_tensions_analogiques(7))

    ' ToDo : traitement d'erreurs
    If lngErrorcode <> 0 Then
        Erreur (Ljackuwx1.GetErrorStringX(lngErrorcode))
    End If
End Sub


Private Sub sortir_tensions_analogiques()
    Dim lngErrorcode As Long
    Dim lngIDNum As Long
    Dim lngDemo As Long
    Dim lngUpdateDigital As Long
    Dim lngTrisD As Long
    Dim lngTrisIO As Long
    Dim lngStateD As Long
    Dim lngStateIO As Long
    Dim dblCount As Double
    Dim lngOV As Long
    Dim lngUpdateIO As Long
    Dim lngNumChannels As Long
    Dim lngDisableCal As Long


    lngIDNum = -1
    lngDemo = 0
    lngUpdateDigital = 1
    lngTrisD = 0
    lngStateD = 0
    lngTrisIO = 0
    lngStateIO = 0
        
    lngErrorcode = Ljackuwx1.AOUpdateX(lngIDNum, lngDemo, lngTrisD, lngTrisIO, _
        lngStateD, lngStateIO, lngUpdateDigital, 0, dblCount, _
        sorties_tensions_analogiques(0), sorties_tensions_analogiques(1))

    ' ToDo : traitement d'erreurs
    If lngErrorcode <> 0 Then
        Erreur (Ljackuwx1.GetErrorStringX(lngErrorcode))
    End If
End Sub


' Gestion des Erreurs
' ===================
Private Sub Erreur(msg As String)
    Debug.Print msg
End Sub

