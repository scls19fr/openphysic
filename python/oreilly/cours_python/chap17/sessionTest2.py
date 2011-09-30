obSess = Session()

obSess.nom = QUERY["nomClient"]
obSess.prenom = QUERY["prenomClient"]
obSess.sexe = QUERY["sexeClient"]

if obSess.sexe.upper() == "M":
    vedette ="Monsieur"
else:
    vedette ="Madame"
print "<H3> Bienvenue, %s %s </H3>" % (vedette, obSess.nom)
print "<HR>"
print """
<a href = "sessionTest3.py"> Suite...</a>"""
