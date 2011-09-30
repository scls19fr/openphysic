A voir

http://www.trader-forex.fr/forum/systemes-de-trading-auto/11080-fxcm-system-selector-fss-6.html
http://www.mataf.net/forums/Tradency-1-Mois-De-Test-t17146.html
http://forexforums.dailyfx.com/demandez-aux-experts/276338-fss-tradency.html

2011-05-22
	Performance.xls : comparaison de diverses stratégies
	History.xls : historique de trading d'une stratégie
	MyHistory.xls : mon historique de trading (combinaison de différentes + manuel)
	Portfolio.xls : paramétrage des stratégies
	Positions.xls : positions ouvertes
	Orders.xls : : ordres
	
TODO:
History
	Faire script pour analyser les positions et qui calcule
	(pour un intervalle de temps donné ou pour toutes les données)
->		nb de transactions
->		total pips
->		% trades gagnants
->		% trades perdants
->		Max DD
		PM (nb max de positions ouvertes en simultané)
		Facteur de Profit
->		Temps de Trade Moyen
->		Pips moyen par trade
->		Gain de Trade Moyen (pips)
->		Perte de Trade Moyenne (pips)
->		Trade Profitable Maximal (pips)
->		Perte de Trade Maximale (pips)
		Rollover ($)
		Symboles Tradés

	Calculer le nb de trades avec un total pips dans tel ou tel intervalle
		principe : on définit les bornes ex :
			[0] x<=0 x>0
				renvoie [nb_x_negatif, nb_x_positif_strictement]
			[-10, 10] x<-10 -10<=x<10 x>=10
				renvoie [nb_x_inf_-10, nb_x_entre_-10_et_10, nb_x_sup_10]
			[-10, 0, 10] x<-10 -10<=x<0 0<=x<10 x>=10
				renvoie [nb_x_inf_-10, nb_x_entre_-10_et_10, nb_x_sup_10]

			Rem 1 : trier avant la liste (ou tuple)
			Rem 2 : attention aux bornes <= ou < ?
			Le script renvoie une liste de taille = taille + 1
			
			si bornes = [] on renvoie len()
			
	Simuler la mise en place d'un stop loss (SL) sur une stratégie existante

	Simuler la mise en place d'un take profit (TP=limite) sur une stratégie existante

	Optimiser le SL et le TP à partir d'une stratégie existante
	
	Calculer les pips gagnés à partir du cours d'entrée et de sortie (et de la direction SELL ou BUY)
		(dépend de la paire traitée)
		Pip stands for percentage in point. A pip is equal to 1/100th of 1 percent
	
	Calculer le profit en EUR (en fonction du nb de pips, du cours de la paire xxx/yyy, du cours yyy/EUR et du nb de lots)
	
	Calculer valeur interpolée dans temps
		y = (yb-ya)/(tb-ta)*(t-ta)+ya
		[[t1, y1], [t2, y2], ...] (t croissant)
		trouver y à un t quelconque (ne pas extrapoler)
		
	Portfolio
		Calculer exposition à partir du portfolio et du solde
		Distribution de Symboles de Portefeuille (% EURUSD ; % ... en fonction des lots)
		Distribution de Volumes de Stratégies de Portefeuille
		
	Faire un dictionnaire qui traduit les noms de colonnes
		- pb entre 2 langues
			2 fichiers exportés depuis l'interface ont des entêtes différentes selon la langue choisie
			-> pb pour écrire un code portable entre langues (cf i18n et Python)
		- dans une même langue colonne avec des noms différents mais même signification)
	
	Créer des classes
	 BuySell ou Direction (en interne booléen) if achatvente == Direction.Buy
	 Currency (ex EUR), Pair (ex EURUSD avec valeur buy-sell ask-bid)
	 
	Conversion de devise à partir des paires présentes dans pairs.csv
	Si la paire n'existe pas la construire (si possible)
	soit en inversant, soit en combinant plusieurs paire (cf Algorithme de Dijkstra)
	
	Valeur du pips
	
	Cumuler (Pips ou profit)
	
	Ajouter graphs avec Matplotlib http://matplotlib.sourceforge.net/examples/pylab_examples/plotfile_demo.html
	Intégration SciPi (interpolate, integrate...)
	Comparer avec Quantmod (pour R) http://www.quantmod.com/

MyHistory
types = [int, int, str, str, str, self.strBuySell2BooleanBuy, int, float, strDatetime2datetime, float, strDatetime2datetime, float, float, float, float, float, float]

Orders
#types = [int, int, str, str, self.strBuySell2BooleanBuy, float, float, float, float, float, self.strDatetime2datetime]
#à vérifier (pas de données)

Porfolio
types = [boolean, int, str, str, float, int, int, str, float, float, float]

Positions
types = [int, int, str, str, self.strBuySell2BooleanBuy, float, float, float, float, float, float, float, float, self.strDatetime2datetime]