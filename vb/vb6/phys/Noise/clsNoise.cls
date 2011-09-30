VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsNoise"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Noise simulator
' =========================

' Simulateur d'un système mono-entrée / mono-sortie
' générant du bruit

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
Dim m_output As Double

'Dim m_absnoise As Double

Public Event InputChanged()

' Constructeur
Private Sub clsNoise_Initialize()
Randomize

'm_absnoise = 0.05
End Sub

' Destructeur
'Private Sub clsNoise_Terminate()
'End Sub

Public Property Let Entree(ByVal new_input As Double)
If m_input <> new_input Then
    m_input = new_input
    RaiseEvent InputChanged
End If
End Property
    
Public Property Get Entree() As Double
Entree = m_input
End Property
            

Public Property Get Sortie() As Double
m_output = noise(m_input, 0.05)
'm_output = noise(m_input, m_absnoise)
Sortie = m_output
End Property


Private Function noise(ByVal val As Double, ByVal absnoise As Double) As Double
noise = val + absnoise * (Rnd() - 0.5) * 2
End Function


'Public Sub Show()
'Debug.Print m_input & " ; " & m_output
'End Sub

