VERSION 5.00
Begin VB.UserControl ctlSecondOrder 
   BackColor       =   &H00FFFF00&
   ClientHeight    =   1140
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4830
   ScaleHeight     =   1140
   ScaleWidth      =   4830
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   2880
      Top             =   0
   End
   Begin VB.TextBox txtInput 
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   600
      Width           =   2175
   End
   Begin VB.Label lblOutput 
      Height          =   375
      Left            =   2520
      TabIndex        =   4
      Top             =   600
      Width           =   2175
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Sortie"
      Height          =   255
      Left            =   2520
      TabIndex        =   2
      Top             =   360
      Width           =   1215
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Entree"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   360
      Width           =   1215
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Simulateur"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4575
   End
End
Attribute VB_Name = "ctlSecondOrder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' SecondOrder SISO simulator
' ==========================

' Simulateur d'un système mono-entrée / mono-sortie
' linéaire et du 2nd ordre

' Sébastien CELLES
' IUT de Poitiers
' Département Génie Thermique et Energie
' s.celles at gmail.com


' Propriétés
'  Entree (en lecture/écriture) : entrée du procédé
'  Sortie (uniquement en lecture) : sortie du procédé

' Evènements
'  InputChanged : changement de la valeur à l'entrée du procédé

Option Explicit


Dim m_input As Double

' y'' + b y' + c y = d ou y'' + 2m*w0^2 y' + w0^2 y = K*w0^2 e
' on pose u1=y et u2=y'

' u1' = u2
' u2' = d - b u2 - c u1

' (u1-u1_old)/delta_t = u2
'  -> u1 = u2*delta_t+u1_old

Const b As Double = 1
Const c As Double = 1
Dim d As Double

Dim m_u1 As Double
Dim m_u1_old As Double
Dim m_u2 As Double
Dim m_u2_old As Double

Const m_delta_t As Integer = 100 ' ms

Public Event InputChanged()

Private Sub UserControl_Initialize()
Timer1.Interval = m_delta_t
Timer1.Enabled = True
End Sub

Private Sub Afficher()
txtInput.Text = CStr(m_input)
lblOutput.Caption = CStr(m_u1)
End Sub

Private Sub Timer1_Timer()
d = m_input

m_u1_old = m_u1
m_u2_old = m_u2

' calculate output
m_u1 = m_u2_old * (m_delta_t / 1000#) + m_u1_old
m_u2 = (d - b * m_u2_old - c * m_u1_old) * (m_delta_t / 1000#) + m_u2_old

Afficher
End Sub

Public Property Let Entree(ByVal new_input As Double)
If m_input <> new_input Then
    m_input = new_input
    RaiseEvent InputChanged
End If
Afficher
End Property
    
Public Property Get Entree() As Double
Entree = m_input
End Property
            
Public Property Get Sortie() As Double
Sortie = m_u1
End Property

Private Sub txtInput_Change()
Entree = CDbl(txtInput.Text)
End Sub

