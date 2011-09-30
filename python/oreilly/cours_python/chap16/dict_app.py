# -*- coding:Latin-1 -*-

class Glob:
    """Espace de noms pour les variables et fonctions <pseudo-globales>"""

    dbName = "discotheque"      # nom de la base de données
    user = "jules"              # propriétaire ou utilisateur
    passwd = "abcde"            # mot de passe d'accès
    host = "192.168.0.235"      # nom ou adresse IP du serveur

    # Structure de la base de données.  Dictionnaire des tables & champs :
    dicoT ={"compositeurs":[('id_comp', "k", "clé primaire"),
                            ('nom', 25, "nom"),
                            ('prenom', 25, "prénom"),
                            ('a_naiss', "i", "année de naissance"),
                            ('a_mort', "i", "année de mort")],
            "oeuvres":[('id_oeuv', "k", "clé primaire"),
                       ('id_comp', "i", "clé compositeur"),
                       ('titre', 50, "titre de l'oeuvre"),
                       ('duree', "i", "durée (en minutes)"),
                       ('interpr', 30, "interprète principal")]}

