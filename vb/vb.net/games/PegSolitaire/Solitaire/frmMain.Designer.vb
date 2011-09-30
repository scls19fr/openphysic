<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmMain
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

    'REMARQUE : la procédure suivante est requise par le Concepteur Windows Form
    'Elle peut être modifiée à l'aide du Concepteur Windows Form.  
    'Ne la modifiez pas à l'aide de l'éditeur de code.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.PictureBox1 = New System.Windows.Forms.PictureBox
        Me.MenuStrip1 = New System.Windows.Forms.MenuStrip
        Me.mnuNouveau = New System.Windows.Forms.ToolStripMenuItem
        Me.mnuVariantes = New System.Windows.Forms.ToolStripMenuItem
        Me.mnuTablierEuropeen = New System.Windows.Forms.ToolStripMenuItem
        Me.mnuTablierAnglais = New System.Windows.Forms.ToolStripMenuItem
        Me.mnuAideApropos = New System.Windows.Forms.ToolStripMenuItem
        Me.mnuTest = New System.Windows.Forms.ToolStripMenuItem
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.MenuStrip1.SuspendLayout()
        Me.SuspendLayout()
        '
        'PictureBox1
        '
        Me.PictureBox1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.PictureBox1.Location = New System.Drawing.Point(0, 24)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(284, 264)
        Me.PictureBox1.TabIndex = 0
        Me.PictureBox1.TabStop = False
        '
        'MenuStrip1
        '
        Me.MenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.mnuNouveau, Me.mnuVariantes, Me.mnuAideApropos, Me.mnuTest})
        Me.MenuStrip1.Location = New System.Drawing.Point(0, 0)
        Me.MenuStrip1.Name = "MenuStrip1"
        Me.MenuStrip1.Size = New System.Drawing.Size(284, 24)
        Me.MenuStrip1.TabIndex = 1
        Me.MenuStrip1.Text = "MenuStrip1"
        '
        'mnuNouveau
        '
        Me.mnuNouveau.Name = "mnuNouveau"
        Me.mnuNouveau.Size = New System.Drawing.Size(67, 20)
        Me.mnuNouveau.Text = "&Nouveau"
        '
        'mnuVariantes
        '
        Me.mnuVariantes.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.mnuTablierEuropeen, Me.mnuTablierAnglais})
        Me.mnuVariantes.Name = "mnuVariantes"
        Me.mnuVariantes.Size = New System.Drawing.Size(67, 20)
        Me.mnuVariantes.Text = "&Variantes"
        '
        'mnuTablierEuropeen
        '
        Me.mnuTablierEuropeen.Name = "mnuTablierEuropeen"
        Me.mnuTablierEuropeen.Size = New System.Drawing.Size(163, 22)
        Me.mnuTablierEuropeen.Text = "Tablier &européen"
        '
        'mnuTablierAnglais
        '
        Me.mnuTablierAnglais.Name = "mnuTablierAnglais"
        Me.mnuTablierAnglais.Size = New System.Drawing.Size(163, 22)
        Me.mnuTablierAnglais.Text = "Tablier &anglais"
        '
        'mnuAideApropos
        '
        Me.mnuAideApropos.Name = "mnuAideApropos"
        Me.mnuAideApropos.Size = New System.Drawing.Size(24, 20)
        Me.mnuAideApropos.Text = "&?"
        '
        'mnuTest
        '
        Me.mnuTest.Name = "mnuTest"
        Me.mnuTest.Size = New System.Drawing.Size(41, 20)
        Me.mnuTest.Text = "Test"
        Me.mnuTest.Visible = False
        '
        'frmMain
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(284, 288)
        Me.Controls.Add(Me.PictureBox1)
        Me.Controls.Add(Me.MenuStrip1)
        Me.MainMenuStrip = Me.MenuStrip1
        Me.Name = "frmMain"
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.MenuStrip1.ResumeLayout(False)
        Me.MenuStrip1.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents PictureBox1 As System.Windows.Forms.PictureBox
    Friend WithEvents MenuStrip1 As System.Windows.Forms.MenuStrip
    Friend WithEvents mnuNouveau As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents mnuAideApropos As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents mnuTest As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents mnuVariantes As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents mnuTablierEuropeen As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents mnuTablierAnglais As System.Windows.Forms.ToolStripMenuItem

End Class
