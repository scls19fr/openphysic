#!/usr/bin/env python

import smtplib
from email.MIMEText import MIMEText

expediteur="Sebastien CELLES <sebastien.celles@univ-poitiers.fr>"
destinataire="s.celles@gmail.com"
mail = MIMEText("Test d'envoi de mail")
mail['From'] = expediteur
mail['Subject'] = "Sujet du message"
mail['To'] = destinataire
smtp = smtplib.SMTP("smtp.univ-poitiers.fr:25")
smtp.connect()
smtp.sendmail(expediteur, [destinataire], mail.as_string())
smtp.close()

