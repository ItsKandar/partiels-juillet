# Proposer un algorithme récursif en python qui permet de déterminer la longueur d'une chaine de caractères

def longueur(chaine):
    if chaine == "":
        return 0
    else:
        return 1 + longueur(chaine[1:])
    
print(longueur("bonjour"))