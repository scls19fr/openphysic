@echo off
REM Script Batch d'envoi de fichiers sur l'afficheur
REM ================================================
call config.cmd
pscp -pw %PWD% -l %USER% display/messages/* %IP_ADR%:/home/pi/display/messages/

plink %IP_ADR% -l %USER% -pw %PWD% /home/pi/browser/misc/switch_off_monitor.sh
plink %IP_ADR% -l %USER% -pw %PWD% /home/pi/browser/misc/restart_browser.sh
plink %IP_ADR% -l %USER% -pw %PWD% /home/pi/browser/misc/switch_on_monitor.sh
