#!/usr/bin/env python3

import smtplib
import time
#import random

#todo : add randomstring

sender = 'from@domain.com'
receivers = ['to1@domain.com']

try:
	smtpObj = smtplib.SMTP('smtp.domain.fr', 25)

	#smtpObj = smtplib.SMTP_SSL('smtp.univ-xxx.fr', 465) # py>=2.6.2
	#smtpObj.login('login', 'password')

	for i in range(0,3):
		message = """From: From Person <from@fromdomain.com>
To: To Person <to@todomain.com>
Subject: SMTP e-mail test

This is a test e-mail message %s.
""" % (i)
	
		#smtpObj.sendmail(sender, receivers, message)
		print("Successfully sent email")
		print(message)
		#time.sleep(2) 

except SMTPException:
	print("Error: unable to send email")
