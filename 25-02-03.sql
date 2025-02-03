CREATE TABLE studentai (
    Studento_id INT PRIMARY KEY,
    Vardas VARCHAR(50) NOT NULL,
    Pavarde VARCHAR(50) NOT NULL,
    Adresas VARCHAR(100),
    Miestas VARCHAR(50),
    Epastas VARCHAR(100) UNIQUE,
    Telefonas VARCHAR(15)
);

CREATE TABLE destytojai (
    Destytojo_id INT PRIMARY KEY,
    Vardas VARCHAR(50) NOT NULL,
    Pavarde VARCHAR(50) NOT NULL,
    Adresas VARCHAR(100),
    Miestas VARCHAR(100),
    Epastas VARCHAR(100) UNIQUE,
    Telefonas VARCHAR(15)
);

CREATE TABLE uzduotys (
    Uzduoties_id INT PRIMARY KEY,
    Pavadinimas VARCHAR(100) NOT NULL,
    Aprasymas TEXT
);

CREATE TABLE rezultatai (
    Rezultato_id INT PRIMARY KEY,
    Uzduoties_id INT,
    Studento_id INT,
    Ivertinimas TINYINT,
    Data DATE,
    Destytojo_id INT,
    FOREIGN KEY (Uzduoties_id) REFERENCES Uzduotys(Uzduoties_id),
    FOREIGN KEY (Studento_id) REFERENCES Studentai(Studento_id),
    FOREIGN KEY (Destytojo_id) REFERENCES Destytojai(Destytojo_id)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/studentai.csv' INTO
TABLE studentai
COLUMNS TERMINATED BY ','
IGNORE 1 LINES;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/destytojai.csv' INTO
TABLE destytojai
COLUMNS TERMINATED BY ','
IGNORE 1 LINES;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/uzduotys.csv' INTO
TABLE uzduotys
COLUMNS TERMINATED BY ','
IGNORE 1 LINES;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/rezultatai.csv' INTO
TABLE rezultatai
COLUMNS TERMINATED BY ','
IGNORE 1 LINES;

-- 9.

SELECT studentai.Studento_id, Vardas, Pavarde, Ivertinimas
FROM studentai
LEFT JOIN rezultatai ON studentai.Studento_id = rezultatai.Studento_id
WHERE studentai.Studento_id IN (2, 5, 9);

-- 10.

SELECT studentai.Studento_id, Vardas, Pavarde, AVG(Ivertinimas)
FROM studentai
LEFT JOIN rezultatai ON studentai.Studento_id = rezultatai.Studento_id
GROUP BY studentai.Studento_id, Vardas, Pavarde;

-- 11.

SELECT studentai.Studento_id, Vardas, Pavarde, Ivertinimas, Pavadinimas
FROM studentai
LEFT JOIN rezultatai ON studentai.Studento_id = rezultatai.Studento_id
LEFT JOIN uzduotys ON rezultatai.Uzduoties_id = uzduotys.Uzduoties_id;

-- 12.

SELECT studentai.Studento_id, Vardas, Pavarde, AVG(Ivertinimas) AS Vidurkis
FROM studentai
LEFT JOIN rezultatai ON studentai.Studento_id = rezultatai.Studento_id
GROUP BY studentai.Studento_id, Vardas, Pavarde
HAVING Vidurkis BETWEEN 8 AND 10;

-- 13.

CREATE TEMPORARY TABLE ivertinimai AS
SELECT 
    Studentai.Studento_id,
    Studentai.Vardas,
    Studentai.Pavarde,
    Rezultatai.ivertinimas,
    Uzduotys.Pavadinimas
FROM Studentai
LEFT JOIN Rezultatai ON Rezultatai.Studento_id = Studentai.Studento_id
LEFT JOIN Uzduotys ON Uzduotys.Uzduoties_id = Rezultatai.Uzduoties_id;

-- 14.

UPDATE rezultatai
SET Data = '2019-10-01'
WHERE Studento_id = 15 AND Rezultato_id = 1;

-- 15.


UPDATE studentai
SET 
	Vardas = 'Marytė',
	Pavarde = 'Martinkėnaitė',
	Miestas = 'Vilnius'
WHERE Studento_id = 3;

-- 16.

DELETE FROM rezultatai
WHERE Studento_id = 10;

DELETE FROM studentai
WHERE Studento_id = 10;

-- 17.

DELETE FROM ivertinimai;

-- 18.

DROP TABLE ivertinimai;

-- 19.

SELECT CONCAT(Miestas, ' - ', Adresas, ' - ', Telefonas) AS kontaktai FROM studentai;

-- 20.

SELECT CONCAT(Uzduoties_id, ', ', Pavadinimas, ', ', Aprasymas) AS info FROM uzduotys;

-- 21.

SELECT UPPER(Miestas) , UPPER(Adresas) FROM studentai;

-- 22.

SELECT LOWER(Vardas) , LOWER(Pavarde) FROM studentai;

-- 23.

SELECT LOWER(Vardas) , UPPER(Miestas) FROM studentai;

-- 24.

ALTER TABLE studentai
ADD Balai TINYINT;

-- 25.

ALTER TABLE studentai
CHANGE Balai Pazymiai TINYINT;

-- 26.

ALTER TABLE studentai
DROP COLUMN Pazymiai;

-- 27.

ALTER TABLE studentai
ADD Stipendija DECIMAL(5, 2);

-- 28.

UPDATE studentai
SET Stipendija = 100.99
WHERE Studento_id BETWEEN 1 AND 6;

-- 29.
-- ???
