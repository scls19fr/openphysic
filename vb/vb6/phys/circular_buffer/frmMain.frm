VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Test circular buffer"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdRedim 
      Caption         =   "Redim"
      Height          =   495
      Left            =   360
      TabIndex        =   5
      Top             =   2520
      Width           =   1215
   End
   Begin VB.ListBox List2 
      Height          =   2205
      Left            =   3000
      TabIndex        =   4
      Top             =   120
      Width           =   975
   End
   Begin VB.ListBox List1 
      Height          =   1620
      Left            =   1800
      TabIndex        =   2
      Top             =   120
      Width           =   975
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "Add"
      Height          =   495
      Left            =   360
      TabIndex        =   1
      Top             =   720
      Width           =   1215
   End
   Begin VB.TextBox txtValue 
      Height          =   495
      Left            =   360
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label lblBufferUsed 
      Height          =   495
      Left            =   360
      TabIndex        =   3
      Top             =   1920
      Width           =   1215
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim Buffer As clsCircularBuffer

Private Sub cmdRedim_Click()
Buffer.Capacity = 10

Show_first
Show_full_buffer
End Sub

Private Sub Form_Load()
Set Buffer = New clsCircularBuffer
'Buffer.Mode = LogMode.Fill
End Sub

Private Sub cmdAdd_Click()
Buffer.addItem (CDbl(txtValue.Text))
lblBufferUsed.Caption = Buffer.Used

Show_first
'Show_last

Show_full_buffer

End Sub

Private Sub Show_first()
' Ordre chronologique
Dim i As Integer
List1.clear
For i = 1 To Buffer.Used
    List1.addItem Buffer.FromFirst(i - 1)
Next i

End Sub

Private Sub Show_last()
' Ordre chronologique inversé
Dim i As Integer
List1.clear
For i = 1 To Buffer.Used
    List1.addItem Buffer.FromLast(i - 1)
Next i

End Sub


Private Sub Show_full_buffer()
Dim i As Integer

' Contenu du buffer (pour debug)
List2.clear
For i = 1 To Buffer.Capacity
    'Dim buf
    'Set buf = Buffer.Buffer
    List2.addItem Buffer.value(i - 1)
Next i
End Sub

Private Sub List1_Click()
List1.clear
End Sub

Private Sub List2_Click()
List2.clear
End Sub
