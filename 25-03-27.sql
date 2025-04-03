CREATE TABLE Klientai (
    klientas_id INT PRIMARY KEY AUTO_INCREMENT,
    vardas VARCHAR(50) NOT NULL,
    pavarde VARCHAR(50) NOT NULL,
    el_pastas VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Uzsakymai (
    uzsakymas_id INT PRIMARY KEY AUTO_INCREMENT,
    klientas_id INT NOT NULL,
    uzsakymo_data DATETIME DEFAULT CURRENT_TIMESTAMP,
    suma DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (klientas_id) REFERENCES Klientai(klientas_id) ON DELETE CASCADE
);

INSERT INTO Klientai (vardas, pavarde, el_pastas) VALUES
('Jonas', 'Jonaitis', 'jonas@gmail.com'),
('Petras', 'Petraitis', 'petras@gmail.com'),
('Ona', 'Onaitė', 'ona@gmail.com'),
('Lina', 'Linaitė', 'lina@gmail.com'),
('Marius', 'Maraitis', 'marius@gmail.com');

INSERT INTO Uzsakymai (klientas_id, uzsakymo_data, suma) VALUES
(1, '2024-01-10', 50.00),
(1, '2024-02-15', 120.00),
(2, '2023-12-01', 80.00),
(2, '2024-03-01', 200.00),
(3, '2024-02-20', 300.00),
(3, '2024-03-05', 50.00),
(4, '2024-03-10', 75.00),
(4, '2024-03-15', 90.00),
(5, '2024-03-20', 60.00),
(5, '2024-03-25', 150.00);

-- 2.2
UPDATE Uzsakymai 
SET suma = suma * 1.05 
WHERE uzsakymo_data >= DATE_SUB(NOW(), INTERVAL 6 MONTH);

-- 3.1
SELECT DISTINCT vardas, pavarde
FROM Klientai
JOIN Uzsakymai ON Klientai.klientas_id = Uzsakymai.klientas_id;

-- 3.2
SELECT * FROM Uzsakymai WHERE suma > 100;

-- 3.3
SELECT vardas, pavarde 
FROM Klientai
LEFT JOIN Uzsakymai ON Klientai.klientas_id = Uzsakymai.klientas_id
WHERE Uzsakymai.uzsakymas_id IS NULL;

-- 4.1
SELECT K.klientas_id, K.vardas, K.pavarde, 
	COUNT(U.uzsakymas_id) AS uzsakymu_skaicius, 
	SUM(U.suma) AS bendra_suma
FROM Klientai K
LEFT JOIN Uzsakymai U ON K.klientas_id = U.klientas_id
GROUP BY K.klientas_id;

-- 4.2
SELECT K.klientas_id, K.vardas, K.pavarde, 
	SUM(U.suma) AS bendra_suma
FROM Klientai K
JOIN Uzsakymai U ON K.klientas_id = U.klientas_id
GROUP BY K.klientas_id
ORDER BY bendra_suma DESC
LIMIT 1;

-- 4.3

-- 4.4
SELECT * FROM Uzsakymai
WHERE suma > (SELECT AVG(suma) FROM Uzsakymai);

-- 4.5
SELECT K.vardas, K.pavarde
FROM Klientai K
WHERE NOT EXISTS (
    SELECT 1 FROM Uzsakymai U
    WHERE U.klientas_id = K.klientas_id AND U.suma < 50
);

-- 5.1
SELECT DATE_FORMAT(uzsakymo_data, '%Y-%m') AS menesis, 
	COUNT(*) AS uzsakymu_skaicius, 
	SUM(suma) AS bendra_suma
FROM Uzsakymai
GROUP BY menesis
ORDER BY menesis;

-- 5.2
SELECT K.klientas_id, K.vardas, K.pavarde, COUNT(U.uzsakymas_id) AS uzsakymu_skaicius
FROM Klientai K
JOIN Uzsakymai U ON K.klientas_id = U.klientas_id
GROUP BY K.klientas_id
HAVING uzsakymu_skaicius > 3;

-- 5.3
SELECT K.klientas_id, K.vardas, K.pavarde,
       MAX(U.suma) AS didziausias_uzsakymas,
       MIN(U.suma) AS maziausias_uzsakymas,
       AVG(U.suma) AS vidutinis_uzsakymas
FROM Klientai K
JOIN Uzsakymai U ON K.klientas_id = U.klientas_id
GROUP BY K.klientas_id;

-- 6.1
DELETE FROM Uzsakymai WHERE suma < 10;

-- 6.2
DELETE FROM Klientai 
WHERE klientas_id NOT IN (SELECT DISTINCT klientas_id FROM Uzsakymai);

-- 7.
CREATE INDEX idx_klientas_id ON Uzsakymai(klientas_id);
