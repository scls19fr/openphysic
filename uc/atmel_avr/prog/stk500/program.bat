set output=liberlabfirm.hex
stk500 -dATmega8 -e -if%output% -pf -vf
pause