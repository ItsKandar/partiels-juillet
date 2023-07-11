# Proposer un algorithme récursif en python qui calculera le produit de deux entiers naturels

def produit(a,b):
    if b == 0:
        return 0
    else:
        return a + produit(a,b-1)
    
print(produit(5,3))