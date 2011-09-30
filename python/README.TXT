Quelques astuces avec Python
============================

Connaitre le PATH
~~~~~~~~~~~~~~~~~
import os
print os.getcwd()


Executer un script Python
~~~~~~~~~~~~~~~~~~~~~~~~~
execfile("noone.py",globals(),globals())
ou
execfile("noone.py")