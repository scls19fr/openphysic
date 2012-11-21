@echo off
REM Script Batch de recuperation des fichiers sur l'afficheur
REM =========================================================
call config.cmd
pscp -pw %PWD% -l %USER% %IP_ADR%:/home/pi/browser/misc/browser.template.ini browser/misc/browser.template.ini
pscp -pw %PWD% -l %USER% %IP_ADR%:/home/pi/display/messages/* display/messages
pscp -pw %PWD% -l %USER% %IP_ADR%:/home/pi/display/html/intro/* display/html/intro