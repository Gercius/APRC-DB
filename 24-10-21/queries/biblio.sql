CREATE TABLE knyga (
	isbn TEXT PRIMARY KEY UNIQUE NOT NULL,
	pavadinimas VARCHAR(255) NOT NULL,
	leidykla VARCHAR(30) NOT NULL,
	metai SMALLINT NOT NULL,
	puslapiai SMALLINT NOT NULL,
	verte MONEY NOT NULL
);

CREATE TABLE autorius (
	isbn TEXT NOT NULL,
	FOREIGN KEY (isbn) REFERENCES knyga(isbn),
	vardas VARCHAR(30) NOT NULL,
	pavarde VARCHAR(30) NOT NULL
);

CREATE TABLE skaitytojas (
	nr BIGINT PRIMARY KEY UNIQUE NOT NULL,
	ak TEXT UNIQUE NOT NULL,
	vardas VARCHAR(30) NOT NULL,
	pavarde VARCHAR(30) NOT NULL,
	gimimas DATE NOT NULL,
	adresas VARCHAR(100) NOT NULL
);

CREATE TABLE egzempliorius (
	nr BIGINT PRIMARY KEY UNIQUE NOT NULL,
	paimta DATE NOT NULL,
	grazinti DATE NOT NULL,
	isbn TEXT NOT NULL,
	FOREIGN KEY (isbn) REFERENCES knyga(isbn),
	skaitytojas BIGINT NOT NULL,
	FOREIGN KEY (skaitytojas) REFERENCES skaitytojas(nr)
);

INSERT INTO knyga (isbn, pavadinimas, leidykla, metai, puslapiai, verte) 
VALUES
('9998-01-101-9', 'Duomenu bazes', 'Baltoji', 2005, 212, 22.50),
('9998-01-102-7', 'Programavimo kalbos', 'Juodoji', 2006, 356, 19.90),
('9999-02-202-2', 'Operacines sistemos', 'Juodoji', 2006, 495, 19.99),
('9998-01-103-5', 'Objektinis programavimas', 'Baltoji', 2006, 254, 19.50),
('9997-03-303-5', 'Informacines sistemos', 'Raudonoji', 2006, 354, 25.50),
('9998-01-104-3', 'Kompiuteriu tinklai', 'Baltoji', 2007, 455, 35.00);

INSERT INTO autorius (isbn, vardas, pavarde) 
VALUES
('9998-01-101-9', 'Petras', 'Petraitis'),
('9998-01-101-9', 'Pijus', 'Jonaitis'),
('9998-01-102-7', 'Pijus', 'Jonaitis'),
('9999-02-202-2', 'Onute', 'Juodaickis'),
('9999-02-202-2', 'Juozas', 'Antanaitis'),
('9997-03-303-5', 'Maryte', 'Simaitis'),
('9997-03-303-5', 'Simas', 'Baltakis'),
('9998-01-104-3', 'Jonas', 'Petraitis');

INSERT INTO skaitytojas (nr, ak, vardas, pavarde, gimimas, adresas)
VALUES
(1000, '38001010222', 'Jonas', 'Petraitis', '1994-01-01', 'Tiesioji 1-10'),
(1001, '38002200102', 'Jonas', 'Onaitis', '1994-02-28', 'Lenktoji 20'),
(1010, '48103021111', 'Milda', 'Onaityte', '1995-03-02', 'Didzioji 21-5'),
(1015, '48206301011', 'Onute', 'Petraityte', '1994-06-30', 'Mazoji 1'),
(1021, '38105301031', 'Petras', 'Jonaitis', '1995-05-30', 'Tiesioji 12'),
(1032, '38112310031', 'Tadas', 'Onaitis', '1995-12-31', 'Tiesioji 10-1'),
(1033, '48111300131', 'Grazina', 'Petraityte', '1995-11-30', 'Didzioji 5'),
(1011, '38411010055', 'Jonas', 'Adomaitis', '1984-01-01', 'Mazoji 1');

INSERT INTO egzempliorius (nr, isbn, skaitytojas, paimta, grazinti)
VALUES
(32101, '9998-01-101-9', 1000, '2016-09-02', '2016-10-05'),
(32102, '9998-01-101-9', 1010, '2016-09-14', '2016-10-04'),
(32103, '9998-01-101-9', 1021, '2016-09-14', '2016-10-04'),
(32104, '9998-01-101-9', 1000, '2016-09-02', '2016-10-05'),
(32105, '9998-01-101-9', 1015, '2016-09-12', '2016-10-14'),
(32106, '9998-01-101-9', 1032, '2016-09-02', '2016-10-15'),
(32200, '9998-01-102-7', 1021, '2016-09-02', '2016-09-14'),
(32300, '9999-02-202-2', 1015, '2016-09-06', '2016-09-25'),
(32302, '9999-02-202-2', 1033, '2016-09-09', '2016-09-15');

--

SELECT COUNT(*) FROM knyga; 

SELECT COUNT(isbn) FROM knyga; 

SELECT COUNT(DISTINCT isbn) FROM egzempliorius;

SELECT COUNT(leidykla) FROM knyga;

SELECT COUNT(DISTINCT isbn) FROM autorius;

--

SELECT COUNT(DISTINCT leidykla) FROM knyga;

--

SELECT COUNT(paimta) FROM egzempliorius;

SELECT COUNT(grazinti) FROM egzempliorius;

SELECT COUNT(skaitytojas) FROM egzempliorius;

--

SELECT COUNT(paimta),
	COUNT(*) - COUNT(paimta)
FROM egzempliorius;

--

SELECT * FROM knyga
WHERE metai = EXTRACT(YEAR FROM CURRENT_DATE) - 1;

--

SELECT * FROM skaitytojas
WHERE EXTRACT(MONTH FROM gimimas) =
	EXTRACT(MONTH FROM CURRENT_DATE);

--

SELECT DISTINCT SUBSTR(pavadinimas, 1, 1)
FROM knyga;

SELECT DISTINCT SUBSTR(pavadinimas, 1, 1)
FROM knyga
ORDER BY 1;

SELECT DISTINCT SUBSTR(pavadinimas, 1, 1)
FROM knyga
ORDER BY 1 DESC;

--

SELECT DISTINCT vardas, pavarde
FROM autorius;

--SELECT COUNT(DISTINCT vardas, pavarde) 
--FROM autorius; - NETEISINGA

SELECT COUNT(DISTINCT vardas || pavarde)
FROM autorius;

SELECT COUNT(DISTINCT vardas || ',' || pavarde)
FROM autorius;
