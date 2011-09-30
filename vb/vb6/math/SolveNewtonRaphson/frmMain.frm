VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Solve Newton-Raphson"
   ClientHeight    =   5760
   ClientLeft      =   120
   ClientTop       =   420
   ClientWidth     =   7455
   LinkTopic       =   "Form1"
   ScaleHeight     =   5760
   ScaleWidth      =   7455
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture1 
      BackColor       =   &H00FFFFFF&
      Height          =   2895
      Left            =   240
      ScaleHeight     =   2835
      ScaleWidth      =   6915
      TabIndex        =   7
      Top             =   2640
      Width           =   6975
   End
   Begin VB.CommandButton cmdDessiner 
      Caption         =   "&Dessiner"
      Height          =   495
      Left            =   1200
      TabIndex        =   6
      Top             =   1080
      Width           =   1215
   End
   Begin VB.CommandButton cmdResoudre 
      Caption         =   "Ré&soudre"
      Height          =   495
      Left            =   2760
      TabIndex        =   4
      Top             =   1080
      Width           =   1215
   End
   Begin VB.CommandButton cmdQuitter 
      Caption         =   "&Quitter"
      Height          =   495
      Left            =   2760
      TabIndex        =   3
      Top             =   1800
      Width           =   1215
   End
   Begin VB.CommandButton cmdCalculer 
      Caption         =   "&Calculer"
      Height          =   495
      Left            =   2760
      TabIndex        =   2
      Top             =   240
      Width           =   1215
   End
   Begin VB.TextBox txtX 
      Height          =   495
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   2175
   End
   Begin VB.Label lblFct 
      Alignment       =   2  'Center
      Caption         =   "f(x) = x^2 -2*x -3"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   240
      TabIndex        =   8
      Top             =   2040
      Width           =   2535
   End
   Begin VB.Label lblPas 
      Height          =   495
      Left            =   4200
      TabIndex        =   5
      Top             =   1200
      Width           =   1215
   End
   Begin VB.Label lblY 
      Height          =   495
      Left            =   4200
      TabIndex        =   1
      Top             =   360
      Width           =   2895
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim x, y As Double
Dim xnm1, ynm1 As Double
Dim pas As Integer

Dim xmin, xmax, ymin, ymax, xstep As Double

Const epsY = 1E-20 ' précision en y
Const DeltaX = 0.0001 ' pour calcul de la dérivée

Private Static Function f(ByVal x As Double) As Double
    f = x ^ 2 - 2 * x - 3
End Function

Private Sub cmdCalculer_Click()
    x = CDbl(txtX.Text)
    y = f(x)
    lblY.Caption = CStr(y)
End Sub


Private Sub cmdDessiner_Click()
dessiner
End Sub

Private Sub cmdQuitter_Click()
    End
End Sub

Private Sub cmdResoudre_Click()
dessiner

x = CDbl(txtX.Text)

Dim deriv As Double

Do
    xnm1 = x
    ynm1 = y
    y = f(x)
    deriv = (f(x + DeltaX) - y) / DeltaX
    If Abs(deriv) > 0.1 Then
        x = x - f(x) / deriv
    Else
        lblY.Caption = "Dérivée nulle changez de point" ' en cas de dérivée nulle
        Exit Do
    End If
    y = f(x)
    txtX.Text = CStr(x)
    lblY.Caption = CStr(y)
    pas = pas + 1
    
    AfficherPas
    
    'dessiner_tangente x, f(x), deriv
    ' dessin trait verticaux
    Picture1.ForeColor = vbGreen
    Picture1.Line (x, 0)-(x, f(x))
Loop While Abs(y) > epsY

End Sub

Private Sub Form_Load()
    xmin = -5
    xmax = 5
    xstep = 0.01
    ymin = -5
    ymax = 5
    
    txtX.Text = CStr(0)
    cmdCalculer_Click
    AfficherPas

    With Picture1
        .Cls
        '.DrawWidth = 1
        .ScaleMode = 0
        .ScaleHeight = -(ymax - ymin) ' -10
        .ScaleWidth = xmax - xmin ' 10
        .ScaleTop = (ymax - ymin) / 2 ' 5
        .ScaleLeft = -(xmax - xmin) / 2 ' -5
    End With
    
End Sub

Private Sub lblPas_Click()
    pas = 0
    AfficherPas
End Sub

Private Sub AfficherPas()
    lblPas.Caption = "pas=" + CStr(pas)
End Sub


Private Sub Picture1_Click()
    Picture1.Cls
    dessiner_axes
End Sub


Private Sub dessiner_axes()
    'Beep
    Picture1.ForeColor = vbBlack
    Picture1.Line (xmin, 0)-(xmax, 0) ' axe x
    Picture1.Line (0, ymin)-(0, ymax) ' axe y
End Sub

Private Sub dessiner_tangente(ByVal xA As Double, ByVal yA As Double, ByVal deriv As Double)
    On Error GoTo TraitementErreur ' en cas de dépassement
    Picture1.ForeColor = vbBlue
    For x = xmin To xmax Step xstep
        Picture1.PSet (x, deriv * (x - xA) + yA)
    Next x
    
TraitementErreur:
    Exit Sub
End Sub

Private Sub dessiner()
    Picture1.Cls

    dessiner_axes
    
    ' dessiner courbe
    Picture1.ForeColor = vbRed
    For x = xmin To xmax Step xstep
        y = f(x)
        Picture1.PSet (x, y)
    Next x
End Sub

Private Sub Picture1_Paint()
    dessiner
End Sub

