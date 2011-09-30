VERSION 5.00
Begin VB.UserControl ctlFirstOrder 
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
Attribute VB_Name = "ctlFirstOrder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' FirstOrder SISO simulator
' =========================

' Simulateur d'un système mono-entrée / mono-sortie
' linéaire et du 1er ordre

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
'Dim m_input_noisy As Double
'Dim m_input_old As Double

Dim m_output As Double
Dim m_output_old As Double

Const m_delta_t As Integer = 100 ' ms

Const m_K As Double = 1
Const m_tau As Double = 2 ' seconds

'Const add_noise As Boolean = True

Public Event InputChanged()





Private Sub UserControl_Initialize()
'Randomize ' for Noise generation

Timer1.Interval = m_delta_t
Timer1.Enabled = True
End Sub

Private Sub Afficher()
txtInput.Text = CStr(m_input)
lblOutput.Caption = CStr(m_output)
End Sub


Private Sub Timer1_Timer()
'Dim temp_input As Double

'm_input_noisy = noise(m_input, 0.05)

'If add_noise Then
'    temp_input = m_input_noisy ' with noise
'Else
'    temp_input = m_input ' without noise
'End If
'txtInput.Text = CStr(temp_input)

' calculate output
m_output_old = m_output
'
' O(p) / I(p) = K / (1 + tau p)
' Method 1
' O(p) * (1 + tau p) = K I(p)
' o(t) + tau * do/dt = K i(t)
' with do/dt = ( o(t) - o(t-delta_t) ) / delta_t
' we get o(t)=f(K,tau,i,o(t-delta_t))

' with or without noise
'm_output = (m_K * temp_input + 1000 * m_tau / CDbl(m_delta_t) * m_output_old) / (1 + 1000 * m_tau / CDbl(m_delta_t))

' without noise
m_output = (m_K * m_input + 1000 * m_tau / CDbl(m_delta_t) * m_output_old) / (1 + 1000 * m_tau / CDbl(m_delta_t))


'm_output = Noise(m_output, 0.05)

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

Afficher

'Debug.Print m_input
End Sub



Public Property Let Entree(ByVal new_input As Double)
If m_input <> new_input Then
    'm_input_old = m_input
    m_input = new_input
    RaiseEvent InputChanged
End If
Afficher
End Property
    
Public Property Get Entree() As Double
Entree = m_input
End Property
            

Public Property Get Sortie() As Double
Sortie = m_output
End Property


Private Sub txtInput_Change()
Entree = CDbl(txtInput.Text)
End Sub

Private Function noise(ByVal val As Double, ByVal absnoise As Double) As Double
noise = val + absnoise * (Rnd() - 0.5) * 2
End Function

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


