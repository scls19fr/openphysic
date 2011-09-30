echo OFF

echo  "----------------------------------------------------------"
echo "|          Script de compilation multiplateformes          |"
echo "|                                                          |"
echo "|                   Compilation VC# pour                   |"
echo "|                                                          |"
echo "|                   MS Windows (DESKTOP)                   |"
echo "|                                                          |"
echo "|                   MS Windows (MOBILE)                    |"
echo "|                                                          |"
echo  "----------------------------------------------------------"
echo "|                                                          |"
echo "|                          ! ! ;-)                         |"
echo "|                                                          |"
echo " ----------------------------------------------------------"
echo "|                         par SebC                         |"
echo  "----------------------------------------------------------"


echo " ----------------------------------------------------------"
echo "|                    Compilation Win PC (START)            |"
echo  "----------------------------------------------------------"


C:\WINDOWS\Microsoft.NET\Framework\v1.1.4322\csc.exe test.cs /r:System.Windows.Forms.dll,System.dll

move test.exe BIN_CS_WINDOWS_DESKTOP\test.exe

echo " ----------------------------------------------------------"
echo "|                    Compilation Win PC (END)              |"
echo  "----------------------------------------------------------"

echo  "----------------------------------------------------------"
echo  "----------------------------------------------------------"
echo  "----------------------------------------------------------"
echo  "----------------------------------------------------------"
echo  "----------------------------------------------------------"
echo  "----------------------------------------------------------"
echo  "----------------------------------------------------------"
echo  "----------------------------------------------------------"
echo  "----------------------------------------------------------"

echo  "----------------------------------------------------------"
echo "|                    Compilation Pocket PC (START)         |"
echo  "----------------------------------------------------------"

echo Copie des DLL Pocket PC



copy dll\mscorlib.dll
copy dll\System.Windows.Forms.dll
copy dll\System.dll




C:\WINDOWS\Microsoft.NET\Framework\v1.1.4322\csc.exe test.cs /r:System.Windows.Forms.dll,System.dll

echo Effacement des DLL Pocket PC




del mscorlib.dll
del System.Windows.Forms.dll
del System.dll




move test.exe BIN_CS_WINDOWS_MOBILE\test.exe

echo  "----------------------------------------------------------"
echo "|                    Compilation Pocket PC (END)           |"
echo  "----------------------------------------------------------"




pause