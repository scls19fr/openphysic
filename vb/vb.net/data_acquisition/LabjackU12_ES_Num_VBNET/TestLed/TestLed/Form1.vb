Public Class Form1

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Me.Led1.Inverser()
        Beep()
    End Sub

    Private Sub Led1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Debug.Print("Click")
        Beep()
    End Sub

    Private Sub Led1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub Led1_CouleurChanged()
        Debug.Print("Couleur changed")
    End Sub

    Private Sub Led1_EtatChanged()
        Debug.Print("Etat Changed")
    End Sub

    Private Sub Led1_Click1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Led1.Click
        Debug.Print("Led click")
    End Sub

    Private Sub Led1_Load_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Led1.Load

    End Sub
End Class
