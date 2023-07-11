/* Vous avez été engagé par une salle de spectacle. Celle ci souhaite faire évoluer son interface de gestion sur le back-office de son site 
internet. Pour y parvenir, elle a besoin d'afficher un certai nombre d'indicateurs sur cette interface.

C'est là que vous entrez en scène. Il va falloir préparer les différentes requêtes SQL qui seront effectuées en base de donées.

La base de données existe déja, il s'agit d'une base de données MySQL et la salle de spectacle ne compte pas la faire évoluer. Vous trouverez
sa structure à l'Annexe 1.

Malheureusement un petit plaisantin à rendu innefectif certaines requêtes SQL qui avaient déjà été mises en place, il va falloir commencer par
les corriger.

## A - Corriger les erreurs qui se trouvent dans les requêtes SQL suivantes :*/

/* 1 Récuperation du titre de tous les spectacles*/

SELECT nom FROM spectacles; 
/* Nom de la table incorrecte */
/* Correction :*/ 
SELECT titre FROM Spectacle;

/* 2 Récuperation de tous les spectacles qui ont lieu dans le lieu qui possède l'id_lieu n5*/

SELECT * FROM spectacles WHEN fk_id_lieu = 5; 
/* Mauvaise syntaxe de la clause WHERE + nom de table incorrect*/
/* Correction :*/
SELECT * FROM Spectacle WHERE fk_id_lieu = 5;

/* 3 Récuperation du nombre total d'artsites*/

SELECT COUNT(*) AS total_artistes FROM artistes; 
/* Lauvaise syntaxe de la clause COUNT + nom de table incorrect*/
/* Correction :*/
SELECT COUNT(id_artiste) AS total_artistes FROM Artiste;

/* 4 Récuperer les titres des spectacles dont le nom commence par "les"*/

SELECT titre
FROM Ticket
WHERE titre LIKE 'les%'; 
/* Nom de table incorrect*/
/* Correction :*/
SELECT titre
FROM Spectacle
WHERE titre LIKE 'les%';

/* 5 Récuperation du titre des specactles qui se déroulent dans un lieu ayant une capacité supérieure à 2000 personnes*/

SELECT Spectacle.titre FROM Spectacle
JOINTURE Lieu ON Lieu.id_lieu = Spectacle.fk_id_lieu
WHERE Lieu.capacite > 2000;
/* Mauvaise syntaxe de la clause JOIN*/
/* Correction :*/
SELECT Spectacle.titre FROM Spectacle
JOIN Lieu ON Lieu.id_lieu = Spectacle.fk_id_lieu
WHERE Lieu.capacite > 2000;

/* ## B - Exprimer les requêtes suivantes en SQL :*/

/* 1 Récupérer tous les billets */

SELECT * FROM Billet;

/* 2 Récupérer le nombre total de spectacles */

SELECT COUNT(id_spectacle) AS total_spectacles FROM Spectacle;

/* 3 Récupérer les titres de spectacles qui se déroulent au Parc des Princes*/

SELECT Spectacle.titre FROM Spectacle
JOIN Lieu ON Lieu.id_lieu = Spectacle.fk_id_lieu
WHERE Lieu.nom = 'Parc des Princes';

/* 4 Récupérer la liste des différents styles musicaux que les artistes pratiquent*/

SELECT DISTINCT style FROM Artiste;

/* 5 Récupérer toutes les informations des spectacles qui ont au moins un billet dont le prix est inférieur à 70euros*/

SELECT * FROM Spectacle
JOIN Billet ON Billet.fk_id_spectacle = Spectacle.id_spectacle
WHERE Billet.prix < 70;

/* 6 Récupérer le nom de tous les artistes qui participent à un spectacle*/

SELECT Artiste.nom FROM Artiste
JOIN ArtisteSpectacle ON ArtisteSpectacle.fk_id_artiste = Artiste.id_artiste;

/* 7 Récupérer toutes les informations des spectacles qui ont au moins encore 1 billet disponible*/

SELECT * FROM Spectacle
JOIN Billet ON Billet.fk_id_spectacle = Spectacle.id_spectacle
WHERE Billet.quantite_disponible > 0;

/* 8 Récupérer le titre du spectacle qui possède le prix de billet le plus élevé*/

SELECT Spectacle.titre FROM Spectacle
JOIN Billet ON Billet.fk_id_spectacle = Spectacle.id_spectacle
ORDER BY Billet.prix DESC
LIMIT 1;

/* 9 Récupérer toutes les informations de chaque artiste qui se produit dans au moins 1 spectacle qui a lieu au stade de France*/

SELECT Artiste.* FROM Artiste
JOIN ArtisteSpectacle ON ArtisteSpectacle.fk_id_artiste = Artiste.id_artiste
JOIN Spectacle ON Spectacle.id_spectacle = ArtisteSpectacle.fk_id_spectacle
JOIN Lieu ON Lieu.id_lieu = Spectacle.fk_id_lieu
WHERE Lieu.nom = 'Stade de France';




/* Structure

Table Spectacle : 
    id_spectacle(int) : identifiant unique du spectacle
    titre(varchar) : titre du spectacle
    description(text) : description du spectacle
    date_debut(datetime) : date et heure de début du spectacle
    fk_id_lieu(int) : identifiant du lieu où se déroule le spectacle

Table Artiste :
    id_artiste(int) : identifiant unique de l'artiste
    nom(varchar) : nom de l'artiste
    style(text) : style musical de l'artiste

Table ArtisteSpectacle :
    id_artistespectacle(int) : identifiant unique d'artiste associé à spectacle
    fk_id_artiste : identifiant de l'artiste qui participe au spectacle
    fk_id_spectacle : identifiant du spectacle auquel l'artiste participe

Table Lieu :
    id_lieu(int) : identifiant unique du lieu
    nom(varchar) : nom du lieu
    addresse(varchar) : addresse du lieu
    capacite(int) : capacité maximum d'accueil du lieu 

Table Billet : 
    id_billet(int) : identifiant unique du billet
    prix(decimal) : prix du billet
    quantite_disponible(int) : quantité disponible de billets
    fk_id_spectacle(int) : identifiant du spectacle lié au billet*/