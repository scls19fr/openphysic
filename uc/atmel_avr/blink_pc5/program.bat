set output=avrm8ledtest_pre.hex
stk500 -dATmega8 -e -if%output% -pf -vf
pause
