Attribute VB_Name = "modStat"
Option Explicit

Public Function max(ByRef t() As Double) As Double
Dim i As Integer
Dim nmax As Double
nmax = t(1)
For i = LBound(t) To UBound(t)
    If t(i) >= nmax Then
        nmax = t(i)
    End If
Next i
max = nmax
End Function

Public Function min(ByRef t() As Double) As Double
Dim i As Integer
Dim nmin As Double
nmin = t(1)
For i = LBound(t) To UBound(t)
    If t(i) <= nmin Then
        nmin = t(i)
    End If
Next i
min = nmin
End Function


Public Function sum(ByRef t() As Double) As Double
Dim i As Integer
sum = 0
For i = LBound(t) To UBound(t)
    sum = sum + t(i)
Next i
End Function

Public Function mean(ByRef t() As Double) As Double
mean = sum(t()) / (UBound(t) + 1)
End Function

Public Sub linear_fit(ByRef x() As Double, ByRef y() As Double, ByRef a As Double, ByRef b As Double, ByRef r As Double)
' , Byref y_weight
' , ByRef residue As Double

Dim i As Integer
Dim xmean As Double
Dim ymean As Double
xmean = mean(x)
ymean = mean(y)

' a = sum((xi-xmean)*(yi-ymean)) / (sum((xi-xmean)^2))
' b = ymean - a*xmean

Dim sum_num As Double
Dim sum_denum_a As Double
sum_num = 0
sum_denum_a = 0
Dim sum_denum_ry As Double
'sum_denum_rx = 0
'sum_denum_ry = 0
For i = LBound(x) To UBound(x)
    sum_num = sum_num + (x(i) - xmean) * (y(i) - ymean)
    sum_denum_a = sum_denum_a + (x(i) - xmean) ^ 2
    'sum_denum_rx = sum_denum_rx + (x(i) - xmean) ^ 2
    sum_denum_ry = sum_denum_ry + (y(i) - ymean) ^ 2
Next i
a = sum_num / sum_denum_a
b = ymean - a * xmean
r = sum_num / (Sqr(sum_denum_a) * Sqr(sum_denum_ry))
End Sub
