CREATE TABLE klientai (
	kliento_id INT PRIMARY KEY,
    vardas VARCHAR(50) NOT NULL,
    pavarde VARCHAR(50) NOT NULL,
	kontaktiniai_duomenys VARCHAR(255) NOT NULL
);

CREATE TABLE stalai (
	stalo_id INT PRIMARY KEY,
	stalo_nr SMALLINT NOT NULL,
	vietu_skaicius SMALLINT NOT NULL
);

CREATE TABLE uzsakymai (
	uzsakymo_id INT PRIMARY KEY,
	kliento_id INT NOT NULL,
 	FOREIGN KEY (kliento_id) REFERENCES klientai(kliento_id),
	stalo_id INT NOT NULL,
 	FOREIGN KEY (stalo_id) REFERENCES stalai(stalo_id),
 	uzsakymo_data DATE NOT NULL,
 	busena ENUM('Atlikta', 'Laukiama') NOT NULL
);

CREATE TABLE meniu (
	meniu_id INT PRIMARY KEY,
	patiekalo_pavadinimas VARCHAR(255) NOT NULL,
	aprasymas TEXT NOT NULL,
	kaina DECIMAL(4, 2) NOT NULL
);

CREATE TABLE uzsakymo_prekes (
	uzsakymo_prekes_id INT PRIMARY KEY,
	uzsakymo_id INT NOT NULL,
 	FOREIGN KEY (uzsakymo_id) REFERENCES uzsakymai(uzsakymo_id),
	meniu_id INT NOT NULL,
 	FOREIGN KEY (meniu_id) REFERENCES meniu(meniu_id),
 	kiekis SMALLINT NOT NULL
);

INSERT INTO klientai (kliento_id, vardas, pavarde, kontaktiniai_duomenys)
VALUES
(1, 'Jonas', 'Jonaitis', 'jonas.jonaitis@gmail.com, tel. +37060000001'),
(2, 'Petras', 'Petrauskas', 'petras.petrauskas@gmail.com, tel. +37060000002'),
(3, 'Marta', 'Martaite', 'marta.martaite@gmail.com, tel. +37060000003'),
(4, 'Eglė', 'Eglaitė', 'egle.eglaitė@gmail.com, tel. +37060000004'),
(5, 'Tomas', 'Tomaitis', 'tomas.tomaitis@gmail.com, tel. +37060000005');

INSERT INTO stalai (stalo_id, stalo_nr, vietu_skaicius)
VALUES
(1, 1, 4),
(2, 2, 6),
(3, 3, 2),
(4, 4, 4),
(5, 5, 6);

INSERT INTO uzsakymai (uzsakymo_id, kliento_id, stalo_id, uzsakymo_data, busena)
VALUES
(1, 1, 1, '2025-03-17', 'Atlikta'),
(2, 2, 2, '2025-03-15', 'Laukiama'),
(3, 3, 3, '2025-03-17', 'Atlikta'),
(4, 4, 4, '2025-03-16', 'Laukiama'),
(5, 5, 5, '2025-03-17', 'Atlikta');

INSERT INTO meniu (meniu_id, patiekalo_pavadinimas, aprasymas, kaina)
VALUES
(1, 'Cepelinai', 'Gardžiai eina su smetona ir spirgučiais', 8.50),
(2, 'Žemaitiški Blynai', 'Persivalgius galimai pradėsit kalbėti žemaitiškai', 4.30),
(3, 'Šaltibarščiai', 'Barščiai tik šalti', 5.20),
(4, 'Jautienos Kepsnys', 'Skanus kepsnys', 7.50),
(5, 'Vištienos Kepsnys', 'Irgi skanus kepsnys', 6.00);

INSERT INTO uzsakymo_prekes (uzsakymo_prekes_id, uzsakymo_id, meniu_id, kiekis)
VALUES
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 4),
(4, 3, 4, 3),
(5, 4, 5, 1),
(6, 5, 1, 3);

-- 1.

SELECT * FROM klientai WHERE pavarde = 'Jonaitis';

-- 2.

SELECT * FROM uzsakymai
WHERE uzsakymo_data = '2025-03-17' AND (busena = 'Atlikta' OR busena = 'Laukiama');

-- 3.

SELECT * FROM klientai
WHERE kliento_id NOT IN (SELECT kliento_id FROM uzsakymai);

-- 4.

SELECT * FROM klientai ORDER BY pavarde;

-- 5.

SELECT vardas, pavarde, COUNT(uzsakymo_id) AS viso_uzsakymu
FROM klientai
LEFT JOIN uzsakymai ON klientai.kliento_id = uzsakymai.kliento_id
GROUP BY klientai.kliento_id
ORDER BY vardas;

-- 6.

SELECT SUM(m.kaina * up.kiekis) AS total_price
FROM uzsakymo_prekes up
INNER JOIN meniu m ON up.meniu_id = m.meniu_id
WHERE up.uzsakymo_id = (SELECT MAX(uzsakymo_id) FROM uzsakymai);

-- 7.

SELECT MIN(vietu_skaicius) AS min_vietu, MAX(vietu_skaicius) AS max_vietu
FROM stalai;

-- 8.

SELECT AVG(kaina) AS vid_kaina FROM meniu;

-- 9.

SELECT COUNT(*) AS stalai_su_daugiau_nei_4_viet
FROM stalai
WHERE vietu_skaicius > 4;

-- 10.

SELECT k.vardas, k.pavarde, COUNT(u.uzsakymo_id) AS total_orders
FROM klientai k
INNER JOIN uzsakymai u ON k.kliento_id = u.kliento_id
GROUP BY k.kliento_id
ORDER BY total_orders DESC;

-- 11.

SELECT k.vardas, k.pavarde, u.uzsakymo_data, u.busena
FROM uzsakymai u
INNER JOIN klientai k ON u.kliento_id = k.kliento_id;

-- 12.

SELECT u.uzsakymo_id, m.patiekalo_pavadinimas, up.kiekis
FROM uzsakymo_prekes up
INNER JOIN uzsakymai u ON up.uzsakymo_id = u.uzsakymo_id
INNER JOIN meniu m ON up.meniu_id = m.meniu_id;

-- 13.

SELECT s.stalo_nr, COUNT(u.uzsakymo_id) AS orders_count
FROM stalai s
LEFT JOIN uzsakymai u ON s.stalo_id = u.stalo_id
GROUP BY s.stalo_nr;

-- 14.

SELECT DISTINCT k.vardas, k.pavarde
FROM klientai k
INNER JOIN uzsakymai u ON k.kliento_id = u.kliento_id
WHERE u.busena IN ('Atlikta', 'Laukiama');

-- 15.

ALTER TABLE klientai
ADD COLUMN telefonas VARCHAR(15);

-- 16.

CREATE INDEX idx_kliento_id ON uzsakymai (kliento_id);

-- 17.

CREATE INDEX idx_stalo_id ON uzsakymai (stalo_id);
