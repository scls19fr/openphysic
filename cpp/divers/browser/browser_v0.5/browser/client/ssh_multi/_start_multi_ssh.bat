@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

REM Run several SSH connections

FOR /f "tokens=1-5 delims=;" %%i IN (afficheurs.csv) DO (
  SET USER=%%i
  SET IP=%%j
  SET SITE=%%k
  SET LOCATION=%%l
  SET HOSTNAME=%%m

  ECHO Start SSH connection to !USER!@!IP! - !HOSTNAME!
  start putty.exe -ssh !USER!@!IP!
)

ECHO Run Putty Command Sender
PuTTYCS.exe

REM PAUSE