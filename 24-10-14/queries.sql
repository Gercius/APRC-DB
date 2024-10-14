CREATE TABLE knygos (
	kod varchar(3) PRIMARY KEY,
	udk varchar(10) NOT NULL,
	autor varchar(50) NOT NULL,
	pavad varchar(50) NOT NULL,
	psl varchar(4) NOT NULL,
	leidm varchar(4) NOT NULL,
	kaina money NOT NULL
);


CREATE TABLE skaitytojai (
	bilnr varchar(3) PRIMARY KEY,
	pavard varchar(50) NOT NULL,
	vardas varchar(20) NOT NULL,
	gr varchar(4) NOT NULL,
	adresas varchar(50) NOT NULL,
	telefon varchar(9) NOT NULL 
);

CREATE TABLE paimtos_knygos (
	data date NOT NULL,
	bilnr varchar(3) NOT NULL,
	kod varchar(3) NOT NULL,
    FOREIGN KEY (bilnr) REFERENCES skaitytojai(bilnr),
    FOREIGN KEY (kod) REFERENCES knygos(kod)
);

INSERT INTO knygos (kod, udk, autor, pavad, psl, leidm, kaina)
VALUES
('166', '004(075)', 'Burgis B., Kulikauskas A.', 'Kompiuterija', '585', '2000', 20.00),
('167', '802.0', 'Skopinskaja L.', 'Šnekamosios anglų kalbos vadovėlis', '95', '1997', 21.00),
('168', '802.0', 'Aprijaškytė R.', 'Intensyvus anglų kalbos kursas', '166', '1994', 32.00),
('169', '004.9', 'Rimkus Č.', 'We learn English', '127', '1999', 25.00),
('173', '681.3.06', 'Stankienė V., Šukauskaitė A.', 'CorelDraw 9. Atmintinė', '32', '2001', 5.99),
('181', '004.9', 'Starkus B., Kitkauskaitė A.', 'Microsoft Excel 2000. Atmintinė', '12', '2001', 6.00),
('215', '004.9', 'Aprijaškytė R., Pažusis L.', 'Anglų kalbos tarties pratybos', '206', '1994', 22.00),
('251', '004.9', 'Leonavičienė B.', 'Įvadas į Microsoft Windows 98', '111', '1999', 14.99),
('291', '004.9', 'Kovertaitė V.', 'Internet', '150', '1995', 29.00),
('292', '802.0', 'Brough S., Wittmann C.', 'Anglų kalba per 30 dienų', '288', '1998', 25.15),
('348', '004.9', 'Janickienė D., Vaferytė R., Žižys D.', 'Informatika', '239', '2000', 17.00),
('42', '681.3.06', 'Stanaitis Č.', 'Access 2.0 ir 7.0', '254', '1997', 12.00),
('43', '802.0', 'Harder J.', 'Anglų kalbos gramatikos pagrindai', '232', '1998', 26.00),
('44', '802.0', 'Docherty V.', 'Anglų kalbos gramatika', '173', '1999', 25.00),
('45', '802.0', 'Harder J.', 'Anglų kalbos veiksmažodžiai', '240', '1999', 28.00),
('46', '004.9', 'Leonavičienė B.', 'Microsoft Office XP', '356', '2002', 27.09),
('47', '004.9', 'Leonavičienė B.', 'Microsoft Office 2000', '310', '1999', 23.00),
('681', '681.3.06', 'Valavičius E., Tamošaitytė I.', 'Interneto labirintai', '251', '1998', 20.00),
('88', '004.9', 'Starkus B.', 'Visual Basic 4 Jūsų kompiuteryje', '283', '1997', 29.99);

INSERT INTO skaitytojai (bilnr, pavard, vardas, gr, adresas, telefon)
VALUES
('1', 'Jonaitytė', 'Agnė', 'Ad1', 'Aušros takas 13', '454546'),
('2', 'Stasaitytė', 'Aušra', 'B2a', 'Ryto takas 3', '545556'),
('3', 'Bagdonas', 'Tomas', 'T2', 'Lieporių 15', '528542'),
('4', 'Šaučiūnas', 'Jonas', 'EV1', 'Radviliškio 25', '454874'),
('5', 'Žymantas', 'Ramūnas', 'S1', 'Raseinių 25', '423698'),
('6', 'Bendikas', 'Saulius', 'B2', 'Naujo ryto takas 4', '588523'),
('7', 'Bružaitė', 'Angelina', 'T3', 'Dainų 28', '594735');

INSERT INTO paimtos_knygos (data, bilnr, kod)
VALUES
('2018-12-12', '1', '291'),
--('2020-09-25', '1', '49'), kod 49 meta error 
('2019-11-15', '2', '169'),
('2019-12-01', '2', '44'),
('2019-10-15', '3', '681'),
('2019-10-14', '5', '167'),
('2019-11-20', '5', '168');
