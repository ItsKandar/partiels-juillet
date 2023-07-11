// Demander à l'utilisateur un niveau de difficulté (entre facile, normal et difficile). Suite au choix de l'utilisateur, vous devez créer
// un plateau de jeu DYNAMIQUEMENT en fonction de la difficulté :
//
// - facile : 3 * 3
// - normal : 6 * 6
// - difficile : 9 * 9
//
// Vous initialiserez le plateau de jeu avec des 0.
//
// Ecrire une fonction en C qui libérera la mémoire alloué précédemment. La fonction prendra en paramètre la matrice crée précédemment ainsi
// que le nombre de lignes de la matrice.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int **crea_plateau_jeux(int taille)
{
    int **plateau = NULL;
    int i = 0;
    int j = 0;

    plateau = malloc(taille * sizeof(int *));
    for (i = 0; i < taille; i++)
    {
        plateau[i] = malloc(taille * sizeof(int));
        for (j = 0; j < taille; j++)
        {
            plateau[i][j] = 0;
        }
    }
    return plateau;
}

void libere_plateau_jeux(int **plateau, int nb_lignes)
{
    int i = 0;
    for (i = 0; i < nb_lignes; i++)
    {
        free(plateau[i]);
    }
    free(plateau);
}

int main()
{
    int **plateau = NULL;
    int taille = 0;
    int i = 0;
    int j = 0;
    char difficulte[10] = "";

    printf("Quel est votre niveau de difficulté ? ");
    scanf("%s", difficulte);

    if (strcmp(difficulte, "facile") == 0)
    {
        taille = 3;
    }
    else if (strcmp(difficulte, "normal") == 0)
    {
        taille = 6;
    }
    else if (strcmp(difficulte, "difficile") == 0)
    {
        taille = 9;
    }

    plateau = crea_plateau_jeux(taille);

    for (i = 0; i < taille; i++)
    {
        for (j = 0; j < taille; j++)
        {
            printf("%d ", plateau[i][j]);
        }
        printf("\n");
    }

    libere_plateau_jeux(plateau, taille);

    return 0;
}