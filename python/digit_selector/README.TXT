Classe permettant de gérer plusieurs "Digits"

Exemple d'application:
   mot de passe à chiffre (type cadenas vélo...)
   

ToDo:
    version password avec "cascade" du débordement
         0 0 0[9] + next_value     ->  0 0 1[0]
         0 0 1[0] + previous_value ->  0 0 0[9]
         9 9 9[9] + next_value     ->  0 0 0[0]
         0 0 0[0] + previous_value ->  9 9 9[9]
         
    generation [1, 2, 2.5, 5, 10, 25, 50...]
    digit -2 (0.01) à 3 (1000)
