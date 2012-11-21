@echo off
REM Script Batch d'extinction de l'écran de l'afficheur
REM ===================================================
call config.cmd
plink %IP_ADR% -l %USER% -pw %PWD% /home/pi/browser/misc/switch_off_monitor.sh
