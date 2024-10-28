CREATE TABLE vykdytojai (
	nr SERIAL PRIMARY KEY UNIQUE NOT NULL,
	pavarde VARCHAR(30) NOT NULL,
	kvalifikacija VARCHAR(50) NOT NUll,
	kategorija SMALLINT NOT NULL,
	issilavinimas VARCHAR(30)
);

CREATE TABLE projektai (
	nr SERIAL PRIMARY KEY UNIQUE NOT NULL,
	pavadinimas VARCHAR(50) NOT NULL,
	svarba VARCHAR(30) NOT NULL,
	pradzia DATE NOT NULL,
	trukme SMALLINT NOT NULL
)

CREATE TABLE vykdymas (
	vykdytojas INT NOT NULL,
	FOREIGN KEY (vykdytojas) REFERENCES vykdytojai(nr),
	projektas INT NOT NULL,
	FOREIGN KEY (projektas) REFERENCES projektai(nr),
	statusas VARCHAR(50) NOT NULL,
	valandos INT NOT NULL
)

INSERT INTO vykdytojai (pavarde, kvalifikacija, kategorija, issilavinimas)
VALUES
('Jonaitis', 'Informatikas', 2, 'VU'),
('Petraitis', 'Statistikas', 3, 'VU'),
('Gražulytė', 'Inžinierius', 1, NULL),
('Onaitytė', 'Vadybininkas', 5, 'VDU'),
('Antanaitis', 'Informatikas', 3, 'VU');

INSERT INTO projektai (pavadinimas, svarba, pradzia, trukme)
VALUES
('Studentų apskaita', 'Aukšta', '2005.01.01', 12),
('Buhalterinė apskaita', 'Vidutinė', '2005.03.01', 10),
('WWW svetainė', 'Ypatinga', '2005.06.01', 2),
('Mobili aplikacija', 'Ypatinga', '2005.02.01', 5);

INSERT INTO vykdymas (vykdytojas, projektas, statusas, valandos)
VALUES
(1, 1, 'Programuotojas', 30),
(1, 2, 'Dokumentuotojas', 100),
(1, 3, 'Testuotojas', 100),
(1, 4, 'Vadovas', 100),
(2, 1, 'Programuotojas', 300),
(2, 2, 'Analitikas', 250),
(2, 4, 'Vadovas', 100),
(3, 1, 'Programuotojas', 250),
(3, 2, 'Vadovas', 400),
(3, 3, 'Dizaineris', 150);

-- 2.3

SELECT pavarde, kategorija FROM vykdytojai
WHERE kvalifikacija = 'Informatikas';

SELECT vykdytojai.pavarde, vykdytojai.kategorija
FROM vykdytojai
WHERE vykdytojai.kvalifikacija = 'Informatikas';

SELECT a.pavarde, a.kategorija
FROM vykdytojai AS a
WHERE a.kvalifikacija = 'Informatikas';

--

SELECT issilavinimas FROM vykdytojai;

SELECT DISTINCT issilavinimas FROM vykdytojai;

--

SELECT pavadinimas, trukme * 30 FROM projektai;

SELECT pavadinimas,
	trukme * 30 AS trukme_dienomis
FROM projektai;

SELECT pavadinimas,
	'Trukmė dienomis:' AS pastaba,
	trukme * 30 AS trukme_dienomis
FROM  projektai;

SELECT 'Trukmė dienomis:' AS pastaba
FROM projektai;

SELECT DISTINCT 'Trukmė dienomis:' AS pastaba
FROM projektai;

--

SELECT 1 FROM projektai;

SELECT 1, 1 FROM projektai;

--

SELECT * FROM vykdytojai;

SELECT vykdytojai.* FROM vykdytojai;

SELECT A.* FROM vykdytojai AS A;

-- 2.4

SELECT pavarde, issilavinimas, kategorija
FROM vykdytojai
ORDER BY issilavinimas, kategorija DESC;

SELECT pavarde, issilavinimas, kategorija
FROM vykdytojai
ORDER BY issilavinimas ASC , kategorija DESC;

SELECT pavarde, issilavinimas, kategorija
FROM vykdytojai
ORDER BY 2, kategorija DESC;

SELECT pavarde, issilavinimas, kategorija
FROM vykdytojai
ORDER BY 2, 3 DESC;

-- 2.5

SELECT COUNT(*) AS skaicius FROM vykdytojai;

SELECT COUNT(DISTINCT vykdytojas)
FROM vykdymas;

SELECT COUNT(vykdytojas) FROM vykdymas;

--

SELECT COUNT(DISTINCT kategorija) FROM vykdytojai;

