-- 1.

START TRANSACTION;

INSERT INTO rental
VALUES (99999, '2024-05-27 12:29:02', 1, 1, NULL, 1, '2024-05-27 12:29:40');

INSERT INTO payment
VALUES (17000, 1, 1, 9999, 2.99, '2024-05-27 12:29:02', '2024-05-27 12:29:40');

SELECT * FROM rental WHERE rental_id = 99999;

SELECT * FROM payment WHERE payment_id = 17000;

ROLLBACK;

-- 2.

START TRANSACTION;

-- Neleidzia trinti esanciu customers, reikejo prideti nauja
INSERT INTO customer
VALUES
	(600, 2, 'Some', 'Dude', 'Some.Dude@sakilacustomer.org',
	605, 1, '2006-02-14 22:04:37', '2006-02-15 04:57:20');

DELETE FROM customer WHERE customer_id = 600;

SELECT * FROM customer WHERE customer_id = 600;

ROLLBACK;

-- 3.
INSERT INTO customer
VALUES
	(600, 2, 'Some', 'Dude', 'Some.Dude@sakilacustomer.org',
	605, 1, '2006-02-14 22:04:37', '2006-02-15 04:57:20');

INSERT INTO rental
VALUES (99999, '2024-05-27 12:29:02', 1, 600, NULL, 1, '2024-05-27 12:29:40');

INSERT INTO payment
VALUES (17000, 600, 1, 9999, 2.99, '2024-05-27 12:29:02', '2024-05-27 12:29:40');

SELECT * FROM customer WHERE customer_id = 600;
SELECT * FROM rental WHERE customer_id = 600;
SELECT * FROM payment WHERE customer_id = 600;


START TRANSACTION;

DELETE FROM payment WHERE customer_id = 600;
DELETE FROM rental WHERE customer_id = 600;
DELETE FROM customer WHERE customer_id = 600;

SELECT * FROM payment WHERE customer_id = 600;
SELECT * FROM rental WHERE customer_id = 600;
SELECT * FROM customer WHERE customer_id = 600;

ROLLBACK;

-- 4.

BEGIN TRANSACTION;
BEGIN TRY
   	DELETE FROM customer WHERE customer_id = 600;
    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Transakcija nepavyko. Visi pakeitimai atšaukti.';
END CATCH;
