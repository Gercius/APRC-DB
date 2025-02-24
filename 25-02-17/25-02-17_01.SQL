DROP table klientu_saskaitos;
DROP table bankai;
DROP table klientai;

CREATE TABLE klientai (
    id INT AUTO_INCREMENT PRIMARY KEY,
    asmens_kodas VARCHAR(15) NOT NULL,
    vardas VARCHAR(255) NOT NULL,
    pavarde VARCHAR(255) NOT NULL,
    telefonas VARCHAR(20) NOT NULL,
    el_pastas VARCHAR(255) NOT NULL,
    adresas VARCHAR(255) NOT NULL
);

CREATE TABLE bankai (
 	id INT AUTO_INCREMENT PRIMARY KEY,
    pavadinimas VARCHAR(100) NOT NULL,
    adresas VARCHAR(255) NOT NULL
);

CREATE TABLE klientu_saskaitos (
    id SERIAL PRIMARY KEY,
    IBAN varchar(30) NOT NULL,
    balansas INT NOT NULL,
    kliento_id INT,
    banko_id INT,
    FOREIGN KEY (kliento_id) REFERENCES klientai(id),
    FOREIGN KEY (banko_id) REFERENCES bankai(id)
);

INSERT INTO klientai (asmens_kodas, vardas, pavarde, telefonas, el_pastas, adresas)
VALUES
(99999999999, 'Tomas', 'Tomauskas', '+37061212012', 'tomas@gmail.com', 'Kaunas, Taikos pr. 141A'),
(98765432100, 'Petras', 'Petraitis', '+37061211111', 'petras@gmail.com', 'Vilnius, M. K. Čiurlionio pr. 100'),
(12345678901, 'Jonas', 'Jonaitis', '+37061222222', 'jonas@gmail.com', 'Klaipėda, Turgaus 12'),
(55555555555, 'Asta', 'Astaite', '+37061233333', 'asta@gmail.com', 'Šiauliai, A. Vivulskio 34'),
(77777777777, 'Eglė', 'Eglaitė', '+37061244444', 'eglė@gmail.com', 'Panevėžys, T. Ševčenkos 56'),
(99991239999, 'Bronius', 'Broniauskas', '+37061211232', 'bronius@gmail.com', 'Kaunas, Taikos pr. 111A');

INSERT INTO bankai (pavadinimas, adresas)
VALUES
('SEB', 'Konstitucijos pr. 24, LT–08105 Vilnius'),
('Luminor', 'Konstitucijos pr. 21A, 03601 Vilnius'),
('Lietuvos Bankas', 'Gedimino pr. 6, LT-01103 Vilnius'),
('Swedbank', 'Konstitucijos pr. 20A, 09321 Vilnius'),
('Revolut Bank', 'Konstitucijos pr. 21B, LT-08130 Vilnius');

INSERT INTO klientu_saskaitos (IBAN, balansas, kliento_id, banko_id)
VALUES
('LT601010012345678902', 1000, 1, 1),
('LT601010012345678903', 2500, 2, 2),
('LT601010012345678904', 500, 3, 3),
('LT601010012345678905', 750, 4, 4),
('LT601010012345678906', 1200, 5, 5);

-- 1.

 DELETE FROM klientu_saskaitos;

-- 2.

UPDATE klientu_saskaitos
SET kliento_id = NULL;

-- 3.

UPDATE klientu_saskaitos
SET kliento_id = NULL, banko_id = NULL;

-- 4.

SELECT DISTINCT(pavadinimas) from bankai;

-- 5.

SELECT asmens_kodas, vardas, pavarde, telefonas, el_pastas, adresas, balansas
FROM klientai
LEFT JOIN klientu_saskaitos ON klientai.id = klientu_saskaitos.kliento_id
WHERE balansas > 1000;

-- 6.

SELECT * FROM klientai
WHERE vardas LIKE 'B%';

-- 7.

INSERT INTO bankai (pavadinimas, adresas)
VALUES
('Citadele', ' K. Donelaičio g. 62, V. Putvinskio g. 53, 44248 Kaunas');

-- 8.

DELETE FROM klientai WHERE id = 99991239999;

-- 9.

SELECT COUNT(*) AS klientu_skaicius FROM klientai;



























