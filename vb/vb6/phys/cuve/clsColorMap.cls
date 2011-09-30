VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsColorMap"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' ColorMap
' ========

' Table index-couleur pour applications scientifiques
' Permet d'associer à un nb (entre 0 et 1) une couleur
' afin de réaliser des dégradés pour mettre en évidence
' (à l'aide de couleurs) des résultats numériques

' Sébastien CELLES
' IUT de Poitiers
' Département Génie Thermique et Energie
' s.celles at gmail.com


' Propriétés
'  colorAt(index) (en lecture) permet d'obtenir une couleur à l'aide d'un index (0-1)
'  colorAt(index)=color (en écriture) permet de définir une couleur dans la table des couleurs
'    Limitation : attention lors de la définition de la colormap
'    les couleurs doivent être données dans l'ordre croissant de l'index
'    le premier index doit être 0
'    le dernier index doit être 1

Option Explicit

Dim m_colors() As Long
Dim m_index() As Double
Dim m_size As Integer

Private Sub Class_Initialize()
m_size = 0
End Sub

Public Property Get colorAt(ByVal index As Double) As Long
' Dépassement limites index
'test_index_limit (index) ' leve exception
' saturation à 0 ou 1
If index < 0 Then
    index = 0
ElseIf index > 1 Then
    index = 1
End If

'colorAt = vbRed * (1 - index)

If m_index(m_size - 1) <> 1 Then
    Err.Raise 2002, "ColorMap", "Le dernier index doit être 1"
End If

Dim i As Integer
For i = 0 To m_size - 2
    If index >= m_index(i) And index <= m_index(i + 1) Then
        Exit For
    End If
Next i

'Debug.Print i

Dim R1 As Integer
Dim G1 As Integer
Dim B1 As Integer
Dim R2 As Integer
Dim G2 As Integer
Dim B2 As Integer
Dim R As Integer
Dim G As Integer
Dim B As Integer
getRGB m_colors(i), R1, G1, B1
getRGB m_colors(i + 1), R2, G2, B2

R = (R2 - R1) / (m_index(i + 1) - m_index(i)) * (index - m_index(i)) + R1
G = (G2 - G1) / (m_index(i + 1) - m_index(i)) * (index - m_index(i)) + G1
B = (B2 - B1) / (m_index(i + 1) - m_index(i)) * (index - m_index(i)) + B1
colorAt = getColor(R, G, B)
End Property
            
Public Property Let colorAt(ByVal index As Double, ByVal color As Long)
test_index_limit (index)

If m_size <> 0 Then
    If index <= m_index(m_size - 1) Then
        Err.Raise 2001, "ColorMap", "Les index doivent être donnés dans l'ordre croissant"
    End If
Else
    If index <> 0 Then
        Err.Raise 2003, "ColorMap", "Le premier index doit être 0"
    End If
End If

m_size = m_size + 1

ReDim Preserve m_colors(0 To m_size - 1)
ReDim Preserve m_index(0 To m_size - 1)

m_index(m_size - 1) = index
m_colors(m_size - 1) = color
End Property

Public Sub PrintDebug()
Dim i As Integer
For i = 0 To m_size - 1
    Debug.Print m_index(i) & " : " & m_colors(i)
Next i
End Sub

Public Sub test_index_limit(ByVal index As Double)
If index < 0 Or index > 1 Then
    Err.Raise 2000, "ColorMap", "Un index doit toujours être compris entre 0 et 1"
End If
End Sub



