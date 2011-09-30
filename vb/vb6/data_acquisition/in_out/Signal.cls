VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Signal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' Buffer permettant le stockage d'un signal
' exemple : Buffer circulaire (voir AVRLib de Pascal Stang)
' http://www.mil.ufl.edu/~chrisarnold/components/microcontrollerBoard/AVR/avrlib/docs/html/group__buffer.html

Const Ndefault As Integer = 1000
Dim N As Integer
Private tabSignal(0 To Ndefault) As Double

' constructeur
'N = Ndefault

' effacer le buffer

' modification taille buffer
'N = newN
'Redim

' Ajouter un point (à la fin)
'Public Sub setVal(val As Double)
'End Sub

' Récupérer l'indice du point courant

' Récupérer le point courant

' Récupérer le point n fois avant le point courant


' Sauver le signal dans un fichier

' Lire un signal depuis un fichier

' buffer plein

' buffer circulaire ou pas

' surcharge d'opérateurs
' S1 + S2
' S1 - S2
' k*S1
' S1/k
' S1 + k
' S1 - k
' S1 * S2
' deriv(S1)
' intg(S1)