SELECT SUM(valandos) as visos_valandos
FROM vykdymas WHERE vykdytojas = 1;

--

SELECT pavadinimas, pradzia FROM projektai
WHERE pavadinimas LIKE '%apskaita%'
	AND svarba IN ('Vidutinė', 'Didelė')
	AND pradzia < CURRENT_DATE;

--

SELECT * FROM vykdytojai
WHERE kvalifikacija = 'Informatikas' OR
	(issilavinimas = 'VU' AND kategorija > 3);

-- 2.6

SELECT pavarde FROM vykdytojai, vykdymas
WHERE vykdytojas = nr AND projektas = 1;

SELECT pavarde, pavadinimas, valandos
FROM vykdytojai, projektai, vykdymas
WHERE projektas = projektai.nr AND
	vykdytojas = vykdytojai.nr;

SELECT a.pavarde, b.pavarde
FROM vykdytojai a, vykdytojai b
WHERE a.kvalifikacija = b.kvalifikacija
	AND a.nr < b.nr;

SELECT DISTINCT a.pavarde, b.pavarde
FROM vykdytojai a, vykdytojai b
WHERE a.kvalifikacija = b.kvalifikacija;

SELECT a.pavarde, b.pavarde
FROM vykdytojai a, vykdytojai b
WHERE a.kvalifikacija = b.kvalifikacija
	AND a.nr <> b.nr;

SELECT pavarde, pavadinimas, valandos
FROM vykdytojai, projektai, vykdymas
WHERE 
	projektas = projektai.nr AND
	vykdytojas = vykdytojai.nr AND
	svarba = 'Aukšta';

SELECT pavarde, pavadinimas, valandos
FROM vykdytojai, projektai, vykdymas
WHERE 
	projektas = projektai.nr AND
	vykdytojas = vykdytojai.nr AND
	kvalifikacija = 'Informatikas';

--

SELECT pavarde FROM vykdytojai; -- teisingiausia

SELECT pavarde FROM vykdytojai, projektai; -- kartojasi

SELECT DISTINCT pavarde
FROM vykdytojai, projektai; -- neefektyvi

--

SELECT pavarde
FROM vykdytojai JOIN vykdymas
	ON vykdytojas = nr
WHERE projektas = 1;

SELECT pavarde FROM vykdytojai, vykdymas
WHERE vykdytojas = nr AND projektas = 1;

--

SELECT pavarde, pavadinimas, valandos
FROM 
	(vykdytojai JOIN vykdymas ON
	vykdytojas = vykdytojai.nr)
	JOIN projektai
	ON projektas = projektai.nr;

SELECT pavarde, pavadinimas, valandos
FROM vykdytojai, projektai, vykdymas
WHERE 
	projektas = projektai.nr AND
	vykdytojas = vykdytojai.nr;

SELECT pavarde, statusas, valandos
FROM vykdytojai JOIN vykdymas
	ON vykdytojas = nr
WHERE projektas = 1;

--

SELECT pavarde, statusas, valandos
FROM vykdytojai LEFT OUTER JOIN vykdymas
	ON vykdytojas = nr
WHERE projektas = 1 OR projektas IS NULL;

SELECT pavarde, statusas, valandos
FROM vykdymas RIGHT OUTER JOIN
	vykdytojai ON vykdytojas = nr
WHERE projektas = 1 or projektas IS NULL;

-- 2.7

SELECT pavarde FROM vykdytojai
WHERE nr IN (
				SELECT vykdytojas
				FROM Vykdymas
				WHERE Projektas = 1
			);
		
--
		
SELECT pavarde FROM vykdytojai
WHERE nr IN
	(
		SELECT vykdytojas FROM vykdymas
		WHERE projektas IN
		(
			SELECT nr FROM projektai
			WHERE svarba = 'Aukšta'
		) 
	);

SELECT DISTINCT pavarde
FROM vykdytojai, vykdymas, projektai
WHERE 
	projektas = projektai.nr AND
	vykdytojas = vykdytojai.nr AND
	svarba = 'Aukšta';

--

SELECT DISTINCT vykdytojas FROM vykdymas
WHERE 
	vykdytojas <> 1 AND
	projektas IN 
		(
			SELECT projektas
			FROM vykdymas
			WHERE vykdytojas = 1
		);
	
--
	
SELECT pavarde FROM vykdytojai
WHERE 1 IN 
	(
		SELECT projektas FROM vykdymas
		WHERE vykdytojas = nr
	);

-- 2.8

SELECT DISTINCT vykdytojas FROM vykdymas,
	(
		SELECT projektas FROM vykdymas
		WHERE vykdytojas = 1
	) AS projektai1
