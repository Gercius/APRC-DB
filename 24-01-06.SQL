-- 1.
SELECT first_name, SUBSTRING(first_name, 1, 3) AS pirmos_3_raides FROM customer;

-- 2.

SELECT payment_date, DATE_FORMAT(payment_date, '%c-%d %H:%i:%s') AS menuo_laikas_diena FROM payment;

-- 3.

SELECT description, TRIM(LEADING 'A' FROM description) AS without_a FROM film;

-- 4.

SELECT email, TRIM(TRAILING '.org' FROM email) AS without_org FROM customer;

-- 5.

SELECT email, REPLACE(email, '@', '') AS 'without_@' FROM customer;

-- 6.

SELECT amount, REPLACE(amount, '.', ',') AS 'amount_with_,' FROM payment;

-- 7.

SELECT name, LENGTH(name) AS simboliu_sk FROM category
WHERE LENGTH(name) = 6;

-- 8.

SELECT title, lENGTH(title) AS simboliu_sk FROM film
WHERE title = 'ALONE TRIP';

-- 9.

SELECT DISTINCT amount, LOCATE('.', amount) AS pozicija FROM payment
ORDER BY amount DESC;

-- 10.

SELECT SUBSTRING(email, LOCATE("sakilacustomer.org", email)) AS domain,
	count(email) AS domain_count
FROM customer
GROUP BY domain;

-- 11.

SELECT first_name, last_name, ROUND(avg(amount), 2) AS vid_imoka
FROM customer
LEFT JOIN payment ON customer.customer_id = payment.customer_id
WHERE first_name = 'LINDA' OR first_name = 'SUSAN'
GROUP BY first_name, last_name;

-- 12.

SELECT title, rental_rate, ROUND(rental_rate * 1.05, 2) AS nauja_kaina FROM film;

-- 13.

SELECT sum(rental_rate) AS dabartine_kainodara,
	sum(3) AS nauja_kainodara,
   (SUM(3) - SUM(rental_rate)) AS pelnas_nuostolis,
   ROUND(((SUM(3) - SUM(rental_rate)) / SUM(rental_rate) * 100), 2) AS 'pelnas_nuostolis %'
FROM film;

-- 14.

SELECT title, TRUNCATE((rental_rate + replacement_cost), 0) AS bauda
FROM film
WHERE rental_rate + replacement_cost = (
    SELECT MAX(rental_rate + replacement_cost)
    FROM film
);

-- 15.

SELECT first_name, last_name,
	DATE_FORMAT(rental_date, '%Y %M %D' ) AS isnuomavimo_data,
	return_date 
FROM customer
LEFT JOIN rental ON customer.customer_id = rental.customer_id
WHERE return_date IS NULL;

-- 17.

-- ???

-- 18.

-- ???

-- 20.

SELECT CONCAT(first_name, " ",  last_name) AS vardas_pavarde FROM customer;

-- 21.

SELECT UPPER(description) FROM film;

-- 22.

SELECT  LOWER(CONCAT(first_name, " ",  last_name)) AS vardas_pavarde FROM customer;
