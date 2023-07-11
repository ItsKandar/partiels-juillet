# L'objectif est d'ecrire une fonction recursive qui va renvoyer le couple (minimum, maximum) d'un tableau de minimum 3 elements. 
# Un algorithme du type "diviser pour régner" permet de déterminer ce couple en exploitant le fait qu'une seule comparaison suffit 
# pour obtenir a la fois le minimum et la maximum d'un tableau de taille 2.

def min_max(tab):
    if len(tab) == 2:
        if tab[0] < tab[1]:
            return (tab[0], tab[1])
        else:
            return (tab[1], tab[0])
    else:
        (min, max) = min_max(tab[1:])
        if tab[0] < min:
            min = tab[0]
        if tab[0] > max:
            max = tab[0]
        return (min, max)
    
print(min_max([25,13,65,9,87,45,12]))