@echo off
REM Script Batch d'allumage de l'écran de l'afficheur
REM =================================================
call config.cmd
plink %IP_ADR% -l %USER% -pw %PWD% /home/pi/browser/misc/switch_on_monitor.sh