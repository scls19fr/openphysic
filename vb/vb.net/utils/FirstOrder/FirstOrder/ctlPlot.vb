Public Class ctlPlot
    Dim m_buffer As New clsCircularBuffer(Of Double)

    Dim ScaleWidth As Single
    Dim ScaleLeft As Single
    Dim ScaleHeight As Single
    Dim ScaleTop As Single

    Enum Points_Mode
        None
        Dot
        AddCross
        TimesCross
    End Enum
    Dim m_points_mode As Points_Mode

    Const m_ray As Double = 0.4
    Dim m_delta_x As Double
    Dim m_delta_y As Double


    Private Sub ctlPlot_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'm_buffer = New clsCircularBuffer(Of Double)
        m_buffer.Capacity = 64

        m_points_mode = Points_Mode.Dot
    End Sub

    Private Sub PictureBox1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PictureBox1.Click

    End Sub

    Private Sub PictureBox1_Paint(ByVal sender As Object, ByVal e As System.Windows.Forms.PaintEventArgs) Handles PictureBox1.Paint
        Dim p As New Pen(Color.Black)


        ' ToDo: mise à l'échelle du PictureBox (fonction de conversion)
        ' ou creation d'un PictureBox simulant les propriétés de VB6
        '  ScaleWidth ScaleLeft ScaleHeight ScaleTop

        ScaleWidth = 20
        ScaleLeft = 0
        ScaleHeight = -100
        ScaleTop = 100

        Dim g As Graphics = e.Graphics
        g.TranslateTransform(0, PictureBox1.Height)
        g.ScaleTransform(PictureBox1.Width / ScaleWidth, PictureBox1.Height / ScaleHeight)
        'g.DrawLine(System.Drawing.Pens.Red, 0, 0, 100, 100)

        ' points

        ' +

        ' x

        ' ligne

        ' Graphics Path


        g.DrawLine(p, 0, 0, 20, 100)
    End Sub



    Public Sub add(ByVal value As Double)
        m_buffer.addItem(value)
        'Debug.Print "add"

        PictureBox1.Refresh()
    End Sub

    Private Sub ctlPlot_Resize(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Resize
        PictureBox1.Height = Me.Height
        PictureBox1.Width = Me.Width
    End Sub
End Class
