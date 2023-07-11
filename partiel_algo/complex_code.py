# Donner la classe de complexité des codes suivants 

def fonctionName(tab): #1
    n = len(tab)
    aucunEchange = True
    for i in range(n-1, 0, -1):
        aucunEchange = True
        for j in range(i):
            if tab[j] > tab[j+1]:
                tab[j], tab[j+1] = tab[j+1], tab[j]
                aucunEchange = False

        if aucunEchange == True:
            break

# Complexité de #1 : O(n^2)

def fonctionName(a,b): #2
    resultat = a[0]
    auxiliaire = a[0]
    for i in range(len(a)):
        if (a[i] != 0):
            auxiliaire = a[i]

            for j in range(i):
                auxiliaire = auxiliaire * b
            
            resultat = resultat + auxiliaire

    return resultat

# Complexité de #2 : O(n^2)