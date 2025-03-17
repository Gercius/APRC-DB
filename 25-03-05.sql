-- 1.

CREATE INDEX idx_title ON film(title);

SHOW INDEX FROM film;

SELECT * FROM film USE INDEX (idx_title) WHERE title = 'ACADEMY DINOSAUR';

EXPLAIN SELECT * FROM film USE INDEX (idx_title) WHERE title = 'ACADEMY DINOSAUR';

-- 2.

CREATE FULLTEXT INDEX idx_fulltext_description ON film(description);

SELECT * FROM film USE INDEX (idx_fulltext_description) WHERE description LIKE '%Fast%';

-- 3.

CREATE INDEX idx_customer_name ON customer(first_name, last_name);

EXPLAIN SELECT * FROM customer
USE INDEX (idx_customer_name)
WHERE first_name = 'John' AND last_name = 'Doe';

EXPLAIN SELECT * FROM customer
USE INDEX (idx_customer_name)
WHERE last_name = 'Doe';

-- 4.

DROP INDEX idx_fulltext_description ON film;
