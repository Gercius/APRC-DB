-- Aplinka - PostgreSQL

CREATE TABLE studentai (
	studento_id SERIAL PRIMARY KEY,
	vardas VARCHAR(50) NOT NULL,
	pavarde VARCHAR(50) NOT NULL,
	adresas VARCHAR(50) NOT NULL,
	el_pastas VARCHAR(100) NOT NULL
);

CREATE TABLE destytojai (
	destytojo_id SERIAL PRIMARY KEY,
	vardas VARCHAR(50) NOT NULL,
	pavarde VARCHAR(50) NOT NULL,
	adresas VARCHAR(50) NOT NULL,
	el_pastas VARCHAR(100) NOT NULL,
	telefonas VARCHAR(20) NOT NULL
);

CREATE TABLE uzduotys (
	uzduoties_id SERIAL PRIMARY KEY,
	pavadinimas VARCHAR(255) NOT NULL,
	aprasymas TEXT NOT NULL
);

CREATE TABLE rezultatai (
	rezultato_id SERIAL PRIMARY KEY,
	uzduoties_id INT NOT NULL,
	FOREIGN KEY (uzduoties_id) REFERENCES uzduotys(uzduoties_id),
	studento_id INT NOT NULL,
	FOREIGN KEY (studento_id) REFERENCES studentai(studento_id),
	ivertinimas INT NOT NULL,
	data DATE NOT NULL,
	destytojo_id INT NOT NULL,
	FOREIGN KEY (destytojo_id) REFERENCES destytojai(destytojo_id)
);

INSERT INTO studentai (vardas, pavarde, adresas, el_pastas) VALUES
('Jonas', 'Jonaitis', 'Vilnius', 'jonas.jonaitis@gmail.com'),
('Petras', 'Petraitis', 'Kaunas', 'petras.petraitis@gmail.com'),
('Ona', 'Onute', 'Klaipėda', 'ona.onute@gmail.com'),
('Antanas', 'Antanaitis', 'Vilnius', 'antanas.antanaitis@gmail.com'),
('Dalia', 'Dalikaite', 'Kaunas', 'dalia.dalikaite@gmail.com'),
('Tomas', 'Tomaitis', 'Vilnius', 'tomas.tomaitis@gmail.com'),
('Egle', 'Eglinskaite', 'Kaunas', 'egle.eglinskaite@gmail.com'),
('Monika', 'Monikiene', 'Kaunas', 'monika.monikiene@gmail.com'),
('Saulius', 'Saulaitis', 'Vilnius', 'saulius.saulaitis@gmail.com'),
('Rasa', 'Rasiene', 'Kaunas', 'rasa.rasiene@gmail.com'),
('Giedre', 'Giedraite', 'Vilnius', 'giedre.giedraite@gmail.com'),
('Mindaugas', 'Mindaugaitis', 'Kaunas', 'mindaugas.mindaugaitis@gmail.com'),
('Lina', 'Liniene', 'Kaunas', 'lina.liniene@gmail.com'),
('Arvydas', 'Arvydaitis', 'Vilnius', 'arvydas.arvydaitis@gmail.com'),
('Ieva', 'Ievinaite', 'Kaunas', 'ieva.ievinaite@gmail.com');

