
ToDo : 

Min Max
MŽthode des moindres carres (approx lin)


http://www.vb-helper.com/howto_min_max_functions.html

The Min and Max functions take ParamArray parameters so you can use them with any number of arguments. These functions simply loop over the values passed to them looking for the smallest/largest.
 

' Return the smallest parameter value.
Private Function Min(ParamArray values() As Variant) As _
    Variant
Dim i As Integer
Dim min_value As Variant

    min_value = values(LBound(values))
    For i = LBound(values) + 1 To UBound(values)
        If min_value > values(i) Then min_value = values(i)
    Next i

    Min = min_value
End Function
' Return the smallest parameter value.
Private Function Max(ParamArray values() As Variant) As _
    Variant
Dim i As Integer
Dim max_value As Variant

    max_value = values(LBound(values))
    For i = LBound(values) + 1 To UBound(values)
        If max_value < values(i) Then max_value = values(i)
    Next i

    Max = max_value
End Function