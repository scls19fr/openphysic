REM Script Batch d'envoi de fichiers sur l'afficheur
@echo off
pscp -pw raspberry messages/* pi@195.220.220.163:/home/pi/display/messages/