INSERT INTO destytojai (vardas, pavarde, adresas, el_pastas, telefonas) VALUES
('Kazys', 'Kazlauskas', 'Vilnius', 'kazys.kazlauskas@gmail.com', '860000001'),
('Algis', 'Algaitis', 'Kaunas', 'algis.algaitis@gmail.com', '860000002'),
('Ruta', 'Rutiene', 'Klaipėda', 'ruta.rutiene@gmail.com', '860000003'),
('Jurgita', 'Jurgaitiene', 'Vilnius', 'jurgita.jurgaitiene@gmail.com', '860000004'),
('Vytautas', 'Vytautaitis', 'Kaunas', 'vytautas.vytautaitis@gmail.com', '860000005'),
('Laura', 'Lauraitiene', 'Vilnius', 'laura.lauraitiene@gmail.com', '860000006'),
('Marius', 'Maraitis', 'Kaunas', 'marius.maraitis@gmail.com', '860000007'),
('Edita', 'Editaitiene', 'Kaunas', 'edita.editaitiene@gmail.com', '860000008'),
('Dovydas', 'Dovydauskas', 'Vilnius', 'dovydas.dovydauskas@gmail.com', '860000009'),
('Aiste', 'Aistiene', 'Kaunas', 'aiste.aistiene@gmail.com', '860000010'),
('Ramunas', 'Ramunaitis', 'Vilnius', 'ramunas.ramunaitis@gmail.com', '860000011'),
('Simona', 'Simoniene', 'Kaunas', 'simona.simoniene@gmail.com', '860000012'),
('Andrius', 'Andraitis', 'Kaunas', 'andrius.andraitis@gmail.com', '860000013'),
('Gabija', 'Gabijaite', 'Vilnius', 'gabija.gabijaite@gmail.com', '860000014'),
('Paulius', 'Paulaitis', 'Kaunas', 'paulius.paulaitis@gmail.com', '860000015');

INSERT INTO uzduotys (pavadinimas, aprasymas) VALUES
('Matematika Testas', 'Matematikos pagrindų testas.'),
('Istorijos Projektas', 'Viduramžių istorijos projektas.'),
('Fizikos Praktika', 'Laboratorinis darbas apie optiką.'),
('Programavimo Uzduotis', 'Sukurti duomenų bazės valdymo sistemą.'),
('Literatūros Analizė', 'Knygos analizės užduotis.');

INSERT INTO rezultatai (uzduoties_id, studento_id, ivertinimas, data, destytojo_id) VALUES
(1, 1, 8, '2024-06-01', 1),
(2, 2, 9, '2024-06-02', 2),
(3, 3, 7, '2024-06-03', 3),
(4, 4, 10, '2024-06-04', 4),
(5, 5, 6, '2024-06-05', 5),
(1, 6, 8, '2024-06-06', 6),
(2, 7, 9, '2024-06-07', 7),
(3, 8, 10, '2024-06-08', 8),
(4, 9, 7, '2024-06-09', 9),
(5, 10, 6, '2024-06-10', 10),
(1, 11, 9, '2024-06-11', 11),
(2, 12, 8, '2024-06-12', 12),
(3, 13, 7, '2024-06-13', 13),
(4, 14, 10, '2024-06-14', 14),
(5, 15, 6, '2024-06-15', 15),
(1, 2, 8, '2024-06-16', 3),
(2, 4, 7, '2024-06-17', 2),
(3, 6, 9, '2024-06-18', 4),
(4, 8, 10, '2024-06-19', 5),
(5, 10, 8, '2024-06-20', 1),
(1, 12, 9, '2024-06-21', 8),
(2, 14, 8, '2024-06-22', 9),
(3, 15, 10, '2024-06-23', 10),
(4, 1, 7, '2024-06-24', 11),
(5, 3, 6, '2024-06-25', 12),
(1, 5, 8, '2024-06-26', 13),
(2, 7, 7, '2024-06-27', 14),
(3, 9, 9, '2024-06-28', 15),
(4, 11, 10, '2024-06-29', 1),
(5, 13, 7, '2024-06-30', 2);

-- 6.

SELECT studento_id, ivertinimas FROM rezultatai
WHERE studento_id IN (2, 5, 9);

-- 7.

SELECT AVG(ivertinimas) studentu_vidurkis FROM rezultatai;

-- 8.

SELECT studentai.vardas, studentai.pavarde,
	uzduotys.pavadinimas uzduotis,
	rezultatai.ivertinimas
FROM rezultatai
JOIN studentai ON rezultatai.studento_id = studentai.studento_id
JOIN uzduotys ON rezultatai.uzduoties_id = uzduotys.uzduoties_id;

-- 9.

SELECT studentai.studento_id, studentai.vardas, studentai.pavarde,
	TRUNC(AVG(rezultatai.ivertinimas), 1)
FROM studentai
LEFT JOIN rezultatai ON rezultatai.studento_id = studentai.studento_id
GROUP BY studentai.studento_id
HAVING TRUNC(AVG(rezultatai.ivertinimas), 1) BETWEEN 8 AND 10;
