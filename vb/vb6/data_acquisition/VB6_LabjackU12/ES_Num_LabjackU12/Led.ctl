VERSION 5.00
Begin VB.UserControl Led 
   BackStyle       =   0  'Transparent
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Shape shaLed 
      BackColor       =   &H00004080&
      BackStyle       =   1  'Opaque
      Height          =   3615
      Left            =   0
      Shape           =   3  'Circle
      Top             =   0
      Width           =   4815
   End
End
Attribute VB_Name = "Led"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Diode électroluminescente DEL
' =============================

' Sébastien CELLES
' IUT de Poitiers
' Département Génie Thermique et Energie
' s.celles at gmail.com


' Méthodes publiques
'  allumer : allume la LED
'  éteindre : éteint la LED
'  inverser : inverse l'état de la LED

' Propriétés (en lecture/écriture)
'  ColorON : couleur lorsque la LED est allumée
'  ColorOFF : couleur lorsque la LED est éteinte
'  Etat : état de la LED (éteinte ou allumée)

' Evènements
'  Click : clic sur la LED
'  Change : changement d'état de la LED


' ToDo : Color = ColorON et calcul automatique de ColorOFF

'Exemples de conception d'objets ActiveX
'http://pages.cpsc.ucalgary.ca/~saul/vb_examples/tutorial10/activex01.html
'http://fred.just.free.fr/francais/progs/ColorBar.html

Option Explicit

Event Click()
Event Change()

' Couleur éteint/allumé
Dim m_ColorOFF As OLE_COLOR
Dim m_ColorON As OLE_COLOR

' Couleur par défault
'Const m_def_ColorOFF = &H4080& ' rouge foncé
'Const m_def_ColorON = &HFF& ' rouge clair
Const m_def_ColorOFF = &H8000& ' vert foncé
Const m_def_ColorON = &HFF00& ' vert clair

' Etat de la LED
Dim m_Etat As Boolean ' True=allumée False=éteinte

' Etat de la LED par défault
Const m_def_Etat = False ' LED éteinte par défault

Private Sub UserControl_Initialize()
    'Debug.Print "Initialize"
    afficher
End Sub

Public Property Let Etat(new_etat As Boolean)
    m_Etat = new_etat
    PropertyChanged "Etat"
    afficher
End Property

Public Property Get Etat() As Boolean
    Etat = m_Etat
End Property

Public Property Let ColorON(new_color As OLE_COLOR)
    m_ColorON = new_color
    PropertyChanged "ColorON"
    afficher
End Property

Public Property Get ColorON() As OLE_COLOR
    ColorON = m_ColorON
End Property

Public Property Let ColorOFF(new_color As OLE_COLOR)
    m_ColorOFF = new_color
    PropertyChanged "ColorOFF"
    afficher
End Property

Public Property Get ColorOFF() As OLE_COLOR
    ColorOFF = m_ColorOFF
End Property

Public Sub allumer()
    If Not m_Etat Then ' LED éteinte
        RaiseEvent Change
    End If
    
    m_Etat = True
    
    afficher
End Sub

Public Sub éteindre()
    If m_Etat Then ' LED Allumée
        RaiseEvent Change
    End If

    m_Etat = False
    
    afficher
End Sub

Public Sub inverser()
    RaiseEvent Change
    
    m_Etat = Not m_Etat
    
    afficher
End Sub

Private Sub UserControl_Paint()
    afficher
End Sub

' Redimensionnement de la LED
Private Sub UserControl_Resize()
    shaLed.Width = Width
    shaLed.Height = Height
End Sub

' Modifie la couleur de la LED en fonction
' de son état
Private Sub afficher()
    If m_Etat Then
        shaLed.BackColor = m_ColorON
    Else
        shaLed.BackColor = m_ColorOFF
    End If
End Sub

' Transmission de l'évènement Click
Private Sub shaLED_Click()
    RaiseEvent Click
End Sub

' Initialise les propriétés
'(lorsqu'on place un contrôle utilisateur sur une feuille)
Private Sub UserControl_InitProperties()
    'Debug.Print "InitProperties"
    m_ColorON = m_def_ColorON
    m_ColorOFF = m_def_ColorOFF
    m_Etat = m_def_Etat
End Sub

' Chargement des propriétés par défault
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    'Debug.Print "ReadProperties"
    m_ColorON = PropBag.ReadProperty("ColorON", m_def_ColorON)
    m_ColorOFF = PropBag.ReadProperty("ColorOFF", m_def_ColorOFF)
    m_Etat = PropBag.ReadProperty("Etat", m_def_Etat)
End Sub

' Sauvegarde des propriétés
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    'Debug.Print "WriteProperties"
    Call PropBag.WriteProperty("ColorON", m_ColorON, m_def_ColorON)
    Call PropBag.WriteProperty("ColorOFF", m_ColorOFF, m_def_ColorOFF)
    Call PropBag.WriteProperty("Etat", m_Etat, m_def_Etat)
End Sub

