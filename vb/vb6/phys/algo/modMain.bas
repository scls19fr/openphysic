Attribute VB_Name = "modMain"
Sub Main()
'frmMain.Show
'test_fit

test_syslin

End Sub

Private Sub test_syslin()
Dim A(0 To 2, 0 To 2) As Double
Dim B(0 To 2) As Double
Dim x(0 To 2) As Double

A(0, 0) = 1
A(0, 1) = 2
A(0, 2) = 2
A(1, 0) = 1
A(1, 1) = 3
A(1, 2) = -2
A(2, 0) = 3
A(2, 1) = 5
A(2, 2) = 8

B(0) = 2
B(1) = -1
B(2) = 8


'solve_syslin A, B, x
'Dim i As Integer
'For i = LBound(x) To UBound(x)
'    Debug.Print "x" & i & "=" & x(i)
'Next i
End Sub


Private Sub test_fit()
Dim x(0 To 2) As Double
Dim y(0 To 2) As Double

x(0) = 0
y(0) = 1
x(1) = 1
y(1) = 2
x(2) = 2
y(2) = 3.01

Dim A As Double
Dim B As Double
Dim r As Double
A = 0
B = 0
linear_fit x, y, A, B, r

Debug.Print "y=" & A & "*x+" & B & " ; " & "r=" & r
End Sub

