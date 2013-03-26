@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

REM Run several SSH connections

SET PASSWORD=ToChange

FOR /f "tokens=1-5 delims=;" %%i IN (afficheurs.csv) DO (
  SET USER=%%i
  SET IP=%%j
  SET SITE=%%k
  SET LOCATION=%%l
  SET HOSTNAME=%%m

  ECHO Start VNC connection to !IP! - !HOSTNAME!

  SET STR=!STR! HOST !IP! PORT 5900 PASSWORD %PASSWORD%
)
  ECHO %STR%

VncThumbnailViewer_Win_1.4.2.exe %STR%

REM PAUSE