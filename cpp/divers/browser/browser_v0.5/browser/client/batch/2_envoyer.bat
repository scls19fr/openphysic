@echo off
REM Script Batch d'envoi de fichiers sur l'afficheur
REM ================================================
call config.cmd

REM pscp -pw %PWD% -l %USER% browser/misc/browser.template.ini %IP_ADR%:/home/pi/browser/misc/browser.template.ini

pscp -pw %PWD% -l %USER% display/messages/* %IP_ADR%:/home/pi/display/messages/
pscp -pw %PWD% -l %USER% display/html/intro/* %IP_ADR%:/home/pi/display/html/intro

plink %IP_ADR% -l %USER% -pw %PWD% /home/pi/browser/misc/switch_off_monitor.sh
plink %IP_ADR% -l %USER% -pw %PWD% /home/pi/browser/misc/restart_browser.sh
plink %IP_ADR% -l %USER% -pw %PWD% /home/pi/browser/misc/switch_on_monitor.sh
