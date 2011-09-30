VERSION 5.00
Object = "{AAF8CCB7-4AD9-4715-AA80-F6826150D73B}#4.0#0"; "Led.ocx"
Begin VB.UserControl AfficheurOctet 
   BackStyle       =   0  'Transparent
   ClientHeight    =   1830
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4695
   ScaleHeight     =   1830
   ScaleWidth      =   4695
   Begin LightEmittingDiode.Led Led1 
      Height          =   255
      Index           =   0
      Left            =   2520
      TabIndex        =   0
      Top             =   0
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   450
   End
   Begin LightEmittingDiode.Led Led1 
      Height          =   255
      Index           =   1
      Left            =   2160
      TabIndex        =   1
      Top             =   0
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   450
   End
   Begin LightEmittingDiode.Led Led1 
      Height          =   255
      Index           =   2
      Left            =   1800
      TabIndex        =   2
      Top             =   0
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   450
   End
   Begin LightEmittingDiode.Led Led1 
      Height          =   255
      Index           =   3
      Left            =   1440
      TabIndex        =   3
      Top             =   0
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   450
   End
   Begin LightEmittingDiode.Led Led1 
      Height          =   255
      Index           =   4
      Left            =   1080
      TabIndex        =   4
      Top             =   0
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   450
   End
   Begin LightEmittingDiode.Led Led1 
      Height          =   255
      Index           =   5
      Left            =   720
      TabIndex        =   5
      Top             =   0
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   450
   End
   Begin LightEmittingDiode.Led Led1 
      Height          =   255
      Index           =   6
      Left            =   360
      TabIndex        =   6
      Top             =   0
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   450
   End
   Begin LightEmittingDiode.Led Led1 
      Height          =   255
      Index           =   7
      Left            =   0
      TabIndex        =   7
      Top             =   0
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   450
   End
End
Attribute VB_Name = "AfficheurOctet"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

' Afficheur 8 bits
' ================

' propriétés
'  ColorON : couleur de toutes les LED allumées
'  ColorOFF : couleur de toutes les LED éteintes
'  N : nombre à afficher / nombre affiché

Option Explicit

Const Nbits = 8

Dim m_N As Byte ' nb à afficher (sur 8 bits)

Dim i As Integer

' couleur de toutes les leds
Dim m_ColorOFF As OLE_COLOR
Dim m_ColorON As OLE_COLOR

' Couleur par défault
'Const m_def_ColorOFF = &H4080& ' rouge foncé
'Const m_def_ColorON = &HFF& ' rouge clair
Const m_def_ColorOFF = &H8000& ' vert foncé
Const m_def_ColorON = &HFF00& ' vert clair

Private Sub UserControl_Initialize()
    'Debug.Print "Initialize"
    afficher
End Sub

Private Sub éteindre_toutes()
    For i = 0 To Nbits - 1
        Led1(i).éteindre
    Next i
    afficher
End Sub

Private Sub allumer_toutes()
    For i = 0 To Nbits - 1
        Led1(i).allumer
    Next i
    afficher
End Sub

Public Property Let N(num As Byte)
    'Debug.Print "Let N"

    m_N = num
    PropertyChanged N
    afficher
End Property

Public Property Get N() As Byte
    N = m_N
End Property

Private Sub afficher()
    'Debug.Print "afficher"
    
    Dim N As Byte
    N = m_N ' copie afin de ne pas modifier la valeur de m_N
    For i = Nbits - 1 To 0 Step -1
        If N >= 2 ^ i Then ' bit à 1
            N = N - 2 ^ i
            Led1(i).allumer
        Else ' bit à 0
            Led1(i).éteindre
        End If
    Next i
End Sub

Private Sub modif_couleurs()
    For i = Nbits - 1 To 0 Step -1
        Led1(i).ColorON = Me.ColorON
        Led1(i).ColorOFF = Me.ColorOFF
    Next i
End Sub


Public Property Let ColorON(new_color As OLE_COLOR)
    'Debug.Print "Let ColorON"

    m_ColorON = new_color
    PropertyChanged ColorON
    modif_couleurs
    afficher
End Property

Public Property Get ColorON() As OLE_COLOR
    ColorON = m_ColorON
End Property

Public Property Let ColorOFF(new_color As OLE_COLOR)
    'Debug.Print "Let ColorOFF"

    m_ColorOFF = new_color
    PropertyChanged ColorOFF
    modif_couleurs
    afficher
End Property

Public Property Get ColorOFF() As OLE_COLOR
    ColorOFF = m_ColorOFF
End Property

' Permet de savoir si un bit est activé ou pas
' (mis en Private au lieu de Public)
' Cette propriété est volontairement désactivée
' afin ne pas faciliter la vie aux élèves
Public Property Get Bit(thisbit As Byte) As Boolean
    Bit = Led1(thisbit).Etat
End Property

Public Property Let Bit(thisbit As Byte, new_val As Boolean)
    If (Led1(thisbit).Etat = True And new_val = False) Then
        m_N = m_N - 2 ^ thisbit
    End If
    
    If (Led1(thisbit).Etat = False And new_val = True) Then
        m_N = m_N + 2 ^ thisbit
    End If
    
    PropertyChanged Bit(thisbit)

    afficher
End Property


' Initialise les propriétés
'(lorsqu'on place un contrôle utilisateur sur une feuille)
Private Sub UserControl_InitProperties()
    'Debug.Print "InitProperties"
    
    m_ColorON = m_def_ColorON
    m_ColorOFF = m_def_ColorOFF
    
    afficher
End Sub

' Chargement des propriétés par défault
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    'Debug.Print "ReadProperties"
    
    m_ColorON = PropBag.ReadProperty("ColorON", m_def_ColorON)
    m_ColorOFF = PropBag.ReadProperty("ColorOFF", m_def_ColorOFF)
    
    For i = 0 To Nbits - 1
        Led1(i).ColorOFF = m_ColorOFF
        Led1(i).ColorON = m_ColorON
    Next i
End Sub

' Sauvegarde des propriétés
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    Debug.Print "WriteProperties"
    
    Call PropBag.WriteProperty("ColorON", m_ColorON, m_def_ColorON)
    Call PropBag.WriteProperty("ColorOFF", m_ColorOFF, m_def_ColorOFF)
    'afficher
End Sub


Private Sub UserControl_Paint()
    Debug.Print "Paint"
    afficher
End Sub
