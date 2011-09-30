Option Explicit On

Public Class frmMain
    Const strTitre As String = "Puissance 4"

    Const nb_lignes As Integer = 6
    Const nb_colonnes As Integer = 7

    Const rayon_jeton As Double = 0.4

    Dim aJeu(nb_colonnes - 1, nb_lignes - 1) As Integer ' matrice du jeu
    Dim aNbPions(nb_colonnes - 1) As Integer ' nb de pions dans une colonne donnée
    Dim nb_coups_joues As Integer ' nb de coups joues
    Const alignes As Integer = 4 ' nb de pions à aligner pour gagner

    Dim joueur As Integer
    ' joueur = 1 ou 2

    Enum Partie
        EnCours ' 0
        GagneeParJoueur1 ' 1
        GagneeParJoueur2 ' 2
        Nulle ' 3
    End Enum
    Dim etat_de_la_partie As Partie
    ' 0 en cours
    ' 1 partie gagnée par joueur 1
    ' 2 partie gagnée par joueur 2
    ' 3 partie nulle

    'Enum Affichage
    '    Mode0
    '    Mode90
    'End Enum
    'Dim mode_affichage As Affichage

    Dim g As Graphics

    Dim msg As String = strTitre

    Private Sub mnuApropos_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles mnuApropos.Click
        MsgBox(strTitre & Chr(13) & "par S. CELLES")
    End Sub

    Private Sub mnuNouveau_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles mnuNouveau.Click
        initialiser_jeu()
        afficher_jeu()
    End Sub

    Private Sub PictureBox1_Paint(ByVal sender As Object, ByVal e As System.Windows.Forms.PaintEventArgs) Handles PictureBox1.Paint
        g = e.Graphics

        Dim i, j As Integer

        g.Clear(Color.White)

        afficher_grille(g)

        'afficher_disque(g, 2, 3, Color.Purple) ' Pour tester

        ' afficher les jetons sur la grille
        For j = 0 To nb_lignes - 1
            For i = 0 To nb_colonnes - 1
                afficher_jeton(g, i, j, aJeu(i, j))
            Next i
        Next j

    End Sub

    Private Sub afficher_jeton(ByRef g As Graphics, ByVal X As Integer, ByVal Y As Integer, ByVal joueur As Integer)
        If joueur = 1 Then
            afficher_disque(g, X, Y, Color.Red)
        ElseIf joueur = 2 Then
            afficher_disque(g, X, Y, Color.Yellow)
        Else
            ' la case est vide !
        End If
    End Sub


    Private Sub afficher_disque(ByRef g As Graphics, ByVal X As Integer, ByVal Y As Integer, ByVal couleur As Color)
        Dim xc, yc As Double
        Dim x1, y1 As Double
        Dim x2, y2 As Double
        xc = X + 0.5 ' abscisse centre
        yc = Y + 0.5 ' ordonnée centre
        x1 = xc - rayon_jeton : y1 = yc + rayon_jeton : jeu_vers_pic(x1, y1)
        x2 = xc + rayon_jeton : y2 = yc - rayon_jeton : jeu_vers_pic(x2, y2)

        ' Ellipse vide
        'Dim stylo As Pen
        'stylo = New Pen(couleur)
        'g.DrawEllipse(stylo, Int(x1), Int(y1), x2 - x1, y2 - y1)

        ' Ellipse remplie
        Dim brosse As Brush
        brosse = New SolidBrush(couleur)
        g.FillEllipse(brosse, Int(x1), Int(y1), x2 - x1, y2 - y1)
    End Sub


    Private Sub PictureBox1_MouseUp(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles PictureBox1.MouseUp
        'MsgBox(String.Format("Debug: Button={0}" & vbCrLf & "Xpic={1} Ypic={2}", e.Button, e.X, e.Y)) ' coordonnée picturebox
        Dim X, Y As Double
        X = e.X : Y = e.Y : pic_vers_jeu(X, Y) ' changement de coordonnées PicureBox vers Jeu
        'MsgBox(String.Format("Debug: Button={0}" & vbCrLf & "Xjeu={1} Yjeu={2}", e.Button, X, Y)) ' coordonnée jeu (double)

        Dim Xentier, Yentier As Integer
        Xentier = Int(X)
        Yentier = Int(Y)
        'MsgBox(String.Format("Debug: Button={0}" & vbCrLf & "Xjeu={1} Yjeu={2}", e.Button, Xentier, Yentier)) ' coordonnée jeu (integer)

        If e.Button = Windows.Forms.MouseButtons.Left And etat_de_la_partie = 0 Then

            ' En cas de clic sur la limite haute du PictureBox
            'If Yentier > nb_lignes - 1 Then
            'Yentier = nb_lignes - 1
            'End If

            ' En cas de clic sur la limite droite du PictureBox
            'If Xentier > nb_colonnes - 1 Then
            'Xentier = nb_colonnes - 1
            'End If

            If aNbPions(Xentier) < nb_lignes Then ' il reste de la place pour poser le pion
                aJeu(Xentier, aNbPions(Xentier)) = joueur ' placement du pion
                aNbPions(Xentier) = aNbPions(Xentier) + 1 ' incrémentation du nb de pion sur la colonne
                nb_coups_joues = nb_coups_joues + 1 ' incrémentation du nb de coups joués
                tester_victoire(Xentier, aNbPions(Xentier) - 1)
                changer_joueur()
            Else ' la case n'est pas vide
                Beep()
            End If
        Else
        End If

        afficher_jeu()
        gerer_message()

    End Sub

    'Private Sub initialiser_affichage(ByRef g As Graphics)
    'End Sub

    Private Sub afficher_jeu()
        PictureBox1.Refresh()
    End Sub

    Private Sub montrer_messages()
        MsgBox(msg)
    End Sub

    Enum Message
        Jeu
        Important
    End Enum

    Private Sub ajouter_message(ByVal str As String, ByVal niveau As Message)
        msg = str
        If niveau = Message.Important Then
            montrer_messages()
            'MsgBox(msg)
        End If
    End Sub

    Private Sub gerer_message()
        If etat_de_la_partie = 0 Then ' partie en cours
            If joueur = 1 Then
                ajouter_message("Joueur 1 (rouge) c'est à vous de jouer !" _
                    + vbCrLf + "Il reste " + CStr(nb_coups_restants()) + " coup(s)", Message.Jeu)
            Else
                ajouter_message("Joueur 2 (jaune) c'est à vous de jouer !" _
                    + vbCrLf + "Il reste " + CStr(nb_coups_restants()) + " coup(s)", Message.Jeu)
            End If
        ElseIf etat_de_la_partie = 1 Then
            ajouter_message("Le joueur 1 (rouge) a gagné !", Message.Important)
        ElseIf etat_de_la_partie = 2 Then
            ajouter_message("Le joueur 2 (jaune) a gagné !", Message.Important)
        ElseIf etat_de_la_partie = 3 Then
            ajouter_message("Match nul", Message.Important)
        End If
    End Sub

    Private Sub initialiser_jeu()
        Dim i, j As Integer

        ' Effacement de la matrice de jeu
        For j = 0 To nb_lignes - 1
            For i = 0 To nb_colonnes - 1
                aJeu(i, j) = 0
            Next i
        Next j

        ' Effacement de la liste de pions par colonnes
        For i = 0 To nb_colonnes - 1
            aNbPions(i) = 0
        Next i

        joueur = 1
        etat_de_la_partie = 0

        gerer_message()
    End Sub

    Private Sub changer_joueur()
        If joueur = 1 Then
            joueur = 2
        Else
            joueur = 1
        End If
    End Sub


    Private Sub jeu_vers_pic(ByRef x As Double, ByRef y As Double)
        If mnuAffichage0.Checked Then
            jeu_vers_pic0(x, y)
        Else
            jeu_vers_pic90(x, y)
        End If
    End Sub

    Private Sub pic_vers_jeu(ByRef x As Double, ByRef y As Double)
        If mnuAffichage0.Checked Then
            pic0_vers_jeu(x, y)
        Else
            pic90_vers_jeu(x, y)
        End If
    End Sub


    ' Pseudo mode paysage jeu_vers_pic90 et pic90_vers_jeu
    ' -------------------

    ' changement de coordonnées jeu->picturebox
    '       xjeu
    '       /\
    '   -------> xpic
    '  |    |
    ' /|    |
    ' \|----+
    'yjeu
    '  |
    ' \ /
    '  ypic
    ' mise à l'échelle + rotation 90°
    Private Sub jeu_vers_pic90(ByRef x As Double, ByRef y As Double)
        Dim xtemp As Double = x
        Dim ytemp As Double = y
        x = PictureBox1.Width - (ytemp / nb_lignes) * PictureBox1.Width
        y = PictureBox1.Height - (xtemp / nb_colonnes) * PictureBox1.Height
    End Sub


    ' changement de coordonnées picturebox->jeu
    ' remise à l'échelle + rotation -90°
    Private Sub pic90_vers_jeu(ByRef x As Double, ByRef y As Double)
        Dim xtemp As Double = x
        Dim ytemp As Double = y
        y = ((PictureBox1.Width - xtemp) / PictureBox1.Width) * nb_lignes
        x = ((PictureBox1.Height - ytemp) / PictureBox1.Height) * nb_colonnes
    End Sub


    ' Mise à l'échelle seule (pas de rotation)
    ' ----------------------------------------
    ' Il faut installer JSLandscape ou autre driver (pour avoir le mode paysage
    Private Sub jeu_vers_pic0(ByRef x As Double, ByRef y As Double)
        'x = PictureBox1.Width - (x / nb_colonnes) * PictureBox1.Width
        x = (x / nb_colonnes) * PictureBox1.Width
        y = PictureBox1.Height - (y / nb_lignes) * PictureBox1.Height
    End Sub


    ' changement de coordonnées picturebox->jeu
    ' remise à l'échelle sans rotation
    Private Sub pic0_vers_jeu(ByRef x As Double, ByRef y As Double)
        x = x / PictureBox1.Width * nb_colonnes
        y = ((PictureBox1.Height - y) / PictureBox1.Height) * nb_lignes
    End Sub

    Private Sub tester_changement_jeu_vers_pic(ByRef g As Graphics)
        'g.DrawLine(stylo, 0, 0, PictureBox1.Width, PictureBox1.Height) ' diagonale pour test

        Dim stylo As Pen ' = Pens.Black
        stylo = New Pen(Color.Black)

        ' changement de coordonnées jeu->picturebox
        Dim x1, y1, x2, y2 As Double
        x1 = 0 : y1 = 0 : jeu_vers_pic(x1, y1)
        x2 = nb_colonnes : y2 = nb_lignes : jeu_vers_pic(x2, y2)
        g.DrawLine(stylo, x1, y1, x2, y2)
        'g.DrawEllipse(stylo,
    End Sub

    Private Sub afficher_grille(ByRef g As Graphics)
        Dim i, j As Integer
        Dim x1, y1, x2, y2 As Double
        Dim stylo As Pen ' = Pens.Black
        stylo = New Pen(Color.Black)

        ' Tracé de la grille
        '  lignes horizontales (sur jeu)
        For i = 1 To nb_lignes - 1
            ' changement de coordonnées jeu->picturebox
            x1 = 0 : y1 = i : jeu_vers_pic(x1, y1)
            x2 = nb_colonnes : y2 = i : jeu_vers_pic(x2, y2)
            g.DrawLine(stylo, x1, y1, x2, y2) ' ligne horizontale (sur jeu)
        Next i

        '  lignes verticales (sur jeu)
        For j = 1 To nb_colonnes - 1
            ' changement de coordonnées jeu->picturebox
            x1 = j : y1 = 0 : jeu_vers_pic(x1, y1)
            x2 = j : y2 = nb_lignes : jeu_vers_pic(x2, y2)
            g.DrawLine(stylo, x1, y1, x2, y2) ' ligne verticale (sur jeu)
        Next j
    End Sub

    Private Function nb_coups_restants() As Integer
        nb_coups_restants = nb_lignes * nb_colonnes - nb_coups_joues
    End Function

    Private Sub frmMain_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles MyBase.Load
        mnuAffichage0.Checked = True

        initialiser_jeu()
        afficher_jeu()
    End Sub


    Private Sub tester_victoire(ByVal X As Integer, ByVal Y As Integer)
        etat_de_la_partie = 0

        ' on teste en se déplaçant vers la gauche et la droite pour compter les pions
        ' voisins du même joueur
        ' on procède de même vers le bas (mais pas vers le haut !)
        ' on compte aussi les voisins en diagonale

        Dim i, j As Integer
        Dim voisins As Integer

        ' comptage du nb de voisins vers le bas
        voisins = 0
        If aNbPions(X) >= alignes Then ' uniquement si la colonne comporte assez de pions (au moins autant que de pions à aligner)
            For i = 1 To alignes - 1
                If aJeu(X, Y - i) = joueur Then
                    voisins = voisins + 1
                Else
                    ' ça n'est pas un pion du joueur en cours
                    Exit For
                End If
            Next i
        End If
        If voisins = alignes - 1 Then ' 4 alignés = 3 voisins
            etat_de_la_partie = joueur
        End If

        ' comptage du nb de voisins à gauche et à droite
        voisins = 0
        ' voisins de gauche
        For j = 1 To alignes - 1
            If X + j <= nb_colonnes - 1 Then
                If aJeu(X + j, Y) = joueur Then
                    voisins = voisins + 1
                Else
                    ' ça n'est pas un pion du joueur en cours
                    Exit For
                End If
            End If
        Next j

        ' voisins de droite
        For j = 1 To alignes - 1
            If X - j >= 0 Then
                If aJeu(X - j, Y) = joueur Then
                    voisins = voisins + 1
                Else
                    ' ça n'est pas un pion du joueur en cours
                    Exit For
                End If
            End If
        Next j
        ' test du nb de voisins
        If voisins = alignes - 1 Then ' 4 alignés = 3 voisins
            etat_de_la_partie = joueur
        End If


        ' comptage du nb de voisins en diagonale /
        voisins = 0
        ' voisins de haut-droite
        For j = 1 To alignes - 1
            If X + j <= nb_colonnes - 1 And Y + j <= nb_lignes - 1 Then
                If aJeu(X + j, Y + j) = joueur Then
                    voisins = voisins + 1
                Else
                    ' ça n'est pas un pion du joueur en cours
                    Exit For
                End If
            End If
        Next j
        ' voisins de bas-gauche
        For j = 1 To alignes - 1
            If X - j >= 0 And Y - j >= 0 Then
                If aJeu(X - j, Y - j) = joueur Then
                    voisins = voisins + 1
                Else
                    ' ça n'est pas un pion du joueur en cours
                    Exit For
                End If
            End If
        Next j
        ' test du nb de voisins
        If voisins = alignes - 1 Then ' 4 alignés = 3 voisins
            etat_de_la_partie = joueur
        End If

        ' comptage du nb de voisins en diagonale \
        voisins = 0
        ' voisins de haut-gauche
        For j = 1 To alignes - 1
            If X - j >= 0 And Y + j <= nb_lignes - 1 Then
                If aJeu(X - j, Y + j) = joueur Then
                    voisins = voisins + 1
                Else
                    ' ça n'est pas un pion du joueur en cours
                    Exit For
                End If
            End If
        Next j
        ' voisins de bas-droite
        For j = 1 To alignes - 1
            If X + j <= nb_colonnes - 1 And Y - j >= 0 Then
                If aJeu(X + j, Y - j) = joueur Then
                    voisins = voisins + 1
                Else
                    ' ça n'est pas un pion du joueur en cours
                    Exit For
                End If
            End If
        Next j
        ' test du nb de voisins
        If voisins = alignes - 1 Then ' 4 alignés = 3 voisins
            etat_de_la_partie = joueur
        End If
    End Sub

    Private Sub mnuMessage_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles mnuMessage.Click
        montrer_messages()
    End Sub

    Private Sub mnuAffichage0_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles mnuAffichage0.Click
        mnuAffichage0.Checked = True
        mnuAffichage90.Checked = False
        PictureBox1.Refresh()
    End Sub

    Private Sub mnuAffichage90_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles mnuAffichage90.Click
        mnuAffichage90.Checked = True
        mnuAffichage0.Checked = False
        PictureBox1.Refresh()
    End Sub
End Class
