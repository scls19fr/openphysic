Attribute VB_Name = "modBitManipulation"
'*----------------------------------------------------------*
'* Name       : BitSet                                      *
'*----------------------------------------------------------*
'* Purpose    : Sets a given Bit in Number                  *
'*----------------------------------------------------------*
Public Function BitSet(Number As Long, _
                       ByVal Bit As Long) As Long
  If Bit = 31 Then
    Number = &H80000000 Or Number
  Else
    Number = (2 ^ Bit) Or Number
  End If

  BitSet = Number
End Function


'*----------------------------------------------------------*
'* Name       : BitClear                                    *
'*----------------------------------------------------------*
'* Purpose    : Clears a given Bit in Number                *
'*----------------------------------------------------------*
Public Function BitClear(Number As Long, _
                         ByVal Bit As Long) As Long
  If Bit = 31 Then
    Number = &H7FFFFFFF And Number
  Else
    Number = ((2 ^ Bit) Xor &HFFFFFFFF) And Number
  End If

  BitClear = Number
End Function


'*----------------------------------------------------------*
'* Name       : BitIsSet                                    *
'*----------------------------------------------------------*
'* Purpose    : Test if bit 0 to bit 31 is set              *
'*----------------------------------------------------------*
Public Function BitIsSet(ByVal Number As Long, _
                         ByVal Bit As Long) As Boolean
  BitIsSet = False

  If Bit = 31 Then
    If Number And &H80000000 Then BitIsSet = True
  Else
    If Number And (2 ^ Bit) Then BitIsSet = True
  End If
End Function




