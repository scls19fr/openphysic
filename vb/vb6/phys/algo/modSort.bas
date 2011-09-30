Attribute VB_Name = "modSort"
Option Explicit

' sort = tri de tableau
' http://fr.wikipedia.org/wiki/Algorithme_de_tri
Public Sub sort(ByRef t() As Double)
'bubble_sort t
selection_sort t
End Sub


' tri à bulles / bubble sort
Public Sub bubble_sort(ByRef t() As Double)
Dim temp As Double
Dim i, perm As Integer
Do
perm = 0
    For i = LBound(t) To UBound(t) - 1
        If t(i + 1) < t(i) Then
            perm = perm + 1
            temp = t(i + 1)
            t(i + 1) = t(i)
            t(i) = temp
        End If
    Next i
Loop While perm <> 0
End Sub

' selection sort = tri par sélection
Public Sub selection_sort(ByRef t() As Double)
Dim i, j, imin As Integer
Dim temp As Double
For i = LBound(t) To UBound(t)
    imin = i
    For j = i + 1 To UBound(t)
        If t(j) < t(imin) Then
            imin = j
        End If
    Next j
 
    If imin <> i Then
        temp = t(i)
        t(i) = t(imin)
        t(imin) = temp
    End If
Next i
End Sub


