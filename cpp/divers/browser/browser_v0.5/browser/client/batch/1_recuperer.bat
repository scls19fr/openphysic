REM Script Batch d'envoi de fichiers sur l'afficheur
pscp -pw raspberry pi@195.220.220.163:/home/pi/browser/misc/browser.template.ini browser.template.ini
pscp -pw raspberry pi@195.220.220.163:/home/pi/display/messages/* messages