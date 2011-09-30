db = MySQLdb.Connect(user="freddy", passwd="bcz45", db="club"
                        [, host="192.168.0.125", port=3306, unix_socket=..)


# création du curseur :
cursor = db.cursor()

# affichage des champs présents dans la table active : 
for cursorFieldName in cursor.description:
    print cursorFieldName

# requête type :
ref = cursor.execute("SELECT * FROM membres")
# ref contiendra le n° de référence du dernier enreg. trouvé

# autre exemple avec une variable python :
max_price = 5
cursor.execute("""SELECT spam, eggs, sausage FROM breakfast
            WHERE price < %s""", (max_price,))

# pourquoi un tuple pour s% ?
# parce que les paramètres attendus par la DB API sont des séquences

# transfert du résultat de la requête de sélection dans un tuple de tuples :
res = cursor.fetchall()

# tables accessibles (c'est une requête comme une autre) :
cursor.execute("show tables")
print cursor.fetchall()			# il s'agira d'un tuple

# fermetures :
db.commit()		# termine la transaction
db.rollback()		# annule la transaction (pas toujours possible)
cursor.close() 
db.close()

Fetch row as dictionary :
not standard; alternate cursor class DictCursor
provides a dictionary interface,keys are "column" or "table.column"
if there are two columns with the same name; use SQL AS to rename fields.


