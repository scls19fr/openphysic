<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Public Class frmMain
    Inherits System.Windows.Forms.Form

    'Form remplace la méthode Dispose pour nettoyer la liste des composants.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing AndAlso components IsNot Nothing Then
            components.Dispose()
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Requise par le Concepteur Windows Form
    Private components As System.ComponentModel.IContainer
    Private mainMenu1 As System.Windows.Forms.MainMenu

    'REMARQUE : la procédure suivante est requise par le Concepteur Windows Form
    'Elle peut être modifiée à l'aide du Concepteur Windows Form.  
    'Ne la modifiez pas à l'aide de l'éditeur de code.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.mainMenu1 = New System.Windows.Forms.MainMenu
        Me.mnuNouveau = New System.Windows.Forms.MenuItem
        Me.mnuVariantes = New System.Windows.Forms.MenuItem
        Me.mnuTablierEuropeen = New System.Windows.Forms.MenuItem
        Me.mnuTablierAnglais = New System.Windows.Forms.MenuItem
        Me.mnuAideApropos = New System.Windows.Forms.MenuItem
        Me.PictureBox1 = New System.Windows.Forms.PictureBox
        Me.SuspendLayout()
        '
        'mainMenu1
        '
        Me.mainMenu1.MenuItems.Add(Me.mnuNouveau)
        Me.mainMenu1.MenuItems.Add(Me.mnuVariantes)
        Me.mainMenu1.MenuItems.Add(Me.mnuAideApropos)
        '
        'mnuNouveau
        '
        Me.mnuNouveau.Text = "&Nouveau"
        '
        'mnuVariantes
        '
        Me.mnuVariantes.MenuItems.Add(Me.mnuTablierEuropeen)
        Me.mnuVariantes.MenuItems.Add(Me.mnuTablierAnglais)
        Me.mnuVariantes.Text = "&Variantes"
        '
        'mnuTablierEuropeen
        '
        Me.mnuTablierEuropeen.Text = "Tablier &européen"
        '
        'mnuTablierAnglais
        '
        Me.mnuTablierAnglais.Text = "Tablier &anglais"
        '
        'mnuAideApropos
        '
        Me.mnuAideApropos.Text = "&?"
        '
        'PictureBox1
        '
        Me.PictureBox1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.PictureBox1.Location = New System.Drawing.Point(0, 0)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(240, 268)
        '
        'frmMain
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(96.0!, 96.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi
        Me.AutoScroll = True
        Me.ClientSize = New System.Drawing.Size(240, 268)
        Me.Controls.Add(Me.PictureBox1)
        Me.Menu = Me.mainMenu1
        Me.Name = "frmMain"
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents mnuNouveau As System.Windows.Forms.MenuItem
    Friend WithEvents mnuVariantes As System.Windows.Forms.MenuItem
    Friend WithEvents mnuAideApropos As System.Windows.Forms.MenuItem
    Friend WithEvents PictureBox1 As System.Windows.Forms.PictureBox
    Friend WithEvents mnuTablierEuropeen As System.Windows.Forms.MenuItem
    Friend WithEvents mnuTablierAnglais As System.Windows.Forms.MenuItem

End Class
