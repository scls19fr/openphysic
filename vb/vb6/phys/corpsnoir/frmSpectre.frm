VERSION 5.00
Begin VB.Form frmSpectre 
   Caption         =   "Corps noir"
   ClientHeight    =   7470
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   17865
   LinkTopic       =   "Form1"
   ScaleHeight     =   7470
   ScaleWidth      =   17865
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox lstValeurs 
      Height          =   4155
      Left            =   8400
      TabIndex        =   4
      Top             =   2640
      Width           =   5655
   End
   Begin VB.CommandButton cmdCalculer 
      Caption         =   "Calculer"
      Height          =   615
      Left            =   8640
      TabIndex        =   3
      Top             =   1680
      Width           =   1935
   End
   Begin VB.TextBox txtT 
      Height          =   615
      Left            =   8640
      TabIndex        =   1
      Text            =   "10000"
      Top             =   600
      Width           =   1935
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H00FFFFFF&
      Height          =   6735
      Left            =   240
      ScaleHeight     =   6675
      ScaleWidth      =   7515
      TabIndex        =   0
      Top             =   240
      Width           =   7575
   End
   Begin VB.Label lblMtheo 
      Caption         =   "lblMtheo"
      Height          =   615
      Left            =   14040
      TabIndex        =   12
      Top             =   1800
      Width           =   2415
   End
   Begin VB.Label Label5 
      Caption         =   "M_theo = sigma * T^4"
      Height          =   375
      Left            =   11280
      TabIndex        =   11
      Top             =   1800
      Width           =   2295
   End
   Begin VB.Label lblM 
      Caption         =   "lblM"
      Height          =   615
      Left            =   14040
      TabIndex        =   10
      Top             =   1320
      Width           =   2895
   End
   Begin VB.Label Label4 
      Caption         =   "M"
      Height          =   375
      Left            =   11280
      TabIndex        =   9
      Top             =   1320
      Width           =   2295
   End
   Begin VB.Label lblSigmaW 
      Caption         =   "lblSigmaW"
      Height          =   615
      Left            =   14280
      TabIndex        =   8
      Top             =   480
      Width           =   2295
   End
   Begin VB.Label Label3 
      Caption         =   "sigma_w"
      Height          =   375
      Left            =   14280
      TabIndex        =   7
      Top             =   120
      Width           =   2175
   End
   Begin VB.Label lblLambdaM 
      Height          =   495
      Left            =   11040
      TabIndex        =   6
      Top             =   480
      Width           =   2775
   End
   Begin VB.Label Label2 
      Caption         =   "lambda_m"
      Height          =   375
      Left            =   11040
      TabIndex        =   5
      Top             =   120
      Width           =   2775
   End
   Begin VB.Label Label1 
      Caption         =   "T"
      Height          =   495
      Left            =   8640
      TabIndex        =   2
      Top             =   120
      Width           =   1935
   End
End
Attribute VB_Name = "frmSpectre"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Const pi As Double = 3.1416
Const h As Double = 6.6256E-34
Const c0 As Double = 299790000#
Const nlambda As Double = 1
Const clambda As Double = c0 / nlambda
Const kB As Double = 1.3807E-23
Const e As Double = 2.71828

Const sigma_w As Double = 2.898768651 * 10 ^ (-3) ' constante de Wien m.K
Const sigma As Double = 5.6704 * 10 ^ (-8) ' constante de Stefan-Boltzmann W m^-2.K^-4

Public Function Llambda(ByVal lambda As Double, ByVal T As Double)
' calcule la densite d'energie associee a un corps noir
' qui est porte a une temperature T
'   lambda   longueur d'onde [m]  (vecteur)
'   T   temperature [K] (scalaire)
    Llambda = (2 * h * clambda ^ 2) / (lambda ^ 5) / (e ^ (h * clambda / (kB * T * lambda)) - 1)
End Function


Private Sub cmdCalculer_Click()
    Dim lambda As Double
    
    Const lambda_min As Double = 1 * 10 ^ -8
    Const lambda_max As Double = 2 * 10 ^ -6
    Const lambda_step As Double = 1 * 10 ^ -8
    
    Dim T As Double
    Dim i As Integer
    
    T = txtT.Text

    ' Valeurs dans la ListBox
    ' =======================
    For lambda = lambda_min To lambda_max Step lambda_step
        lstValeurs.AddItem "lambda = " & lambda & " ; Llambda = " & Llambda(lambda, T)
    Next lambda


    ' Tracé dans le PictureBox
    ' ========================
    Picture1.ScaleMode = 0  'Mode utilisateur
    Picture1.ScaleWidth = lambda_max 'Axe X vers la droite
    Picture1.ScaleLeft = 0 'Origine de l'axe des  ordonnées (X=0 à gauche)
    Picture1.ScaleHeight = -4.5 * 10 ^ 8 'Axe Y vers le haut (signe -)
    Picture1.ScaleTop = 4.5 * 10 ^ 8 'Origine de l'axe des abscisses (Y=5 milieu de zone)
    Picture1.DrawWidth = 1 'Epaisseur des traits et points
    Picture1.ForeColor = vbRed  'couleur des traits et points


    'Picture1.Line (0, 0)-(2 * 10 ^ -6, 4.5 * 10 ^ 8) ' Ligne pour tester l'initialisation du PictureBox
    
    For lambda = lambda_min To lambda_max Step lambda_step
        'Picture1.PSet (lambda, Llambda(lambda, T) / 10 ^ 6)
        Picture1.Line (lambda, Llambda(lambda, T) / 10 ^ 6)-(lambda + lambda_step, Llambda(lambda + lambda_step, T) / 10 ^ 6)
    Next lambda
    
    ' recherche de lambda_m -> Loi du déplacement de Wien
    ' ===================================================
    Dim lambda_m As Double
    Dim L_lambda_m As Double
    L_lambda_m = Llambda(lambda_min, T) ' on peut éventuellement mettre 0 car la fonction est strictement positive
    lambda_m = 0 ' attention à ne pas confondre lambda_max et lambda_m
    For lambda = lambda_min To lambda_max Step lambda_step
        If Llambda(lambda, T) > L_lambda_m Then
            L_lambda_m = Llambda(lambda, T)
            lambda_m = lambda
        End If
    Next lambda
    lblLambdaM.Caption = lambda_m
    lblSigmaW.Caption = lambda_m * T
    
    
    ' intégration numérique -> Loi de Stephan-Boltzmann
    ' =================================================
    Dim L As Double
    Dim M As Double
    L = 0
    For lambda = lambda_min To lambda_max - lambda_step Step lambda_step
        L = L + (Llambda(lambda, T) + Llambda(lambda + lambda_step, T)) * lambda_step / 2
    Next lambda
    M = pi * L
    lblM.Caption = M
    lblMtheo = sigma * T ^ 4
End Sub

