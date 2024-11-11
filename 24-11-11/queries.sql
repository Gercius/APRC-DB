-- Išrinkti visus vardus aktorių lentoje

SELECT first_name, last_name FROM actor;

-- Surūšiuoti  visus vardus aktorių lentoje nuo A iki Z

SELECT first_name, last_name FROM actor
ORDER BY first_name ASC;

-- Išrinkti visus nepasikartojančius vardus aktorių lentoje

SELECT DISTINCT first_name FROM actor;

-- Suskaičiuoti kiek aktorių turime aktorių lentoje

SELECT COUNT(first_name) FROM actor;
SELECT COUNT(*) FROM actor;

-- Suskaičiuoti kiek turime unikalių aktorių vardų ir stulpelį pavadinti Unikalių vardų skaičius

SELECT COUNT(DISTINCT first_name) AS unikaliu_vardu_skaicius FROM actor;

-- Kiek yra kokių vardų aktorių lentoje?

SELECT COUNT(actor_id), first_name
FROM actor
GROUP BY first_name;
