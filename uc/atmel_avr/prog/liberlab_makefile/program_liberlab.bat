set output=liberlabfirm.hex
stk500.exe -dATmega8 -e -if%output% -pf -vf
stk500.exe -dATmega8 -f0xE4
pause