WHERE projektai1.projektas = vykdymas.projektas
	AND vykdymas.vykdytojas <> 1;

WITH projektai1 AS
	(
		SELECT projektas FROM vykdymas
		WHERE vykdytojas = 1
	)
SELECT DISTINCT vykdytojas
FROM vykdymas, projektai1
WHERE vykdymas.vykdytojas <> 1 AND
	projektai1.projektas = vykdymas.projektas;

WITH projektai1 (projektas) AS
	(
		SELECT projektas FROM vykdymas
		WHERE vykdytojas = 1
	)
SELECT DISTINCT vykdytojas
FROM vykdymas, projektai1
WHERE vykdymas.vykdytojas <> 1 AND
	projektai1.projektas = vykdymas.projektas;

--

CREATE TEMP TABLE projektai1 AS
	(
		SELECT projektas FROM vykdymas
		WHERE vykdytojas = 1
	);

SELECT DISTINCT vykdytojas
FROM vykdymas, projektai1
WHERE vykdymas.vykdytojas <> 1 AND
	projektai1.projektas = vykdymas.projektas;

-- 2.9

SELECT pavarde FROM vykdytojai
WHERE EXISTS 
	(
		SELECT * FROM vykdymas
		WHERE vykdytojas = Nr
		AND projektas = 1
	);

SELECT DISTINCT A.kvalifikacija
FROM vykdytojai A
WHERE 2 <= ALL 
	(
		SELECT B.kategorija
		FROM vykdytojai B
		WHERE A.kvalifikacija =
			B.kvalifikacija
	);

SELECT A.kvalifikacija
FROM 
	(
		SELECT DISTINCT kvalifikacija
		FROM vykdytojai
	) AS A
WHERE 2 <= ALL
	(
		SELECT B.kategorija FROM vykdytojai B
		WHERE A.kvalifikacija = B.kvalifikacija
	);

SELECT pavarde FROM vykdytojai
WHERE Nr = ANY 
	(
		SELECT vykdytojas
		FROM vykdymas
		WHERE projektas = 1
	);

SELECT DISTINCT A.kvalifikacija
FROM vykdytojai A
WHERE 
	(
		SELECT COUNT(*)
		FROM vykdytojai B
		WHERE A.kvalifikacija = B.kvalifikacija
		AND B.kategorija < 2
	) = 0;

-- 2.10

SELECT SUM(valandos) FROM vykdymas
WHERE projektas = 1;

SELECT projektas, SUM(valandos) AS valandos
FROM vykdymas
GROUP BY projektas;

SELECT projektas, vykdytojas,
	SUM(valandos) AS valandos
FROM vykdymas GROUP BY projektas; -- Neteisinga

SELECT projektas, SUM(valandos) AS valandos
FROM vykdymas
WHERE valandos > 50
GROUP BY projektas;

SELECT projektas,
	SUM(valandos) AS valandos,
	COUNT(valandos) AS vykdymu_skaicius
FROM vykdymas
WHERE valandos > 250
GROUP BY projektas;

SELECT projektas,
	COUNT(*) AS vykdytojai
FROM vykdymas
GROUP BY projektas;

SELECT projektas, COUNT(*) AS vykdytojai
FROM vykdymas
GROUP BY projektas
HAVING COUNT(*) > 3;

SELECT issilavinimas, kategorija,
	COUNT(*) AS skaicius
FROM vykdytojai
WHERE issilavinimas IS NOT NULL
GROUP BY issilavinimas, kategorija
ORDER BY issilavinimas;

SELECT pavarde, SUM(valandos) AS valandos
FROM vykdytojai, vykdymas
WHERE nr = vykdytojas
GROUP BY pavarde;

SELECT nr, pavarde, SUM(valandos) AS valandos
FROM vykdytojai, vykdymas
WHERE nr = vykdytojas
GROUP BY nr, pavarde;

--

SELECT vykdytojas, SUM(valandos) AS valandos
FROM vykdymas GROUP BY vykdytojas;

WITH visu_valandos (nr, valandos) AS
	(SELECT vykdytojas, SUM(valandos) AS valandos
	FROM vykdymas GROUP BY vykdytojas)
SELECT AVG(valandos) FROM visu_valandos;

WITH visu_valandos (nr, valandos)
	AS (SELECT vykdytojas, SUM(valandos)
		FROM vykdymas GROUP BY vykdytojas)
SELECT nr, valandos
FROM visu_valandos
WHERE valandos > (SELECT AVG(valandos)
				  FROM visu_valandos);

WITH visu_valandos (nr, valandos) AS
	(SELECT vykdytojas, SUM(valandos)
	 FROM vykdymas GROUP BY vykdytojas)
