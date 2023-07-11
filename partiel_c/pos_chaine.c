// Ecrire une fonctione positionAT(mot) qui teste si un mot contient "AT" et renvoie la position de la première occurence trouvée.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int positionAT(char *mot)
{
    int i = 0;
    int pos = -1;
    while (mot[i] != '\0' && pos == -1)
    {
        if (mot[i] == 'A' && mot[i + 1] == 'T')
        {
            pos = i;
        }
        i++;
    }
    return pos;
}

int main()
{
    char mot[100] = "";
    printf("Entrez un mot : ");
    scanf("%s", mot);
    printf("La position de AT dans %s est %d\n", mot, positionAT(mot));
    return 0;
}