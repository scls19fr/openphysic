Attribute VB_Name = "modColor"
Option Explicit

Public Sub getRGB(ByVal color As Long, ByRef R As Integer, ByRef G As Integer, ByRef B As Integer)
R = color And &HFF&
G = (color And &HFF00&) \ &H100&
B = (color And &HFF0000) \ &H10000
End Sub

Public Function getColor(ByVal R As Integer, ByVal G As Integer, ByVal B As Integer) As Long
getColor = CLng(R) + CLng(G) * &H100 + CLng(B) * &H10000
End Function

