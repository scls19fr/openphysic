Option Explicit On
Option Strict On

Public Class frmMain
    Dim Buffer As clsCircularBuffer(Of Double)

    Private Sub frmMain_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Buffer = New clsCircularBuffer(Of Double)
    End Sub

    Private Sub cmdAdd_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdAdd.Click
        Buffer.addItem(CDbl(txtValue.Text))
        lblBufferUsed.Text = CStr(Buffer.Used)

        Show_first()
        'Show_last

        Show_full_buffer()
    End Sub

    Private Sub Show_first()
        ' Ordre chronologique
        Dim i As Integer
        ListBox1.Items.Clear()
        For i = 1 To Buffer.Used
            ListBox1.Items.Add(Buffer.FromFirst(i - 1))
        Next i

    End Sub

    Private Sub Show_last()
        ' Ordre chronologique inversé
        Dim i As Integer
        ListBox1.Items.Clear()
        For i = 1 To Buffer.Used
            ListBox1.Items.Add(Buffer.FromLast(i - 1))
        Next i

    End Sub


    Private Sub Show_full_buffer()
        Dim i As Integer

        ' Contenu du buffer (pour debug)
        ListBox2.Items.Clear()
        For i = 1 To Buffer.Capacity
            ListBox2.Items.Add(Buffer.value(i - 1))
        Next i
    End Sub

    Private Sub cmdRedim_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdRedim.Click
        Buffer.Capacity = 10

        Show_first()
        Show_full_buffer()
    End Sub

    Private Sub ListBox1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBox1.Click
        ListBox1.Items.Clear()
    End Sub

    Private Sub ListBox2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBox2.Click
        ListBox2.Items.Clear()
    End Sub


End Class
