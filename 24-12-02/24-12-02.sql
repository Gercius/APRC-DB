-- KLASES DARBAS 1

SELECT * FROM film
WHERE length > 100;

SELECT rating, rental_rate, count(film_id) as "no_films", sum(replacement_cost) as Cost
from film
WHERE rating = "R"
GROUP BY rating, rental_rate
HAVING no_films > 60
ORDER BY rating desc;

SELECT title, `length` FROM film
WHERE (`length` < 40 OR `length` > 140);

SELECT first_name, last_name FROM customer
LIMIT 5;

SELECT title, rental_rate from film
WHERE rental_rate BETWEEN 1 AND 3;

SELECT title, rental_rate from film
WHERE rental_rate IN (2.99, 4.99);

SELECT last_name FROM actor
WHERE (last_name LIKE '%s' OR last_name LIKE '%g');

SELECT title, rental_duration from film
WHERE rental_duration NOT BETWEEN 2 AND 4; 

-- KLASES DARBAS 2

-- 1. Parašykite SQL užklausą, kuri ištrauktų visus stulpelius 
-- iš lentelės „actor“ , kur stulpelio „first_name“ reikšmė yra Nick.

SELECT * FROM actor
WHERE first_name = 'NICK';

-- 2. Parašykite SQL užklausą, kuri pateiktų visą informaciją 
-- apie filmus, kurių nuomos trukmė yra 6. Naudokite lentelę „film“.

SELECT * FROM film
WHERE rental_duration = 6;

-- 3. Parašykite SQL užklausą, kuri pateiktų filmo 
-- pavadinimą, aprašymą, išleidimo metus, reitingą, kai reitingas
-- yra PG. Naudokite lentelę „film“.

SELECT title, description, release_year, rating FROM film
WHERE rating = 'PG';

-- 4. Parašykite SQL užklausą, kuri ištrauktų filmo 
-- pavadinimą, nuomos trukmę, nuomos kainą, kai nuomos
-- kaina yra 4.99 arba mažiau, o nuomos trukmė 5 ir 6. Naudokite lentelę „film“.

SELECT title, rental_duration, rental_rate FROM film
WHERE rating < 4.99 AND 
	rental_duration = 5 OR rental_duration = 6;

-- 5. Parašykite SQL užklausą, kuri ištraukia filmo
-- pavadinimą, filmo trukmę, nuomos kainą, žanro tipą,
-- išskyrus tuos filmus, kur žanras nėra “Trailers”, 
-- pirmiausiai surušiuojant nuo trumpiausių iki ilgiausiai trunkančių
-- filmų, o paskui pagal nuomos kainą. Naudokite lentelę „film“.

SELECT title, `length`, rental_rate, special_features FROM film
WHERE special_features NOT LIKE '%Trailers%'
ORDER BY `length` ASC, rental_rate;

-- 6. Parašykite SQL užklausą, kuri ištrauktų visus filmus, 
-- kurių žanro aprašyme nėra žodžio “Trailers”.
-- Naudokite lentelę „film“.

SELECT title, special_features FROM film
WHERE special_features NOT LIKE '%Trailers%';

-- 7. Parašykite SQL užklausą, kuri ištrauktų visus filmus, 
-- kurių žanro aprašymas prasideda žodžiu
-- “Trailers”. Naudokite lentelę „film“.

SELECT title, special_features FROM film
WHERE special_features LIKE 'Trailers%';

-- 8. Parašykite užklausą, kuri ištraukia visus filmų pavadinimus, 
-- kurie prasideda raide „z“. Naudokite lentelę „film“.

SELECT title FROM film
WHERE title LIKE 'z%';

-- 9. Parašykite užklausą, kuri ištraukia visus filmų pavadinimus, 
-- kurių antroji raidė yra “w”. Naudokite lentelę „film“.

SELECT title FROM film
WHERE title LIKE '_w%';

-- 10. Parašykite SQL užklausą, kuri ištraukia visus filmų pavadinimus
-- ,kurių antroji raidė yra “w”,
-- o ketvirtoji raidė yra “e”. Naudokite lentelę „film“.

SELECT title FROM film
WHERE title LIKE '_w_e%';

-- 11. Parašykite SQL užklausą, kuri ištraukia 
-- filmo pavadinimą, nuomos kainą, (pavėluoto) grąžinimo kainą, 
-- o bendra nuomos kaina ir (pavėluoto) grąžinimo kaina 
-- pateikiama naujame stulpelyje “total”. Naudokite lentelę „film“.

SELECT title, rental_rate, replacement_cost,
	(rental_rate + replacement_cost) as total FROM film;

-- 12.

SELECT title, rental_rate, rental_duration,
	(rental_rate / rental_duration) as kaina_per_diena FROM film;

-- 13.

SELECT title, description, `length` from film
WHERE `length` BETWEEN 46 AND 50
ORDER BY `length` ASC;

-- 14.

SELECT title, rental_rate, `length` from film
WHERE rental_rate = 2.99 OR `length` = 130;

-- 15.

SELECT title, `length`, rental_rate from film
WHERE `length` = 48 OR rental_rate <= 2.99;

-- 16.

SELECT * FROM rental
WHERE return_date IS NULL;

-- 17.

SELECT * FROM rental
WHERE return_date IS NOT NULL;

-- 18.

SELECT * FROM city
WHERE city NOT IN ('Adana', 'Abu Dhabi', 'Aden');

-- 19.

SELECT * FROM rental
WHERE rental_date BETWEEN '2005-05-24 22:54:33' AND '2005-05-24 23:05:21';

-- 20.

SELECT customer_id, MIN(amount), DATE(payment_date) FROM payment
WHERE DATE(payment_date) = '2005-07-08'
GROUP BY customer_id, payment_date;

-- 21.

SELECT DISTINCT customer_id, DATE(payment_date) FROM payment 
WHERE DATE(payment_date) = '2005-07-08';

-- 22.

SELECT DISTINCT customer_id, MAX(amount) FROM payment 
WHERE amount > 6.99
GROUP BY customer_id
ORDER BY MAX(amount) ASC;

-- 23.

SELECT customer_id, DATE(payment_date), MAX(amount)
FROM payment
GROUP BY customer_id, DATE(payment_date)
HAVING MAX(amount) BETWEEN 3.99 AND 4.99;
