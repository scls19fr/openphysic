Option Explicit On
Option Strict On

Public Class frmMain

    Dim strMot_A_Trouver As String
    Dim strMot_A_Afficher As String
    Dim strCaractere As String

    Const nb_tentatives_max As Integer = 6

    Private Sub cmdQuitter_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdQuitter.Click
        End
    End Sub

    Private Sub initialiser_jeu()
        Dim i As Integer

        strMot_A_Trouver = "merci"

        strMot_A_Afficher = ""
        For i = 1 To Len(strMot_A_Trouver)
            strMot_A_Afficher = strMot_A_Afficher + "*"
        Next i

        lblMot.Text = strMot_A_Afficher
        lblMessage.Text = "Cliquez sur le bouton Jouer"
        'lblMessage.Text = ""
    End Sub

    Private Sub frmMain_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        initialiser_jeu()
    End Sub

    Private Sub cmdJouer_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdJouer.Click
        initialiser_jeu()

        Dim i, j As Integer

        For i = 1 To nb_tentatives_max
            lblMessage.Text = "Tentative : " + CStr(i) + "/" + CStr(nb_tentatives_max)
            strCaractere = InputBox("Entrez le caractère")
            For j = 1 To 5
                If strCaractere = Mid(strMot_A_Trouver, j, 1) Then
                    Mid(strMot_A_Afficher, j, 1) = strCaractere
                    lblMot.Text = strMot_A_Afficher
                End If
            Next j
            If strMot_A_Afficher = strMot_A_Trouver Or strCaractere = "" Then
                Exit For
            End If
        Next i

        If strMot_A_Afficher <> strMot_A_Trouver Then
            lblMessage.Text = "Perdu après " + CStr(i - 1) + " tentatives"
        Else
            lblMessage.Text = "Gagné après " + CStr(i) + " tentatives"
        End If
    End Sub

End Class
