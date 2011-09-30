set output=main.hex
stk500 -dATmega8 -e -if%output% -pf -vf
pause