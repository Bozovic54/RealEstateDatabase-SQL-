USE CetiriZida;


/* Search for properties by property type */
SELECT * FROM Nekretnina INNER JOIN VrstaNekretnine ON Nekretnina.VrstaNekretnineID = VrstaNekretnine.VrstaNekretnineID WHERE VrstaNekretnineNaziv = 'Stan';

/* Search for properties by service type */
SELECT * FROM Nekretnina INNER JOIN Usluga ON Nekretnina.UslugaID = Usluga.UslugaID WHERE USlugaNaziv = 'Izdavanje';

/* Search for properties by city and property type */
SELECT * FROM Nekretnina INNER JOIN VrstaNekretnine ON Nekretnina.VrstaNekretnineID = VrstaNekretnine.VrstaNekretnineID 
INNER JOIN Grad ON Nekretnina.GradID = Grad.GradID WHERE GradNaziv = 'Novi Sad' and VrstaNekretnineNaziv='Stan';

/* Search for properties by city and construction type */
SELECT * FROM Nekretnina INNER JOIN Grad ON Nekretnina.GradID = Grad.GradID WHERE GradNaziv = 'Novi Sad' and NekretninaTipGradnje='Novogradnja';

/* Search for properties by price and property type */
SELECT * FROM Nekretnina INNER JOIN VrstaNekretnine ON Nekretnina.VrstaNekretnineID = VrstaNekretnine.VrstaNekretnineID 
WHERE VrstaNekretnineNaziv='Stan' and NekretninaCena BETWEEN 150000 and 180000;

/* Search for properties by size and property type */
SELECT * FROM Nekretnina INNER JOIN Grad ON Nekretnina.GradID = Grad.GradID WHERE GradNaziv = 'Novi Sad' and NekretninaPovrsina ='50m2';

/* Search for properties by property advertiser */
SELECT * FROM Nekretnina INNER JOIN Oglasivac ON Nekretnina.OglasivacID = Oglasivac.OglasivacID WHERE OglasivacIme = 'CBRE';

/* Search for properties by type of furnishing */
SELECT NekretninaTip,NekretninaPovrsina,NekretninaPovrsina,NekretninaDatumOglasavanja, OpremljenostNaziv FROM Nekretnina LEFT OUTER JOIN Opremljenost
ON Nekretnina.OpremljenostID = Opremljenost.OpremljenostID AND OpremljenostNaziv = 'Polunamesteno';

/* Search for properties by property type(OUTER JOIN) */
SELECT NekretninaTip,NekretninaPovrsina,NekretninaPovrsina,NekretninaDatumOglasavanja, VrstaNekretnineNaziv 
FROM Nekretnina LEFT OUTER JOIN VrstaNekretnine ON Nekretnina.VrstaNekretnineID = VrstaNekretnine.VrstaNekretnineID AND VrstaNekretnineNaziv
= 'Stan';

/* Average property price by cities /independent subquery/ */
SELECT GradNaziv, 
       (SELECT AVG(NekretninaCena) FROM Nekretnina WHERE Grad.GradID = Nekretnina.GradID) AS ProsecnaCena
FROM Grad;

/* Number of properties by advertiser /correlated subquery/ */
SELECT OglasivacIme,
       (SELECT COUNT(*) FROM Nekretnina WHERE Oglasivac.OglasivacID = Nekretnina.OglasivacID) AS BrojNekretnina
FROM Oglasivac;

/* Number of properties by city */
SELECT GradNaziv,
       (SELECT COUNT(*) FROM Nekretnina WHERE Grad.GradID = Nekretnina.GradID) AS BrojNekretnina
FROM Grad;

/* Existence of properties with a price lower than the selected one /EXISTS predicate/ */ 
SELECT NekretninaTip
FROM Nekretnina
WHERE EXISTS (
    SELECT 1
    FROM Nekretnina
    WHERE NekretninaCena < 100000
);

/* Existence of properties with the selected advertiser */
SELECT OglasivacIme
FROM Oglasivac
WHERE EXISTS (
    SELECT 1
    FROM Nekretnina
    WHERE OglasivacIme='CBRE'
);

/* Display average prices by property type, where the lowest price is 80000 /GROUP BY and HAVING/ */
SELECT NekretninaTip, AVG(NekretninaCena) AS ProsecnaCena
FROM Nekretnina
GROUP BY NekretninaTip
HAVING AVG(NekretninaCena) > 80000;

/* Display the highest property price by cities */
SELECT GradNaziv, MAX(NekretninaCena) AS NajvisaCena
FROM Nekretnina
INNER JOIN Grad ON Nekretnina.GradID = Grad.GradID
GROUP BY GradNaziv;

/* Ignore the first 10 rows and fetch the next 5, for pagination /OFFSET-FETCH/ */ 
SELECT NekretninaTip, NekretninaCena
FROM Nekretnina
ORDER BY NekretninaCena
OFFSET 10 ROWS
FETCH NEXT 5 ROWS ONLY;











