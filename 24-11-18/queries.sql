-- 1. Parašykite SQL užklausą, kuri ištrauktų visus stulpelius iš lentelės „actor“
-- Rezultatas (200 eilučių):  

SELECT * FROM actor;

-- 2. Parašykite SQL užklausą, kuri ištrauktų visus stulpelius iš lentelės „actor“ , surūšiuotus pagal stulpelį „first_name“.  
-- Rezultatas (200 eilučių):  

SELECT * FROM actor
ORDER BY first_name;

-- 3. Parašykite SQL užklausą, kuri ištrauktų visus stulpelius iš lentelės „actor“ , surūšiuotus pagal stulpelį „first_name“ mažėjimo tvarka.  
-- Rezultatas (200 eilučių):  

SELECT * FROM actor
ORDER BY first_name DESC;

-- 4. Parašykite užklausą, kuri ištrauktų stulpelį „first_name“ iš lentelės „actor“ .  
-- Rezultatas (200 eilučių):  
  
SELECT first_name FROM actor;

-- 5. Parašykite užklausą, kuri ištrauktų stulpelius „first_name“, „last_name“  iš lentelės „actor“ .  
-- Rezultatas (200 eilučių):  

SELECT first_name, last_name FROM actor;

-- 6. Parašykite užklausą, kuri ištrauktų stulpelius „first_name“, „last_name“  iš lentelės „actor“ surūšiuotus pagal „last_name“ didėjimo tvarka.  
-- Rezultatas (200 eilučių):  

SELECT first_name, last_name FROM actor
ORDER BY last_name ASC;

-- 7. Parašykite užklausą, kuri ištrauktų stulpelius „first_name“, „last_name“  iš lentelės „actor“ surūšiuotus pagal „last_name“ mažėjimo tvarka.  
-- Rezultatas (200 eilučių):  

SELECT first_name, last_name FROM actor
ORDER BY last_name DESC;

-- 8.Parašykite užklausą, kuri ištrauktų stulpelius „first_name“, „last_name“  iš lentelės „actor“ sugrupuotus pagal stulpelį „first_name“ ir surūšiuotus pagal „first_name“ mažėjimo tvarka. 
-- Rezultatas (128 eilutės):  

SELECT first_name, MIN(last_name) AS last_name
FROM actor
GROUP BY first_name
ORDER BY first_name DESC;

-- 9. Parašykite SQL užklausą, kuri ištrauktų visas skirtingas stulpelio „first_name“  reikšmes iš lentelės „actor“. 
-- Rezultatas (128 eilutės):  

SELECT DISTINCT first_name FROM actor;

-- 10. Parašykite SQL užklausą, kuri rezultate stulpelius atvaizduotų tokia tvarka kaip pateikta žemiau. Naudokite lentelę “actor”.  
-- Rezultatas (200 eilučių):  

SELECT last_update, last_name, first_name  FROM actor;

-- 11.	Parašykite SQL užklausą, kuri pateiktų filmo pavadinimą, nuomos kainą ir filmo trukmę, pagal filmo trukmę nuo trumpiausio iki ilgiausio. Naudokite lentelę „film“.  
-- Rezultatas (1000 eilučių):  

SELECT title, rental_rate, `length` FROM film
ORDER BY `length` ASC;

-- 12. Parašykite SQL užklausą, kuri stulpelius title, description pervadina į stulpelius ‘filmo pavadinimas’,  ‘aprašymas’ atitinkamai. ”. Naudokite lentelę „film“.   
-- Rezultatas (1000 eilučių):

SELECT title AS filmo_pavadinimas, description AS aprasymas from film;
