Utilise la base de données example;
USE `example`;

1.

SELECT * 
FROM employe;

2.

SELECT * 
FROM dept;

3.

SELECT employe.nom , employe.dateemb , employe.nosup , employe.nodep , employe.salaire
FROM employe
JOIN dept
ON dept.nodept = employe.nodep;

4. 

SELECT DISTINCT nom , titre
FROM employe;

6.

SELECT nom , noemp , nodep , titre
FROM employe
WHERE titre = 'secretaire';


7.

SELECT nom , noemp , nodep
FROM employe
WHERE nodep > 40 ;


12.

SELECT nom , titre , salaire , nodep 
FROM employe
WHERE (titre = "représentant" or titre = "secretaire")
AND nodep = 34;

18.

SELECT nom , salaire , nodep 
FROM employe
WHERE nodep = 41
ORDER BY salaire ASC;

19.

select nom , salaire , nodep 
FROM employe
where nodep = 41
order by salaire DESC ;

20.

SELECT nom , salaire , nodep , titre
FROM employe
ORDER BY salaire DESC , titre ASC;


21.

SELECT nom , salaire , tauxcom , titre
FROM employe
ORDER BY tauxcom ASC;



22.

INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('11', 'BaseDonnees', '80');
SELECT nom , salaire , tauxcom , titre
FROM employe
WHERE tauxcom is NULL
ORDER BY tauxcom DESC; 

24.

SELECT nom , salaire , tauxcom , titre
FROM employe
WHERE tauxcom < 15
ORDER BY tauxcom DESC;


25.

SELECT nom , salaire , tauxcom , titre
FROM employe
WHERE tauxcom > 15
ORDER BY tauxcom DESC;

26.

SELECT nom , salaire , tauxcom , (tauxcom * salaire) as commission
FROM employe
WHERE tauxcom is NOT NULL;

27.

SELECT nom , salaire , tauxcom 
FROM employe
WHERE tauxcom is NOT NULL
ORDER BY tauxcom ASC;


29.

SELECT SUBSTR(nom, 1,5)
FROM employe;


Ajouter trois employés dans la base de données avec les données de votre choix.;

	INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) 
	VALUES (51, 'roger', 'discount', '2023-04-17', 5, 'président', '50', 50000, NULL),
        	(52, 'Nourriture', 'michel', '2023-04-17', '1', 'dir.distrib', '41', 35000, NULL) ,
        	(53, 'bernard', 'bernard', '2023-04-17', '1', 'dir.vente', '31', 34000, NULL);


Ajouter un département;
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('11', 'BaseDonnees', '80');

    
Augmenter de 10% le salaire de l employe 17;

UPDATE employe
SET salaire = salaire * 1.1
WHERE noemp = 17;

              
              
----------------------Partie 2-----------------------------------

1.

SELECT COUNT(nom) AS 'nombre', titre 
FROM employe 
GROUP BY titre;
2.

SELECT AVG(salaire) AS 'moyenne_salaire', SUM(salaire) AS 'salaire', nodep 
FROM employe 
GROUP BY nodep;

3.

SELECT COUNT(nom) AS 'nombre', nodep
FROM employ 
GROUP BY nodep 
HAVING COUNT(*) > 3;

4.

SELECT COUNT(nom, 1) AS 'initiale', COUNT(*) AS 'count'
FROM employe 
GROUP BY ltr 
HAVING COUNT(*) > 3;
5. Rechercher le salaire maximum et le salaire minimum parmi tous les
salariés et l écart entre les deux. ;

SELECT MAX(salaire) AS "salairemax", 
     MIN(salaire) AS "salairemin",
    'salairemax' - 'salairemin' 
AS diff 
FROM employe;

6.

SELECT COUNT(DISTINCT titre) as'Titre'
FROM employe;

7.

SELECT COUNT(nom) as 'nom', titre 
FROM employe 
GROUP BY titre;

8.

SELECT DISTINCT dept.nom , count(employe.nom)
FROM employe 
JOIN dept 
ON employe.nodep = dept.nodept
GROUP BY dept.nom

;


9.



SELECT AVG(salaire) AS 'salaire', titre
from employe
group by titre
HAVING salaire > (
                Select AVG(salaire) AS 'salaire'
                from employe
                WHERE titre = "représentant")

;

10.

SELECT COUNT(tauxcom) AS 'taux_commission', COUNT(salaire) AS ' salaire'
FROM employe;


SELECT employe.nodep , employe.nom , dept.nom
FROM employe
JOIN dept 
ON employe.nodep = dept.nodept 
order by employe.nodep;


SELECT employe.nodep AS "numero_departement" , employe.nom AS 'salarie' , dept.nom AS "departement"
FROM employe
JOIN dept 
ON employe.nodep = dept.nodept 
order by employe.nodep;


SELECT employe.nodep AS "numero_departement" , employe.nom AS 'salarie' , dept.nom AS "departement"
FROM employe
JOIN dept 
ON employe.nodep = dept.nodept 
WHERE employe.nodep = 41 ;


SELECT employe.nodep AS "numero_departement" , employe.prenom AS 'salarie'
FROM employe
JOIN dept 
ON employe.nodep = dept.nodept ;


SELECT table1.nom,table1.salaire,table1.titre,table1.nosup,
        table2.noemp,table2.salaire,table2.nom,table2.titre
FROM employe table1,employe table2
WHERE table1.nosup = table2.noemp
having table1.salaire > table2.salaire ;



