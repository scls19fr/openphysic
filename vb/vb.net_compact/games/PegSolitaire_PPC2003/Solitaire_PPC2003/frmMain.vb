Option Explicit On
'Option Strict On

Imports System.Math

Public Class frmMain
    'Dim dimension As Integer
    Dim nb_colonnes As Integer = 7
    Dim nb_lignes As Integer = 7

    Dim aJeu(,) As Trou

    Const strTitre As String = "Peg Solitaire"
    Dim nb_coups_joues As Integer ' nb de coups joues
    Dim nb_pions_restants As Integer

    Enum Tablier
        Europeen
        Anglais
    End Enum
    Dim tab As Tablier

    Enum Situation
        Arret
        Enlevement
        Jeu
        FinJeu
    End Enum
    Dim mode As Situation

    Enum Trou
        Impossible
        Vide
        Occupe
        PretADeplacer
    End Enum

    Const rayon_jeton As Double = 0.4

    Dim pret_a_deplacer As Boolean
    Dim iFrom, jFrom As Integer ' pion à déplacer

    Dim msg As String ' Message

    Private Sub frmMain_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.Text = strTitre
        tab = Tablier.Europeen
        initialiser_jeu()
    End Sub

    Private Sub mnuNouveau_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles mnuNouveau.Click
        initialiser_jeu()
        afficher()
    End Sub

    Private Sub mnuAideApropos_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles mnuAideApropos.Click
        MsgBox(strTitre & Chr(13) & "par S. CELLES")
    End Sub

    Private Sub PictureBox1_Paint(ByVal sender As Object, ByVal e As System.Windows.Forms.PaintEventArgs) Handles PictureBox1.Paint
        Dim g As Graphics
        g = e.Graphics
        g.Clear(Color.White)
        'Dim stylo As Pen
        'stylo = Pens.Black
        'stylo = New Pen(Color.Black) 'Pens.Black
        'g.DrawLine(stylo, 0, 0, PictureBox1.Width, PictureBox1.Height)
        afficher_tablier(g)
        'afficher_pions(g)
        'afficher_tablier_console()
    End Sub

    Private Sub afficher()
        PictureBox1.Refresh()
        'gerer_message()
    End Sub

    Private Sub initialiser_jeu()
        nb_coups_joues = 0
        nb_pions_restants = 0

        update_menu_variantes()

        mode = Situation.Arret
        pret_a_deplacer = False

        'nb_colonnes = 8
        'nb_lignes = 7
        ReDim aJeu(nb_lignes - 1, nb_colonnes - 1)

        Dim i, j As Integer
        For i = 0 To nb_lignes - 1
            For j = 0 To nb_colonnes - 1
                aJeu(i, j) = Trou.Occupe
                nb_pions_restants = nb_pions_restants + 1
            Next
        Next

        If tab = Tablier.Europeen Then
            For i = 0 To 1
                For j = 0 To 1
                    aJeu(i, j) = Trou.Impossible
                    aJeu(nb_lignes - 1 - i, nb_colonnes - 1 - j) = Trou.Impossible
                    aJeu(i, nb_colonnes - 1 - j) = Trou.Impossible
                    aJeu(nb_colonnes - 1 - i, j) = Trou.Impossible
                    nb_pions_restants = nb_pions_restants - 4
                Next
            Next

        ElseIf tab = Tablier.Anglais Then
            For i = 0 To 1
                For j = 0 To 1
                    If i = 1 And j = 1 Then
                    Else
                        aJeu(i, j) = Trou.Impossible
                        aJeu(nb_lignes - 1 - i, nb_colonnes - 1 - j) = Trou.Impossible
                        aJeu(i, nb_colonnes - 1 - j) = Trou.Impossible
                        aJeu(nb_lignes - 1 - i, j) = Trou.Impossible
                        nb_pions_restants = nb_pions_restants - 4
                    End If
                Next
            Next
        End If

        ' Enlever un pion
        mode = Situation.Enlevement

        ' Enlever le pion central
        'aJeu(CInt((nb_lignes - 1) / 2), CInt((nb_colonnes - 1) / 2)) = Trou.Vide


    End Sub

    Private Sub afficher_tablier(ByVal g As Graphics)
        'Debug.Print("Graphics")
        Dim i, j As Integer
        Dim x1, y1, x2, y2, xc, yc As Double
        Dim j1, i1, j2, i2 As Integer
        Dim stylo As Pen ' = Pens.Black
        'stylo = Pens.Black
        stylo = New Pen(Color.Black)
        'stylo.Width = 1

        Dim brosse As SolidBrush
        brosse = New SolidBrush(Color.Yellow)

        ' Tracé de la grille
        '  lignes horizontales (sur jeu)
        'For i = 1 To nb_lignes - 1
        '' changement de coordonnées jeu->picturebox
        'x1 = 0 : y1 = i : jeu_vers_pic(x1, y1)
        'x2 = nb_colonnes : y2 = i : jeu_vers_pic(x2, y2)
        'g.DrawLine(stylo, CInt(x1), CInt(y1), CInt(x2), CInt(y2)) ' ligne horizontale (sur jeu)
        'Next i

        '  lignes verticales (sur jeu)
        'For j = 1 To nb_colonnes - 1
        '' changement de coordonnées jeu->picturebox
        'x1 = j : y1 = 0 : jeu_vers_pic(x1, y1)
        'x2 = j : y2 = nb_lignes : jeu_vers_pic(x2, y2)
        'g.DrawLine(stylo, CInt(x1), CInt(y1), CInt(x2), CInt(y2)) ' ligne verticale (sur jeu)
        'Next j

        Dim pion As Trou

        For i = 0 To nb_lignes - 1
            For j = 0 To nb_colonnes - 1
                pion = aJeu(i, j)
                If pion <> Trou.Impossible Then
                    j1 = j : i1 = i : jeu_vers_pic(j1, i1)
                    j2 = j + 1 : i2 = i + 1 : jeu_vers_pic(j2, i2)
                    g.DrawRectangle(stylo, j1, i1, j2 - j1, i2 - i1) ' dessine juste la case !

                    If pion = Trou.Occupe Or aJeu(i, j) = Trou.PretADeplacer Then
                        'x1 = j : y1 = i : jeu_vers_pic(x1, y1)
                        'x2 = j + 1 : y2 = i + 1 : jeu_vers_pic(x2, y2)

                        'Dim x1, y1 As Double
                        'Dim x2, y2 As Double
                        xc = j + 0.5 ' abscisse centre
                        yc = i + 0.5 ' ordonnée centre
                        x1 = xc - rayon_jeton : y1 = yc + rayon_jeton : jeu_vers_pic(x1, y1)
                        x2 = xc + rayon_jeton : y2 = yc - rayon_jeton : jeu_vers_pic(x2, y2)

                        If pion = Trou.Occupe Then
                            brosse.Color = Color.Orange
                        Else ' pion = Trou.PretADeplacer
                            brosse.Color = Color.Red
                        End If
                        g.FillEllipse(brosse, CInt(x1), CInt(y1), CInt(x2 - x1), CInt(y2 - y1))
                    Else 'If aJeu(i, j) = Trou.Vide Then

                    End If
                End If
            Next
        Next
    End Sub


    ' Mise à l'échelle seule (pas de rotation)
    ' ----------------------------------------
    'Private Sub jeu_vers_pic(ByRef x As Double, ByRef y As Double)
    '    x = (x / nb_colonnes) * PictureBox1.Width
    '    y = (y / nb_lignes) * PictureBox1.Height
    'End Sub
    Private Sub jeu_vers_pic(ByRef x As Double, ByRef y As Double)
        x = (x * PictureBox1.Width) / nb_colonnes
        y = (y * PictureBox1.Height / nb_lignes)
    End Sub


    ' changement de coordonnées picturebox->jeu
    ' remise à l'échelle sans rotation
    Private Sub pic_vers_jeu(ByRef x As Double, ByRef y As Double)
        x = (x * nb_colonnes) / PictureBox1.Width
        y = (y * nb_lignes) / PictureBox1.Height
    End Sub


    'Private Sub afficher_tablier_console()
    ''Console.WriteLine("Console")
    'Dim i, j As Integer
    'Dim pion As Trou
    '    For i = 0 To nb_lignes - 1
    '        Console.Write(" ")
    '        For j = 0 To nb_colonnes - 1
    '            pion = aJeu(i, j)
    '            If pion = Trou.Impossible Then
    '                Console.Write("#")
    '            ElseIf pion = Trou.Vide Then
    '                Console.Write(" ")
    '            ElseIf pion = Trou.Occupe Then
    '                Console.Write("*")
    '            Else
    '                Console.Write("?")
    '            End If
    '        Next
    '        Console.WriteLine("")
    '    Next
    '    Console.WriteLine("---------")
    '    Console.WriteLine("Nb=" & nb_coups_joues)
    '    Console.WriteLine("---------")
    'End Sub

    Enum Erreur
        PasDePionADeplacer = 1
        CaseOccupee
        Distance
        SautImpossible
        MemePion
        Diagonale
    End Enum

    Private Function distance(ByVal i1 As Integer, ByVal j1 As Integer, ByVal i2 As Integer, ByVal j2 As Integer) As Integer
        If i1 = i2 Or j1 = j2 Then ' horizontale ou verticale 
            If i1 = i2 Then
                distance = Abs(j2 - j1)
            ElseIf j1 = j2 Then
                distance = Abs(i2 - i1)
            End If
        Else
            distance = 0
            Err.Raise(Erreur.Diagonale, , "Diagonale interdite")
        End If
    End Function

    Private Sub deplacer(ByVal i1 As Integer, ByVal j1 As Integer, ByVal i2 As Integer, ByVal j2 As Integer)
        Dim iM, jM As Integer
        If aJeu(i1, j1) = Trou.Occupe Or aJeu(i1, j1) = Trou.PretADeplacer Then
            If i1 = i2 And j1 = j2 Then
                Err.Raise(Erreur.MemePion, , "C'est le même pion")
            ElseIf aJeu(i2, j2) = Trou.Vide Then
                If distance(i1, j1, i2, j2) = 2 Then
                    iM = CInt((i1 + i2) / 2) : jM = CInt((j1 + j2) / 2)
                    If aJeu(iM, jM) = Trou.Occupe Then
                        aJeu(i1, j1) = Trou.Vide
                        aJeu(i2, j2) = Trou.Occupe
                        aJeu(iM, jM) = Trou.Vide
                        nb_coups_joues = nb_coups_joues + 1
                    Else
                        Err.Raise(Erreur.SautImpossible, , "Pas de pion à sauter")
                    End If
                Else
                    Err.Raise(Erreur.Distance, , "Distance différente de 2")
                End If
            Else
                Err.Raise(Erreur.CaseOccupee, , "Pas de place pour poser le pion")
            End If
        Else
            Err.Raise(Erreur.PasDePionADeplacer, , "Pas de pion à déplacer")
        End If
    End Sub

    'Private Sub mnuTest_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles mnuTest.Click
    '    Try
    '        deplacer(1, 3, 3, 3)
    '    Catch exc As Exception
    ''Debug.Print(exc.ToString)
    ''Debug.Print(exc.Message)
    '        ajouter_message(exc.Message, Message.ErreurImportante)
    '    End Try
    '    afficher()
    'End Sub


    Private Sub PictureBox1_Resize(ByVal sender As Object, ByVal e As System.EventArgs) Handles PictureBox1.Resize
        Me.afficher()
    End Sub

    Private Sub PictureBox1_MouseDown(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles PictureBox1.MouseDown
        If e.Button = Windows.Forms.MouseButtons.Left Then
            Dim X, Y As Double
            X = e.X : Y = e.Y : pic_vers_jeu(X, Y) ' changement de coordonnées PicureBox vers Jeu
            'MsgBox(String.Format("Debug: Button={0}" & vbCrLf & "Xjeu={1} Yjeu={2}", e.Button, X, Y)) ' coordonnée jeu (double)

            Dim Xentier, Yentier As Integer
            Xentier = CInt(Int(X))
            Yentier = CInt(Int(Y))
            'MsgBox(String.Format("Debug: Button={0}" & vbCrLf & "Xjeu={1} Yjeu={2}", e.Button, Xentier, Yentier)) ' coordonnée jeu (integer)

            If mode = Situation.Enlevement Then
                Try
                    enlever_pion(Yentier, Xentier)
                    mode = Situation.Jeu
                Catch exc As Exception
                    ajouter_message(exc.Message, Message.ErreurImportante)
                End Try
            ElseIf mode = Situation.Jeu Then
                If aJeu(Yentier, Xentier) = Trou.Occupe And Not pret_a_deplacer Then
                    aJeu(Yentier, Xentier) = Trou.PretADeplacer
                    pret_a_deplacer = True
                    iFrom = Yentier : jFrom = Xentier
                ElseIf aJeu(Yentier, Xentier) = Trou.Vide And Not pret_a_deplacer Then
                    ' pour éviter le cas d'un clic juste après avoir enlevé la première pièce
                ElseIf pret_a_deplacer Then
                    Try
                        deplacer(iFrom, jFrom, Yentier, Xentier)
                        pret_a_deplacer = False
                    Catch exc As Exception
                        If Err.Number <> Erreur.MemePion Then
                            ajouter_message(exc.Message, Message.ErreurImportante)
                        End If
                        annuler_deplacement()
                    End Try
                Else
                    annuler_deplacement()
                End If
            End If
        End If

        afficher()
    End Sub

    Private Sub annuler_deplacement()
        pret_a_deplacer = False
        aJeu(iFrom, jFrom) = Trou.Occupe
    End Sub

    Private Sub enlever_pion(ByVal i As Integer, ByVal j As Integer)
        If aJeu(i, j) = Trou.Occupe Then
            aJeu(i, j) = Trou.Vide
            'iFrom = i : jFrom = j ' pour pouvoir annuler
        Else
            Err.Raise(7, , "Pas de pion à enlever")
        End If
    End Sub

    Private Sub mnuTablierEuropeen_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles mnuTablierEuropeen.Click
        tab = Tablier.Europeen
        update_menu_variantes()
        initialiser_jeu()
        afficher()
    End Sub


    Private Sub mnuTablierAnglais_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles mnuTablierAnglais.Click
        tab = Tablier.Anglais
        update_menu_variantes()
        initialiser_jeu()
        afficher()
    End Sub

    Private Sub update_menu_variantes()
        If tab = Tablier.Europeen Then
            mnuTablierEuropeen.Checked = True
            mnuTablierAnglais.Checked = False
        Else ' anglais
            mnuTablierEuropeen.Checked = False
            mnuTablierAnglais.Checked = True
        End If
    End Sub

    Enum Message
        Jeu
        ErreurIgnoree
        ErreurImportante
    End Enum

    Public Sub ajouter_message(ByVal str As String, ByVal niveau As Message)
        msg = str
        If niveau = Message.ErreurImportante Then
            montrer_messages()
        End If
    End Sub

    Public Sub montrer_messages()
        MsgBox(msg)
    End Sub

    'Public Sub gerer_message()

    'End Sub
End Class
