CREATE TABLE `DARBUOTOJAI` (
  `ASMENSKODAS` bigint(20) DEFAULT NULL,
  `VARDAS` varchar(20) DEFAULT NULL,
  `PAVARDE` varchar(30) DEFAULT NULL,
  `DIRBANUO` date DEFAULT NULL,
  `GIMIMOMETAI` date DEFAULT NULL,
  `PAREIGOS` varchar(30) DEFAULT NULL,
  `SKYRIAUSPAVADINIMAS` varchar(30) DEFAULT NULL,
  `PROJEKTONUMERIS` int(11) DEFAULT NULL
);

INSERT INTO `DARBUOTOJAI` 
VALUES 
    (32541036850,'Mantas','Bananas','2010-08-01','1999-04-21','Programuotojas','Amzinai atostogose',2),
    (35206891026,'Justas','Zmogauskas','2008-02-04','1990-08-22','Programuotojas','Daug dirbantys',2),
    (35261458702,'Petrius','Kanusauskas','1996-04-18','1976-10-11','Programuotojas','Mazai dirbantieji',1),
    (36510284592,'Antanas','Smeliauskas','2006-05-04','1986-10-14','Testuotojas','Mazai dirbantys',1),
    (38962504820,'Zilvinas','Morkinis','2012-11-20','1988-06-15','Programuotojas','Mazai dirbantys',3),
    (39520146780,'Jonas','Jonauskas','1985-05-25','1960-05-04','Testuotojas','Daug dirbantieji',3),
    (42056548920,'Toma','Antanaitiene','2004-09-11','1979-05-11','Testuotoja','Daug dirbantys',2),
    (44205967260,'Juste','Karnisoviene','1988-09-06','1950-07-30','Projektu vadove','Vadovybe',1),
	(45289645130,'Zinaida','Zidane','1999-04-18','1980-04-01','Programuotoja','Amzinai atostogose',2),
    (49853148205,'Toma','Zidane','2010-10-06','1990-07-14','Projektu vadove','Vadovybe',2);

-- I.
-- 11.
   
SELECT * FROM darbuotojai;

-- 12.

SELECT ASMENSKODAS FROM darbuotojai;

-- 13.

SELECT VARDAS, PAVARDE, PAREIGOS FROM darbuotojai;

-- 14.

SELECT DISTINCT SKYRIAUSPAVADINIMAS FROM darbuotojai;

-- 15.

SELECT * FROM darbuotojai
WHERE SKYRIAUSPAVADINIMAS = 'Daug dirbantys';

-- 16.

SELECT PAREIGOS FROM darbuotojai
WHERE VARDAS = 'Toma';

-- 17.

SELECT * FROM darbuotojai
WHERE GIMIMOMETAI = '1960-05-04';

-- 18.

SELECT VARDAS FROM darbuotojai
WHERE PAVARDE = 'Morkinis';

-- 19.

SELECT VARDAS, PAVARDE FROM darbuotojai
WHERE SKYRIAUSPAVADINIMAS = 'Daug dirbantys';

-- 20.

INSERT INTO `DARBUOTOJAI` 
VALUES 
    (11111111111,'Jonas','Ponas','2025-01-01','1980-12-21','Programuotojas','Amzinai atostogose',2);

-- 21.

INSERT INTO `DARBUOTOJAI` 
VALUES 
    (22222222222,'Janina','Ponina','2025-01-01','1990-05-21', NULL, NULL, NULL);
   
-- 22.  
   
UPDATE `DARBUOTOJAI` 
SET PAREIGOS = 'Programuotoja', SKYRIAUSPAVADINIMAS = 'Daug dirbantys', PROJEKTONUMERIS = 3
WHERE ASMENSKODAS = 22222222222;
   
-- 23.

DELETE FROM `DARBUOTOJAI`
WHERE ASMENSKODAS = 22222222222;

-- 24.

INSERT INTO `DARBUOTOJAI` 
VALUES 
    (33333333333,'Jonas','Antanaitis','2025-02-17','1982-02-21','Programuotojas','Amzinai atostogose',2),
    (44444444444,'Romas','Antanaitis','2025-02-17','1989-06-17','Programuotojas','Amzinai atostogose',2);
   
-- 25.

UPDATE `DARBUOTOJAI` 
SET PAREIGOS = 'Testuotojas'
WHERE PAVARDE = 'Antanaitis';

-- 26.

SELECT COUNT(ASMENSKODAS) AS darbuotoju_skaicius FROM darbuotojai
WHERE PAREIGOS = 'Testuotojas' OR PAREIGOS = 'Testuotoja';

-- II.
-- 1.

SELECT ASMENSKODAS, VARDAS, PAVARDE FROM darbuotojai
WHERE GIMIMOMETAI = '1998-06-15';

-- 2.

SELECT * FROM darbuotojai
WHERE GIMIMOMETAI <= '1998-07-29';

-- 3.

SELECT DIRBANUO, GIMIMOMETAI FROM darbuotojai
WHERE DIRBANUO BETWEEN '2000-10-30' AND '2012-11-11';

-- 4.

SELECT VARDAS, SKYRIAUSPAVADINIMAS, PROJEKTONUMERIS FROM darbuotojai
WHERE PROJEKTONUMERIS IN (2, 3);

-- 5.

SELECT VARDAS, PAVARDE, ASMENSKODAS FROM darbuotojai
WHERE ASMENSKODAS LIKE '4%';

-- 6.

SELECT * FROM darbuotojai
WHERE GIMIMOMETAI LIKE '%12';

-- 7.

SELECT * FROM darbuotojai
WHERE SKYRIAUSPAVADINIMAS LIKE '__u%';

-- 8.

SELECT * FROM darbuotojai
WHERE PAREIGOS IS NULL;

-- 9.

SELECT VARDAS, PAVARDE, DIRBANUO, PAREIGOS FROM darbuotojai
WHERE DIRBANUO >= '2010-08-01' AND PAREIGOS = 'Programuotojas';

-- 10.

SELECT VARDAS, PAVARDE, SKYRIAUSPAVADINIMAS, PROJEKTONUMERIS FROM darbuotojai
WHERE SKYRIAUSPAVADINIMAS = 'Mazai dirbantys' OR PROJEKTONUMERIS = 1;

-- 11.

SELECT VARDAS FROM darbuotojai
WHERE VARDAS NOT LIKE 'J%';

-- 12.

SELECT VARDAS, DIRBANUO, GIMIMOMETAI FROM darbuotojai
WHERE DIRBANUO NOT BETWEEN '2000-10-30' AND '2012-11-11';

-- 13.

SELECT VARDAS, PAVARDE, GIMIMOMETAI FROM darbuotojai
ORDER BY GIMIMOMETAI ASC;

-- 14.

SELECT VARDAS, PAVARDE, GIMIMOMETAI FROM darbuotojai
ORDER BY GIMIMOMETAI DESC;

-- 15.

SELECT MIN(PROJEKTONUMERIS) AS maziausias_nr, MAX(PROJEKTONUMERIS) as didziausias_nr FROM darbuotojai;

-- 16.

SELECT PROJEKTONUMERIS, COUNT(*) as zmoniu_skaicius FROM darbuotojai
GROUP BY PROJEKTONUMERIS;

-- 17.

SELECT PROJEKTONUMERIS, COUNT(*) AS zmoniu_skaicius
FROM darbuotojai
GROUP BY PROJEKTONUMERIS
HAVING zmoniu_skaicius >= 3;
