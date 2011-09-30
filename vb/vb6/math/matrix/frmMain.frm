VERSION 5.00
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form frmMain 
   Caption         =   "Matrices"
   ClientHeight    =   5625
   ClientLeft      =   120
   ClientTop       =   420
   ClientWidth     =   9525
   LinkTopic       =   "Form1"
   ScaleHeight     =   5625
   ScaleWidth      =   9525
   StartUpPosition =   3  'Windows Default
   Begin VB.ComboBox cboOperation 
      Height          =   315
      ItemData        =   "frmMain.frx":0000
      Left            =   1680
      List            =   "frmMain.frx":000A
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   1080
      Width           =   1095
   End
   Begin MSDataGridLib.DataGrid DataGridA 
      Height          =   2055
      Left            =   360
      TabIndex        =   0
      Top             =   3120
      Width           =   3615
      _ExtentX        =   6376
      _ExtentY        =   3625
      _Version        =   393216
      HeadLines       =   1
      RowHeight       =   15
      BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColumnCount     =   2
      BeginProperty Column00 
         DataField       =   ""
         Caption         =   ""
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1036
            SubFormatType   =   0
         EndProperty
      EndProperty
      BeginProperty Column01 
         DataField       =   ""
         Caption         =   ""
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1036
            SubFormatType   =   0
         EndProperty
      EndProperty
      SplitCount      =   1
      BeginProperty Split0 
         BeginProperty Column00 
         EndProperty
         BeginProperty Column01 
         EndProperty
      EndProperty
   End
   Begin MSDataGridLib.DataGrid DataGridB 
      Height          =   2055
      Left            =   4680
      TabIndex        =   1
      Top             =   360
      Width           =   3615
      _ExtentX        =   6376
      _ExtentY        =   3625
      _Version        =   393216
      HeadLines       =   1
      RowHeight       =   15
      BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColumnCount     =   2
      BeginProperty Column00 
         DataField       =   ""
         Caption         =   ""
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1036
            SubFormatType   =   0
         EndProperty
      EndProperty
      BeginProperty Column01 
         DataField       =   ""
         Caption         =   ""
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1036
            SubFormatType   =   0
         EndProperty
      EndProperty
      SplitCount      =   1
      BeginProperty Split0 
         BeginProperty Column00 
         EndProperty
         BeginProperty Column01 
         EndProperty
      EndProperty
   End
   Begin MSDataGridLib.DataGrid DataGridC 
      Height          =   2055
      Left            =   4680
      TabIndex        =   2
      Top             =   3120
      Width           =   3615
      _ExtentX        =   6376
      _ExtentY        =   3625
      _Version        =   393216
      HeadLines       =   1
      RowHeight       =   15
      BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColumnCount     =   2
      BeginProperty Column00 
         DataField       =   ""
         Caption         =   ""
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1036
            SubFormatType   =   0
         EndProperty
      EndProperty
      BeginProperty Column01 
         DataField       =   ""
         Caption         =   ""
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1036
            SubFormatType   =   0
         EndProperty
      EndProperty
      SplitCount      =   1
      BeginProperty Split0 
         BeginProperty Column00 
         EndProperty
         BeginProperty Column01 
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim A(4, 4) As Double
Dim B(2, 2) As Double
Dim C(2, 2) As Double
Dim i, j, k As Integer

Private Sub cboOperation_Click()
If cboOperation.ListIndex = 0 Then
    addMatr A, B, C
Else
    multMatr A, B, C
End If

Afficher
End Sub

Private Sub Form_Load()
cboOperation.ListIndex = 0

A(1, 1) = 1#
A(1, 2) = 2#
A(2, 1) = 3#
A(2, 2) = 4#

B(1, 1) = 4#
B(1, 2) = 3#
B(2, 1) = 2#
B(2, 2) = 1#

With DataGridA
    .AllowAddNew = False
    .Caption = "A"
End With

With DataGridB
    .AllowAddNew = False
    .Caption = "B"
End With

With DataGridC
    .AllowAddNew = False
    .Caption = "C"
End With

cboOperation_Click
End Sub

Private Sub addMatr(A() As Double, B() As Double, C() As Double)

For j = 1 To 2
    For i = 1 To 2
        C(i, j) = A(i, j) + B(i, j)
    Next i
Next j

End Sub

Private Sub multMatr(A() As Double, B() As Double, C() As Double)
For i = 1 To 2
    For j = 1 To 2
        For k = 1 To 2
            C(i, j) = C(i, j) + A(i, k) * B(k, j)
        Next k
    Next j
Next i
End Sub

Private Sub Afficher()
Afficher_Grid DataGridA, A, "A"
Afficher_Grid DataGridB, B, "B"
Afficher_Grid DataGridC, C, "C"

Afficher_Debug A, "A"
Afficher_Debug B, "B"
Afficher_Debug C, "C"
End Sub


Private Sub Afficher_Debug(M() As Double, s As String)
For i = 1 To 2
    For j = 1 To 2
        Debug.Print s + "(" + CStr(i) + "," + CStr(j) + ")=" + CStr(M(i, j))
    Next j
Next i
End Sub

Private Sub Afficher_Grid(ByRef ctr As DataGrid, ByRef M() As Double, s As String)
With ctr
    .Caption = s
    .ClearFields
    '.ColumnHeaders = False 'True
    '.Row = 5
    '.Columns = 2
    
'    .Text = "test"
End With

'Dim d As DataMembers
'Dim d As DataBinding
'Dim d As DataBindings
'Dim d As DataMembers
'Dim d2 As Data
'd2.

For i = 1 To 2
    For j = 1 To 2
    
    Next j
Next i
End Sub

