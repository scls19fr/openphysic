echo OFF

echo  "----------------------------------------------------------"
echo "|          Script de compilation multiplateformes          |"
echo "|                                                          |"
echo "|                  Compilation VB.NET pour                 |"
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


C:\WINDOWS\Microsoft.NET\Framework\v1.1.4322\vbc.exe test.vb /r:Microsoft.VisualBasic.dll,System.Windows.Forms.dll,System.dll

move test.exe BIN_VB_WINDOWS_DESKTOP\test.exe

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
copy dll\Microsoft.VisualBasic.dll
copy dll\System.Windows.Forms.dll
copy dll\System.dll




C:\WINDOWS\Microsoft.NET\Framework\v1.1.4322\vbc.exe test.vb /r:Microsoft.VisualBasic.dll,System.Windows.Forms.dll,System.dll

echo Effacement des DLL Pocket PC




del mscorlib.dll
del Microsoft.VisualBasic.dll
del System.Windows.Forms.dll
del System.dll




move test.exe BIN_VB_WINDOWS_MOBILE\test.exe

echo  "----------------------------------------------------------"
echo "|                    Compilation Pocket PC (END)           |"
echo  "----------------------------------------------------------"




pause