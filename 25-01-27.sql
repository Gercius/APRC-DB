-- 1.

SELECT first_name, SUBSTRING(first_name, 1, 3) AS pirmos_3_raides FROM customer;

-- 2.

SELECT payment_date, DATE_FORMAT(payment_date, '%c-%d %H:%i:%s')
	AS 'Menuo, diena ir laikas' FROM payment;
	
-- 3.

SELECT description, TRIM(LEADING 'A' FROM description) AS without_A FROM film;

-- 4.

SELECT email, TRIM(TRAILING '.org' FROM email) AS 'Without .org' FROM customer;

-- 5.

SELECT email, REPLACE(email, '@', '') AS 'Without @' FROM customer;

-- 6.

SELECT amount, REPLACE(amount, '.', ',') AS 'Amount with ,' FROM payment;

-- 7.

SELECT name, LENGTH(name) AS simboliu_sk FROM category
WHERE LENGTH(name) = 6;

-- 8.

SELECT title, LENGTH(title) AS simboliu_sk FROM film
WHERE title = 'ALONE TRIP';

-- 9.

SELECT DISTINCT amount, LOCATE('.', amount) AS pozicija FROM payment
ORDER BY amount DESC;

-- 10. 

SELECT SUBSTRING(email, LOCATE('@', email) + 1) AS domain,
	COUNT(*) AS domain_count FROM customer
GROUP BY domain;

-- 11.

SELECT first_name, last_name, ROUND(AVG(amount), 2) AS vid_imoka
FROM customer
LEFT JOIN payment ON customer.customer_id = payment.customer_id
WHERE first_name = 'LINDA' OR first_name = 'SUSAN'
GROUP BY first_name, last_name;

-- 12.

SELECT title, rental_rate, ROUND(rental_rate * 1.05, 2) AS nauja_kaina FROM film;

-- 13.

SELECT SUM(rental_rate) AS dabartine_kainodara, SUM(3) AS nauja_kainodara,
	 (SUM(3) - SUM(rental_rate)) AS pelnas_nuostolis,
	 TRUNCATE(((SUM(3) - SUM(rental_rate)) / (SUM(3)) * 100), 2) AS 'Pelnas_nuostolis %'
FROM film;

-- 14.

SELECT title, TRUNCATE((replacement_cost + rental_rate), 0) AS bauda
FROM film
WHERE replacement_cost = (SELECT MAX(replacement_cost) FROM film)
	AND rental_rate = (SELECT MAX(rental_rate) FROM film);

-- 15. 

SELECT first_name, last_name, DATE_FORMAT(rental_date, '%Y %M %D') , return_date
FROM customer
LEFT JOIN rental ON customer.customer_id = rental.customer_id
WHERE return_date IS NULL;

-- 20. 

SELECT CONCAT(first_name," ", last_name) AS vardas_pavarde FROM customer;

-- 21.

SELECT UPPER(description) AS aprasymas FROM film;

-- 22.

SELECT LOWER(CONCAT(first_name," ", last_name)) AS vardas_pavarde FROM customer;

-- 23.

SELECT LOWER(first_name) AS vardas, UPPER(city) AS miestas 
FROM customer
LEFT JOIN address ON customer.address_id = address.address_id
LEFT JOIN city ON address.city_id = city.city_id;
