suiviSess = Session()       # retrouver l'objet-session
suiviSess.article =12345    # lui ajouter des attributs
suiviSess.prix =43.67

print """
<H3> Page suivante </H3> <HR>
Suivi de la commande du client : <BR> %s %s <BR>
Article n° %s, Prix : %s <HR>
""" % (suiviSess.prenom, suiviSess.nom,
       suiviSess.article, suiviSess.prix)


