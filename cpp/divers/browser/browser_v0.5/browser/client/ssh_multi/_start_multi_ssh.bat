@ECHO OFF

REM Run several SSH connections

FOR /f %%i IN (ssh_list.txt) DO (
  ECHO Start SSH %%i
  start putty.exe -ssh %%i
)

PuTTYCS.exe