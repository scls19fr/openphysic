REM Script de copie de fichiers depuis les comptes utilisateurs
REM Sebastien CELLES
REM 12/12/2007

Const dirOrigine = "\\Andromede\Comptes\GTE\dut"
Const dirDestination =  "C:\Documents and Settings\scelles\Mes documents\copie"
Const liste = "C:\Documents and Settings\scelles\Mes documents\liste.csv"
Const listeErr = "C:\Documents and Settings\scelles\Mes documents\listeErr.csv"
Const matiere = "autocad"
Const extension = "*.dw?" 


Const FOR_READING = 1
Const blnUNICODE = FALSE
Const OverWriteFiles = TRUE 
Const SEP = ","

Dim objFSO, objTS, strContents
Dim objTSerr



Set objFSO = CreateObject("Scripting.FileSystemObject") 


Sub main()

if ( objFSO.FolderExists(dirDestination)=false ) then
  objFSO.CreateFolder(dirDestination)
end if

msgbox("Copie en cours")

REM Lecture du fichier liste des eleves -> classe (type Array)
REM classe = Array("pamyot","qantoine")

If objFSO.FileExists(liste) Then
  Set objTS = objFSO.OpenTextFile(liste, FOR_READING, False, blnUNICODE)
end if
strContents = objTS.ReadAll
objTS.Close
classe=Split(strContents, vbCrLf)

REM Création du fichier d'erreurs
Set objTSerr = objFSO.CreateTextFile(listeErr, OverWriteFiles, blnUNICODE)
objTSerr.Write("login" & SEP & "err.number" & SEP & "err.description" & vbCrLf)

For Each eleve In classe
  REM msgbox("Copie des fichiers de "+eleve)
  REM WScript.Echo "Copie des fichiers de "+eleve
  
  REM Creation repertoire utilisateur (si le répertoire parent existe et que le répertoire à créer n'existe pas déjà)
  if ( objFSO.FolderExists(dirDestination)=true and objFSO.FolderExists(dirDestination+"\"+eleve)=false ) then
	objFSO.CreateFolder(dirDestination+"\"+eleve)
  end if
  
  REM Creation sous-repertoire utilisateur (si le répertoire parent existe et que le répertoire à créer n'existe pas déjà)
  if ( objFSO.FolderExists(dirDestination+"\"+eleve)=true and objFSO.FolderExists(dirDestination+"\"+eleve+"\"+matiere)=false ) then
	objFSO.CreateFolder(dirDestination+"\"+eleve+"\"+matiere)
  end if
  
  fromFile = dirOrigine+"\"+eleve+"\"+matiere+"\"+extension
  toFile = dirDestination+"\"+eleve+"\"+matiere
  
  REM WScript.Echo "Copie de "+vbCrLf+fromFile+vbCrLf+"vers "+vbCrLf+toFile
  
REM if objFSO.FileExists(fromFile)=true then
	On Error Resume Next
	REM On Error Goto ErreurCopie
	objFSO.CopyFile fromFile, toFile, OverWriteFiles
	if err.number <> 0 and eleve <> "" then
		REM MsgBox "Erreur pour "& eleve & " : " & err.number & " " & err.description
		objTSerr.Write(eleve & SEP & err.number & SEP & err.description & vbCrLf)
	end if
Next



msgbox("Fin de la copie de tous les fichiers")


REM Fermeture du fichier d'erreurs
objTSerr.close


Exit Sub

ErreurCopie:
	msgbox("Erreur de copie")

End Sub


main