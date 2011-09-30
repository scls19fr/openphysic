VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Codage XOR"
   ClientHeight    =   6495
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   8940
   LinkTopic       =   "Form1"
   ScaleHeight     =   6495
   ScaleWidth      =   8940
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdQuitter 
      Caption         =   "&Quitter"
      Height          =   495
      Left            =   3720
      TabIndex        =   4
      Top             =   4920
      Width           =   1215
   End
   Begin VB.CommandButton cmdDecoder 
      Caption         =   "<- &Décoder"
      Height          =   495
      Left            =   5760
      TabIndex        =   3
      Top             =   4080
      Width           =   1215
   End
   Begin VB.CommandButton cmdCoder 
      Caption         =   "&Coder ->"
      Height          =   495
      Left            =   1560
      TabIndex        =   2
      Top             =   4080
      Width           =   1215
   End
   Begin VB.TextBox txtCode 
      Height          =   3375
      Left            =   4920
      TabIndex        =   1
      Top             =   360
      Width           =   3375
   End
   Begin VB.TextBox txtOriginal 
      Height          =   3375
      Left            =   360
      TabIndex        =   0
      Text            =   "cool"
      Top             =   360
      Width           =   3375
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Const strCle = "0123"
Dim strOriginal As String
Dim strCode As String
Dim i As Integer

Private Sub cmdCoder_Click()
    strOriginal = txtOriginal.Text
    strCode = strOriginal
       
    For i = 1 To Len(strCode)
        'Mid(strCode, i, 1) = car_original_vers_car_code(Mid(strOriginal, i, 1), Mid(strCle, i, 1)) ' mot de même taille que la clé
        Mid(strCode, i, 1) = car_original_vers_car_code(Mid(strOriginal, i, 1), Mid(strCle, (i - 1) Mod Len(strCle) + 1, 1)) ' mot de taille différente de la clé
    Next i
    
    txtCode.Text = strCode
End Sub

Private Sub cmdDecoder_Click()
    strCode = txtCode.Text
    strOriginal = strCode

    For i = 1 To Len(strOriginal)
        'Mid(strOriginal, i, 1) = car_code_vers_car_original(Mid(strCode, i, 1), Mid(strCle, i, 1)) ' mot de même taille que la clé
        Mid(strOriginal, i, 1) = car_code_vers_car_original(Mid(strCode, i, 1), Mid(strCle, (i - 1) Mod Len(strCle) + 1, 1)) ' mot taille différente de la clé
    Next i

    txtOriginal.Text = strOriginal
End Sub

Private Sub cmdQuitter_Click()
    End
End Sub

Private Function car_original_vers_car_code(ByVal car As String, ByVal carCle As String) As String
    car_original_vers_car_code = Chr(Asc(car) Xor Asc(carCle))
End Function

Private Function car_code_vers_car_original(ByVal car As String, ByVal carCle As String) As String
    car_code_vers_car_original = car_original_vers_car_code(car, carCle)
End Function
