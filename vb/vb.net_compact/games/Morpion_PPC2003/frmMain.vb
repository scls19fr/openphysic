Public Class frmMain
    Const dimension_default As Integer = 3
    Dim dimension As Integer = dimension_default

    'Dim aJeu(dimension_default, dimension_default) As Integer ' tableau décrivant les pions joués
    Dim aJeu(,) As Integer ' tableau décrivant les pions joués
    ' 0 pas de coup sur cette case
    ' 1 un pion du joueur 1
    ' 2 un pion du joueur 2

    Dim joueur As Integer
    ' joueur=1 ou 2

    Dim etat_de_la_partie As Integer
    ' 0 en cours
    ' 1 partie gagnée par joueur 1
    ' 2 partie gagnée par joueur 2
    ' 3 partie nulle

    Dim nb_coups_restants As Integer = 0

    Dim g As Graphics

    'Dim DrawingMatrix As Drawing2D.Matrix
    'Dim InvDrawingMatrix As Drawing2D.Matrix

    Private Sub frmMain_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'demander_taille()

        'Debug.Print("frmMain_Load")
        'g = picturebox1.

        'txtDimension.Text = dimension_default.ToString
        lblDebug.Visible = False
        lblDebug.Text = ""

        initialiser_partie()
    End Sub

    Private Sub cmdQuitter_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        'Debug.Print("cmdQuitter_Click")
        'End ' pas de End : la version ciblée du .NET Compact Framework ne prend pas en charge l'instruction 'End'
        '
    End Sub

    Private Sub PictureBox1_MouseUp(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles PictureBox1.MouseUp
        'Debug.Print("Bouton:{0} X:{1} Y:{2}", e.Button.ToString, e.X, e.Y)

        'lblDebug.Text = "X:" + e.X.ToString + " Y:" + e.X.ToString

        Dim Xentier, Yentier As Integer

        If e.Button = Windows.Forms.MouseButtons.Left And etat_de_la_partie = 0 Then
            'Dim tabPoint(0) As PointF
            'tabPoint(0) = e.Location
            'tabPoint(0).X = e.X
            'tabPoint(0).Y = e.Y
            'Debug.Print("X:{0} Y:{1}", tabPoint(0).X, tabPoint(0).Y)

            'InvDrawingMatrix.TransformPoints(tabPoint)

            'Xentier = Int((tabPoint(0).X + 100) / 100 - 1)
            'Yentier = Int((tabPoint(0).Y + 100) / 100 - 1)

            Xentier = Int((CSng(dimension) * CSng(e.X)) / CSng(PictureBox1.Width))
            Yentier = Int((CSng(dimension) * CSng(e.Y)) / CSng(PictureBox1.Height))

            'Debug.Print("Xentier:{0} Yentier:{1}", Xentier, Yentier)

            ' En cas de clic sur la limite haute du PictureBox
            If Yentier > dimension - 1 Then
                Yentier = dimension - 1
            End If

            ' En cas de clic sur la limite droite du PictureBox
            If Xentier > dimension - 1 Then
                Xentier = dimension - 1
            End If

            'lblDebug.Text = "Xentier:" & Xentier.ToString & " Yentier:" & Yentier.ToString

            If aJeu(Xentier, Yentier) = 0 Then ' la case est bien vide
                aJeu(Xentier, Yentier) = joueur
                nb_coups_restants -= 1 'nb_coups_restants = nb_coups_restants - 1
                tester_victoire(Xentier, Yentier)
                changer_joueur()
            Else ' la case n'est pas vide
                Beep()
            End If
        End If

        PictureBox1.Refresh()
    End Sub

    Private Sub PictureBox1_Paint(ByVal sender As Object, ByVal e As System.Windows.Forms.PaintEventArgs) Handles PictureBox1.Paint
        'Debug.Print("PictureBox1_Paint")
        g = e.Graphics
        initialiser_affichage(g)
        afficher_jeu(g)
    End Sub

    Private Sub initialiser_affichage(ByRef g As Graphics)
        'g.TranslateTransform(0, PictureBox1.Height)
        'g.ScaleTransform(CSng(PictureBox1.Width) / CSng(dimension * 100), -CSng(PictureBox1.Height) / CSng(dimension * 100))

        'DrawingMatrix = g.Transform ' as Drawing2D.Matrix

        'InvDrawingMatrix = DrawingMatrix.Clone
        'InvDrawingMatrix.Invert()
    End Sub


    Private Sub initialiser_partie()
        Dim i, j As Integer

        ReDim aJeu(dimension - 1, dimension - 1)
        nb_coups_restants = dimension * dimension

        ' initialiser le tableau de jeu
        ' c'est nécessaire en cas de redémarrage d'une partie
        For i = 0 To dimension - 1
            For j = 0 To dimension - 1
                aJeu(i, j) = 0
            Next j
        Next i

        joueur = 1
        etat_de_la_partie = 0

        afficher_message()
    End Sub

    Private Sub afficher_message()
        If etat_de_la_partie = 0 Then ' partie en cours
            If joueur = 1 Then
                lblMessage.Text = "Joueur 1 c'est à vous de jouer !" _
                    + vbCrLf + "Il reste " + CStr(nb_coups_restants) + " coup(s)"
            Else
                lblMessage.Text = "Joueur 2 c'est à vous de jouer !" _
                    + vbCrLf + "Il reste " + CStr(nb_coups_restants) + " coup(s)"
            End If
        Else
            joueur = 0
            If etat_de_la_partie = 1 Then
                lblMessage.Text = "Le joueur 1 a gagné !"
            ElseIf etat_de_la_partie = 2 Then
                lblMessage.Text = "Le joueur 2 a gagné !"
            ElseIf etat_de_la_partie = 3 Then
                lblMessage.Text = "Match nul"
            End If
        End If
    End Sub

    Private Sub afficher_jeu(ByRef g As Graphics)
        Dim i, j As Integer

        g.Clear(Color.White)

        afficher_grille(g)

        'afficher_croix(g, 0, 0)
        'afficher_croix(g, 2, 1)
        'afficher_cercle(g, 2, 2)

        ' afficher les pions
        For i = 0 To dimension - 1
            For j = 0 To dimension - 1
                If aJeu(i, j) = 1 Then
                    afficher_croix(g, i, j)
                End If
                If aJeu(i, j) = 2 Then
                    afficher_cercle(g, i, j)
                End If
            Next j
        Next i

        afficher_message()
    End Sub

    'Private Function x_to_picture(ByVal x As Double) As Integer
    '    x_to_picture = CInt(x * PictureBox1.Width / (dimension * 100))
    'End Function
    'Private Function y_to_picture(ByVal y As Double) As Integer
    '    y_to_picture = CInt(y * PictureBox1.Height / (dimension * 100))
    'End Function

    Private Sub afficher_grille(ByRef g As Graphics)
        Dim i, j As Integer
        Dim stylo As Pen ' = Pens.Black
        stylo = New Pen(Color.Black)

        'Debug.Print("afficher_grille")
        'Dim stylo As Pen
        'stylo = Pens.Black
        'stylo.Width = 2
        ' lignes verticales
        For i = 1 To dimension - 1
            g.DrawLine(stylo, i * PictureBox1.Width / dimension, 0, i * PictureBox1.Width / dimension, PictureBox1.Height)
        Next i

        ' lignes horizontales
        For j = 1 To dimension - 1
            g.DrawLine(stylo, 0, j * PictureBox1.Height / dimension, PictureBox1.Width, j * PictureBox1.Height / dimension)
        Next j
    End Sub

    Private Sub afficher_croix(ByRef g As Graphics, ByVal i As Integer, ByVal j As Integer)
        Dim stylo As Pen '= Pens.Red
        stylo = New Pen(Color.Red)

        g.DrawLine(stylo, i * PictureBox1.Width / dimension, j * PictureBox1.Height / dimension, (i + 1) * PictureBox1.Width / dimension, (j + 1) * PictureBox1.Height / dimension)
        g.DrawLine(stylo, i * PictureBox1.Width / dimension, (j + 1) * PictureBox1.Height / dimension, (i + 1) * PictureBox1.Width / dimension, j * PictureBox1.Height / dimension)
    End Sub

    Private Sub afficher_cercle(ByRef g As Graphics, ByVal i As Integer, ByVal j As Integer)
        Dim stylo As Pen '= Pens.Blue
        stylo = New Pen(Color.Blue)
        g.DrawEllipse(stylo, i * PictureBox1.Width / dimension, j * PictureBox1.Height / dimension, PictureBox1.Height / dimension, PictureBox1.Height / dimension)
    End Sub

    Private Sub changer_joueur()
        If joueur = 1 Then
            joueur = 2
            '    ElseIf joueur = 2 Then
        Else
            joueur = 1
        End If
    End Sub


    Private Sub tester_victoire(ByVal X As Integer, ByVal Y As Integer)
        etat_de_la_partie = 0

        ' on teste la victoire en faisant le produit sur une ligne, une colonne
        ' ou sur les 2 deux diagonales
        ' ex joueur 1 dimension 3 : 1*1*1=1^3
        ' ex joueur 2 dimension 3 : 2*2*2=2^3
        ' joueur^dimension
        Dim i As Integer

        Dim res_V As Integer
        Dim res_H As Integer
        Dim res_D1 As Integer
        Dim res_D2 As Integer

        res_V = 1 ' verticale
        res_H = 1 ' horizontale
        res_D1 = 1 ' diagonale /
        res_D2 = 1 ' diagonale \

        ' calcul des produits sur
        ' lignes verticales et horizontales
        ' lignes diagonale D1 et D2
        For i = 0 To dimension - 1
            res_V = aJeu(i, Y) * res_V
            res_H = aJeu(X, i) * res_H
            res_D1 = aJeu(i, i) * res_D1
            res_D2 = aJeu(dimension - 1 - i, i) * res_D2
        Next i

        ' le joueur gagne s'il a fait une ligne verticale, une horizontale
        ' ou une (des deux) diagonale
        If res_V = joueur ^ dimension Or res_H = joueur ^ dimension _
            Or res_D1 = joueur ^ dimension Or res_D2 = joueur ^ dimension Then
            etat_de_la_partie = joueur
        End If

        If etat_de_la_partie = 0 And nb_coups_restants = 0 Then
            etat_de_la_partie = 3
        End If
    End Sub


    Private Sub cmdRecommencer_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        'Debug.Print("cmdRecommencer_Click")
        initialiser_partie()
        'afficher_jeu(g)
        PictureBox1.Refresh()
    End Sub

    Private Sub frmMain_Resize(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Resize
        PictureBox1.Refresh()
    End Sub


    Private Sub MenuItem1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem1.Click
        MsgBox("Morpion" & Chr(13) & "par S. CELLES")
    End Sub

    Private Sub MenuItem3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem3.Click
        'demander_taille()
        initialiser_partie()
        PictureBox1.Refresh()
    End Sub

    Private Sub demander_taille()
        Dim d As Integer = dimension_default
        Dim str As String
        str = InputBox("Dimension de la grille", "Morpion", CStr(dimension_default))
        Try
            If IsNumeric(d) Then
                d = CInt(str)
            End If
        Catch
        End Try
        dimension = d
    End Sub

    Private Sub MenuItem2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem2.Click
        demander_taille()
        initialiser_partie()
        PictureBox1.Refresh()
    End Sub
End Class
