Attribute VB_Name = "modSysLin"
Option Explicit

' méthode du pivot de Gauss (Élimination de Gauss-Jordan)
' système de Cramer

Public Sub solve_syslin(ByRef A() As Double, ByRef B() As Double, ByRef x() As Double)
Dim i As Integer
Dim j As Integer
Dim m As Integer
Dim n As Integer
Dim k As Integer
i = 1
j = 1
While i <> m And j <> n
  'Find pivot in column j, starting in row i:
  maxi = i
  For k = i + 1 To m
    If Abs(A(k, j)) > Abs(A(maxi, j)) Then
      maxi = k
    End If
  Next k
  If A(maxi, j) <> 0 Then
    '->swap rows i and maxi, but do not change the value of i
    'Now A[i,j] will contain the old value of A[maxi,j].
    '->divide each entry in row i by A[i,j]
    'Now A[i,j] will have the value 1.
    For u = i + 1 To m
      '->subtract A[u,j] * row i from row u
      'Now A[u,j] will be 0, since A[u,j] - A[i,j] * A[u,j] = A[u,j] - 1 * A[u,j] = 0.
    Next u
    i = i + 1
  End If
  j = j + 1
Do
End Sub

'Public Function det(ByRef A() As Double) As Double
'End Function

