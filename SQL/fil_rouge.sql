USE restaurant;
--1.
SELECT  date_commande, nom_client , telephone_client , email_client , adresse_client, plat.libelle, plat.prix
FROM commande 
JOIN plat
ON plat.id = id_plat;
--2.
SELECT plat.libelle AS plat, categorie.libelle AS categorie
FROM categorie
JOIN plat ON categorie.id=plat.id_categorie;

--3

SELECT categorie.libelle, COUNT(plat.id)
FROM categorie
JOIN plat ON categorie.id=plat.id_categorie
WHERE plat.etat='Yes'
GROUP BY categorie.libelle;

--4

SELECT libelle, SUM(quantite) AS ventes
FROM commande
JOIN plat ON commande.id_plat=plat.id
GROUP BY libelle
ORDER BY ventes DESC;

--5

SELECT libelle, sum(total) AS CA
FROM commande
JOIN plat ON commande.id_plat=plat.id
GROUP BY libelle
ORDER BY SUM(total) DESC
LIMIT 1;

--6

SELECT nom_client, telephone_client, sum(total) AS CA
FROM commande
JOIN plat ON commande.id_plat=plat.id
GROUP BY telephone_client
ORDER BY SUM(total) DESC;

--7

DELETE FROM plat
WHERE active = 'No';

--8

DELETE FROM commande
WHERE etat = 'Livrée';

--9

INSERT INTO categorie (id, libelle, image, etat)
VALUES (15, 'Categorietest','test.jpg', 'Yes');

INSERT INTO plat (id,libelle,description,prix,image,id_categorie,etat)
VALUES (18,"Chedar Burger","Burger composé de chedar.",9.00,"hamburger_chedar.jpg",15,"Yes");

--10

UPDATE plat
SET plat.prix = plat.prix*1.1
WHERE plat.id_categorie = (SELECT categorie.id FROM categorie WHERE categorie.libelle="Pizza");