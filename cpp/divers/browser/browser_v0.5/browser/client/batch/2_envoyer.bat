@echo off
REM Script Batch d'envoi de fichiers sur l'afficheur
REM ================================================
call config.cmd
pscp -pw %PWD% -l %USER% messages/* %IP_ADR%:/home/pi/display/messages/

plink %IP_ADR% -l %USER% -pw %PWD% /home/pi/browser/misc/restart_browser.sh