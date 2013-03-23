@ECHO OFF

REM Run several SSH connections

FOR /f %%i IN (ssh_list.txt) DO (
  ECHO Start SSH connection to %%i
  start putty.exe -ssh %%i
)

ECHO Run Putty Command Sender
PuTTYCS.exe

REM PAUSE