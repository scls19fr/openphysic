#!/usr/bin/python

from string import maketrans, ascii_uppercase
 
FR_Freq = {'A':9.2,'B':1.02,'C':2.64,'D':3.39,'E':15.87,'F':0.95,'G':1.04,'H':0.77,'I':8.41,
'J':0.89,'K':0.00,'L':5.34,'M':3.24,'N':7.15,'O':5.14,'P':2.86,'Q':1.06,'R':6.46,'S':7.90,
'T':7.26,'U':6.24,'V':2.15,'W':0.00,'X':0.30,'Y':0.24,'Z':0.32}
EN_Freq = {'A':8.08,'B':1.67,'C':3.18,'D':3.99,'E':12.56,'F':2.17,'G':1.80,'H':5.27,'I':7.24,
'J':0.14,'K':0.63,'L':4.04,'M':2.60,'N':7.38,'O':7.47,'P':1.91,'Q':0.09,'R':6.42,'S':6.59,
'T':9.15,'U':2.79,'V':1.00,'W':1.89,'X':0.21,'Y':1.65,'Z':0.07}
 
def Nbr_Letters(Chaine):
    Tab_Letters = {'A':0,'B':0,'C':0,'D':0,'E':0,'F':0,'G':0,'H':0,'I':0,'J':0,'K':0,'L':0,'M':0,
'N':0,'O':0,'P':0,'Q':0,'R':0,'S':0,'T':0,'U':0,'V':0,'W':0,'X':0,'Y':0,'Z':0}
    for Char in Chaine:
        if Char.upper() in Tab_Letters:
            Tab_Letters[Char.upper()]+=1
    return Tab_Letters
 
def Freq_Calc(Tab_Nbr_Letters):
    Total_Occurence = 0
    for i in Tab_Nbr_Letters:
        Total_Occurence += Tab_Nbr_Letters[i]
    for Indice in Tab_Nbr_Letters:
        if Tab_Nbr_Letters[Indice] != 0.:
            Tab_Nbr_Letters[Indice]=100./(Total_Occurence/Tab_Nbr_Letters[Indice])
    return Tab_Nbr_Letters
 
def Freq_Analyse(Chaine_Freq, Lang_Freq):
    A = sorted(Chaine_Freq.keys())
    B = sorted(Lang_Freq.keys())
    x = max(Chaine_Freq.values())
    y = max(Lang_Freq.values())
    for i in A:
        if Chaine_Freq[i] == x:
            L_a = i
            break
    for j in B:
        if Lang_Freq[j] == y:
            L_b = j
            break
    i = 0
    I_a, I_b =0,0
    while i < len(A):
        if A[i] == L_a:
            I_a = i
        elif B[i] == L_b:
            I_b = i
        i+=1
    return I_b-I_a,{L_a:L_b}
 
def Crack(Key, Text):
    return Text.translate(maketrans(ascii_uppercase, ascii_uppercase[Key:] 
+ ascii_uppercase[:Key]))
 
Crypt = raw_input("Votre cryptogramme : ")
Analyse = Freq_Calc(Nbr_Letters(Crypt))
 
#Changer FR_Freq en EN_Freq si vous entrez des cryptogrammes Anglais
raw_input(Crack(Freq_Analyse(Analyse, FR_Freq)[0], Crypt.upper()))
