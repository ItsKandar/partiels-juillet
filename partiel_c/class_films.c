// Ecrire un programme en C qui écrira dans un fichier film.txt le classement des 10 films préférés de l'utilisateur. Il sera nécessaire
// de demander les préféres a l'utilisateur.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define NB_FILMS 10
#define TAILLE_MAX 100

int main()
{
    FILE *fichier = NULL;
    char *films[NB_FILMS];
    char *film = NULL;
    int i = 0;
    int j = 0;
    int k = 0;
    int classement = 0;
    int classement2 = 0;
    char *tmp = NULL;

    // Ouverture du fichier en écriture
    fichier = fopen("film.txt", "w");

    // On demande les films préférés à l'utilisateur par ordre de preference
    for (i = 0; i < NB_FILMS; i++)
    {
        printf("Quel est votre %de film préféré ? ", i + 1);
        film = malloc(TAILLE_MAX * sizeof(char));
        scanf("%s", film);
        films[i] = film;
    }

    // On écrit les films dans le fichier
    for (i = 0; i < NB_FILMS; i++)
    {
        fprintf(fichier, "%s\n", films[i]);
    }

    // On ferme le fichier
    fclose(fichier);
}