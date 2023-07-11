// Ecrire une fonction en C qui retourne la distance de Hamming entre 2 chaînes de caractères de même longueur.
// La distance de Hamming entre 2 mots de même longueur est le nombre d'endriots où les lettres sont différentes.
// Par exemple, la distance de Hamming entre les mots SAPIN et LAPIN est 1.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int dist_hamming(char *mot1, char *mot2)
{
    int i = 0;
    int dist = 0;
    while (mot1[i] != '\0')
    {
        if (mot1[i] != mot2[i])
        {
            dist++;
        }
        i++;
    }
    return dist;
}

int main()
{
    char mot1[100] = "";
    char mot2[100] = "";
    printf("Entrez un mot : ");
    scanf("%s", mot1);
    printf("Entrez un autre mot : ");
    scanf("%s", mot2);
    printf("La distance de Hamming entre %s et %s est %d\n", mot1, mot2, dist_hamming(mot1, mot2));
    return 0;
}