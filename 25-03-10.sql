-- Funkcijos
-- 1.

CREATE FUNCTION get_movie_rating(movie_id SMALLINT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
	DECLARE movie_rating VARCHAR(10);

	SELECT rating INTO movie_rating
	FROM film
	WHERE film_id = movie_id;

	RETURN movie_rating;
	
END;

SELECT get_movie_rating(1);

-- 2.

CREATE FUNCTION customer_lifetime_value(id SMALLINT)
RETURNS DECIMAL(5, 2)
DETERMINISTIC
BEGIN
	DECLARE expenses DECIMAL(5, 2);

	SELECT SUM(amount) INTO expenses 
	FROM payment
	LEFT JOIN customer ON payment.customer_id = customer.customer_id
	WHERE customer.customer_id = id;

	RETURN expenses;
	
END;

SELECT customer_lifetime_value(1);

-- 3.

CREATE FUNCTION get_actor_full_name(id SMALLINT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE full_name VARCHAR(50);

	SELECT CONCAT(first_name, ' ', last_name) INTO full_name
	FROM actor
	WHERE actor_id = id;

	RETURN full_name;
	
END;

SELECT get_actor_full_name(1);

-- 4.

CREATE FUNCTION get_rentals_by_category(id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_rentals INT;

    SELECT COUNT(rental_id) INTO total_rentals
    FROM rental
    JOIN inventory ON rental.inventory_id = inventory.inventory_id
    JOIN film_category ON inventory.film_id = film_category.film_id
    WHERE film_category.category_id = id;

    RETURN total_rentals;
   
END;

SELECT get_rentals_by_category(1);

-- Procedūros
-- 1.
