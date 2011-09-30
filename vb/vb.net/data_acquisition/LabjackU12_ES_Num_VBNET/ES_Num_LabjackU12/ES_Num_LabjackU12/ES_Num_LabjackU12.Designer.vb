<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class ES_Num_LabjackU12
    Inherits System.Windows.Forms.UserControl

    'UserControl1 remplace la méthode Dispose pour nettoyer la liste des composants.
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
        Me.gbEntréesSortiesNumériques = New System.Windows.Forms.GroupBox
        Me.TableLayoutPanelMain = New System.Windows.Forms.TableLayoutPanel
        Me.TableLayoutPanel1 = New System.Windows.Forms.TableLayoutPanel
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.TableLayoutPanel2 = New System.Windows.Forms.TableLayoutPanel
        Me.cboPort_ES_1 = New System.Windows.Forms.ComboBox
        Me.txtPort_1 = New System.Windows.Forms.TextBox
        Me.GroupBox0 = New System.Windows.Forms.GroupBox
        Me.TableLayoutPanel0 = New System.Windows.Forms.TableLayoutPanel
        Me.cboPort_ES_0 = New System.Windows.Forms.ComboBox
        Me.txtPort_0 = New System.Windows.Forms.TextBox
        Me.AfficheurOctet1 = New AfficheurOctet.AfficheurOctet
        Me.gbEntréesSortiesNumériques.SuspendLayout()
        Me.TableLayoutPanelMain.SuspendLayout()
        Me.TableLayoutPanel1.SuspendLayout()
        Me.GroupBox1.SuspendLayout()
        Me.TableLayoutPanel2.SuspendLayout()
        Me.GroupBox0.SuspendLayout()
        Me.TableLayoutPanel0.SuspendLayout()
        Me.SuspendLayout()
        '
        'gbEntréesSortiesNumériques
        '
        Me.gbEntréesSortiesNumériques.Controls.Add(Me.TableLayoutPanelMain)
        Me.gbEntréesSortiesNumériques.Dock = System.Windows.Forms.DockStyle.Fill
        Me.gbEntréesSortiesNumériques.Location = New System.Drawing.Point(0, 0)
        Me.gbEntréesSortiesNumériques.Name = "gbEntréesSortiesNumériques"
        Me.gbEntréesSortiesNumériques.Size = New System.Drawing.Size(711, 358)
        Me.gbEntréesSortiesNumériques.TabIndex = 0
        Me.gbEntréesSortiesNumériques.TabStop = False
        Me.gbEntréesSortiesNumériques.Text = "Entrées/Sorties numériques"
        '
        'TableLayoutPanelMain
        '
        Me.TableLayoutPanelMain.ColumnCount = 1
        Me.TableLayoutPanelMain.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50.0!))
        Me.TableLayoutPanelMain.Controls.Add(Me.TableLayoutPanel1, 0, 1)
        Me.TableLayoutPanelMain.Controls.Add(Me.GroupBox0, 0, 0)
        Me.TableLayoutPanelMain.Dock = System.Windows.Forms.DockStyle.Fill
        Me.TableLayoutPanelMain.Location = New System.Drawing.Point(3, 16)
        Me.TableLayoutPanelMain.Name = "TableLayoutPanelMain"
        Me.TableLayoutPanelMain.RowCount = 2
        Me.TableLayoutPanelMain.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50.0!))
        Me.TableLayoutPanelMain.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50.0!))
        Me.TableLayoutPanelMain.Size = New System.Drawing.Size(705, 339)
        Me.TableLayoutPanelMain.TabIndex = 0
        '
        'TableLayoutPanel1
        '
        Me.TableLayoutPanel1.ColumnCount = 1
        Me.TableLayoutPanel1.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50.0!))
        Me.TableLayoutPanel1.Controls.Add(Me.GroupBox1, 0, 0)
        Me.TableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.TableLayoutPanel1.Location = New System.Drawing.Point(3, 172)
        Me.TableLayoutPanel1.Name = "TableLayoutPanel1"
        Me.TableLayoutPanel1.RowCount = 1
        Me.TableLayoutPanel1.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50.0!))
        Me.TableLayoutPanel1.Size = New System.Drawing.Size(699, 164)
        Me.TableLayoutPanel1.TabIndex = 1
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.TableLayoutPanel2)
        Me.GroupBox1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.GroupBox1.Location = New System.Drawing.Point(3, 3)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(693, 158)
        Me.GroupBox1.TabIndex = 1
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Port 1"
        '
        'TableLayoutPanel2
        '
        Me.TableLayoutPanel2.ColumnCount = 3
        Me.TableLayoutPanel2.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 66.81615!))
        Me.TableLayoutPanel2.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.18386!))
        Me.TableLayoutPanel2.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 515.0!))
        Me.TableLayoutPanel2.Controls.Add(Me.cboPort_ES_1, 0, 0)
        Me.TableLayoutPanel2.Controls.Add(Me.txtPort_1, 1, 0)
        Me.TableLayoutPanel2.Dock = System.Windows.Forms.DockStyle.Fill
        Me.TableLayoutPanel2.Location = New System.Drawing.Point(3, 16)
        Me.TableLayoutPanel2.Name = "TableLayoutPanel2"
        Me.TableLayoutPanel2.RowCount = 1
        Me.TableLayoutPanel2.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50.0!))
        Me.TableLayoutPanel2.Size = New System.Drawing.Size(687, 139)
        Me.TableLayoutPanel2.TabIndex = 1
        '
        'cboPort_ES_1
        '
        Me.cboPort_ES_1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.cboPort_ES_1.FormattingEnabled = True
        Me.cboPort_ES_1.Location = New System.Drawing.Point(3, 3)
        Me.cboPort_ES_1.Name = "cboPort_ES_1"
        Me.cboPort_ES_1.Size = New System.Drawing.Size(108, 21)
        Me.cboPort_ES_1.TabIndex = 0
        '
        'txtPort_1
        '
        Me.txtPort_1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.txtPort_1.Location = New System.Drawing.Point(117, 3)
        Me.txtPort_1.Name = "txtPort_1"
        Me.txtPort_1.Size = New System.Drawing.Size(51, 20)
        Me.txtPort_1.TabIndex = 1
        '
        'GroupBox0
        '
        Me.GroupBox0.Controls.Add(Me.TableLayoutPanel0)
        Me.GroupBox0.Dock = System.Windows.Forms.DockStyle.Fill
        Me.GroupBox0.Location = New System.Drawing.Point(3, 3)
        Me.GroupBox0.Name = "GroupBox0"
        Me.GroupBox0.Size = New System.Drawing.Size(699, 163)
        Me.GroupBox0.TabIndex = 0
        Me.GroupBox0.TabStop = False
        Me.GroupBox0.Text = "Port 0"
        '
        'TableLayoutPanel0
        '
        Me.TableLayoutPanel0.ColumnCount = 3
        Me.TableLayoutPanel0.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 66.81615!))
        Me.TableLayoutPanel0.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.18386!))
        Me.TableLayoutPanel0.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 515.0!))
        Me.TableLayoutPanel0.Controls.Add(Me.cboPort_ES_0, 0, 0)
        Me.TableLayoutPanel0.Controls.Add(Me.txtPort_0, 1, 0)
        Me.TableLayoutPanel0.Controls.Add(Me.AfficheurOctet1, 2, 0)
        Me.TableLayoutPanel0.Dock = System.Windows.Forms.DockStyle.Fill
        Me.TableLayoutPanel0.Location = New System.Drawing.Point(3, 16)
        Me.TableLayoutPanel0.Name = "TableLayoutPanel0"
        Me.TableLayoutPanel0.RowCount = 1
        Me.TableLayoutPanel0.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50.0!))
        Me.TableLayoutPanel0.Size = New System.Drawing.Size(693, 144)
        Me.TableLayoutPanel0.TabIndex = 1
        '
        'cboPort_ES_0
        '
        Me.cboPort_ES_0.Dock = System.Windows.Forms.DockStyle.Fill
        Me.cboPort_ES_0.FormattingEnabled = True
        Me.cboPort_ES_0.Location = New System.Drawing.Point(3, 3)
        Me.cboPort_ES_0.Name = "cboPort_ES_0"
        Me.cboPort_ES_0.Size = New System.Drawing.Size(112, 21)
        Me.cboPort_ES_0.TabIndex = 0
        '
        'txtPort_0
        '
        Me.txtPort_0.Dock = System.Windows.Forms.DockStyle.Fill
        Me.txtPort_0.Location = New System.Drawing.Point(121, 3)
        Me.txtPort_0.Name = "txtPort_0"
        Me.txtPort_0.Size = New System.Drawing.Size(53, 20)
        Me.txtPort_0.TabIndex = 1
        '
        'AfficheurOctet1
        '
        Me.AfficheurOctet1.Couleur = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(0, Byte), Integer))
        Me.AfficheurOctet1.Location = New System.Drawing.Point(180, 3)
        Me.AfficheurOctet1.N = CType(0, Byte)
        Me.AfficheurOctet1.Name = "AfficheurOctet1"
        Me.AfficheurOctet1.Size = New System.Drawing.Size(160, 20)
        Me.AfficheurOctet1.TabIndex = 2
        '
        'ES_Num_LabjackU12
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.Controls.Add(Me.gbEntréesSortiesNumériques)
        Me.Name = "ES_Num_LabjackU12"
        Me.Size = New System.Drawing.Size(711, 358)
        Me.gbEntréesSortiesNumériques.ResumeLayout(False)
        Me.TableLayoutPanelMain.ResumeLayout(False)
        Me.TableLayoutPanel1.ResumeLayout(False)
        Me.GroupBox1.ResumeLayout(False)
        Me.TableLayoutPanel2.ResumeLayout(False)
        Me.TableLayoutPanel2.PerformLayout()
        Me.GroupBox0.ResumeLayout(False)
        Me.TableLayoutPanel0.ResumeLayout(False)
        Me.TableLayoutPanel0.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents gbEntréesSortiesNumériques As System.Windows.Forms.GroupBox
    Friend WithEvents TableLayoutPanelMain As System.Windows.Forms.TableLayoutPanel
    Friend WithEvents GroupBox0 As System.Windows.Forms.GroupBox
    Friend WithEvents TableLayoutPanel0 As System.Windows.Forms.TableLayoutPanel
    Friend WithEvents cboPort_ES_0 As System.Windows.Forms.ComboBox
    Friend WithEvents txtPort_0 As System.Windows.Forms.TextBox
    Friend WithEvents TableLayoutPanel1 As System.Windows.Forms.TableLayoutPanel
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents TableLayoutPanel2 As System.Windows.Forms.TableLayoutPanel
    Friend WithEvents cboPort_ES_1 As System.Windows.Forms.ComboBox
    Friend WithEvents txtPort_1 As System.Windows.Forms.TextBox
    Friend WithEvents AfficheurOctet1 As AfficheurOctet.AfficheurOctet

End Class