SELECT A.nr, pavarde, valandos
FROM vykdytojai AS A, visu_valandos AS B
WHERE A.nr = B.nr
	AND valandos > (SELECT AVG(valandos)
					FROM visu_valandos);

WITH visu_valandos (nr, valandos) AS
	(SELECT vykdytojas, SUM(valandos)
	 FROM vykdymas GROUP BY vykdytojas)
SELECT A.nr, pavarde, valandos,
	(SELECT AVG(valandos) FROM visu_valandos)
FROM vykdytojai AS A, visu_valandos AS B
WHERE A.nr = B.nr
	AND valandos > (SELECT AVG(valandos)
					FROM visu_valandos);

WITH visu_valandos (nr, valandos) AS
		(SELECT vykdytojas, SUM(valandos)
		 FROM vykdymas GROUP BY vykdytojas),
	visu_vidurkis (vidurkis) AS
		(SELECT AVG(valandos)
		 FROM visu_valandos)
SELECT A.nr, pavarde, valandos, vidurkis
FROM vykdytojai AS A, visu_valandos AS B,
	visu_vidurkis
WHERE A.nr = B.nr
	AND valandos > vidurkis;

WITH visu_valandos (nr, valandos) AS
		(SELECT vykdytojas, SUM(valandos)
		 FROM vykdymas GROUP BY vykdytojas),
	visu_vidurkis (vidurkis) AS
		(SELECT AVG(CAST(valandos AS FLOAT))
		 FROM visu_valandos)
SELECT A.nr, pavarde, valandos,
		CAST(vidurkis AS DECIMAL(10, 2))
FROM vykdytojai AS A, visu_valandos AS B,
	visu_vidurkis
WHERE A.nr = B.nr AND valandos > vidurkis;

-- 2.12

SELECT nr FROM vykdytojai
EXCEPT
SELECT vykdytojas FROM vykdymas
ORDER BY 1;

SELECT nr, pavarde FROM vykdytojai
EXCEPT
SELECT vykdytojas, pavarde
FROM vykdymas, vykdytojai WHERE vykdytojas = nr
ORDER BY 1;

--2.13

SELECT pavadinimas, 'Trumpalaikis'
FROM projektai WHERE trukme <= 6
UNION
SELECT pavadinimas, 'Ilgalaikis'
FROM projektai WHERE trukme > 6;

SELECT pavadinimas,
	CASE WHEN trukme <= 6
		 THEN 'Trumpalaikis'
		 ELSE 'Ilgalaikis' END
FROM projektai
WHERE trukme IS NOT NULL;

SELECT pavadinimas,
	COUNT(DISTINCT vykdytojas)
		AS visi_vykdytojai,
	SUM(valandos) AS visu_valandos
FROM projektai, vykdymas
WHERE nr = projektas
GROUP BY pavadinimas;

SELECT pavadinimas,
	COUNT(DISTINCT vykdytojas) AS informatikai,
	SUM(valandos) AS informatiku_valandos
FROM projektai, vykdymas, vykdytojai
WHERE projektai.nr = projektas
	AND vykdytojai.nr = vykdytojas
	AND kvalifikacija = 'Informatikas'
GROUP BY pavadinimas;

SELECT pavadinimas,
	COUNT(DISTINCT vykdytojas) AS statistikai,
	SUM(valandos) AS statistiku_valandos
FROM projektai, vykdymas, vykdytojai
WHERE projektai.nr = projektas
	AND vykdytojai.nr = vykdytojas
	AND kvalifikacija = 'Statistikas'
GROUP BY pavadinimas;

SELECT pavadinimas,
	COUNT(DISTINCT vykdytojas) AS visi_vykdytojai,
	SUM(valandos) AS visu_valandos,
	COUNT(DISTINCT CASE
		WHEN kvalifikacija ='Informatikas'
		THEN vykdytojas END) AS visi_informatikai,
	SUM( CASE WHEN kvalifikacija = 'Informatikas'
	THEN valandos END)
	AS informatiku_valandos,
	COUNT(DISTINCT CASE
		WHEN kvalifikacija = 'Statistikas'
		THEN vykdytojas END) AS visi_statistikai,
	SUM(CASE WHEN kvalifikacija = 'Statistikas'
		THEN valandos END) AS statistiku_valandos
FROM projektai, vykdymas, vykdytojai
WHERE projektai.nr = projektas AND
	vykdytojai.nr = vykdytojas
GROUP BY pavadinimas;

SELECT pavarde,
	kategorija AS esama_kategorija,
	COALESCE(kategorija, 0) + 1
		AS naujoji_kategorija
FROM vykdytojai;
