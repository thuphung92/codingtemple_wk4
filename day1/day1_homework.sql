--- How many actors having last name Wahlberg - Ans: 2

SELECT COUNT(last_name)
FROM actor
WHERE last_name = 'Wahlberg';

--- Number of payments were made between $3.99 and $5.99: 5607
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

--- Film that the store have the most of: film_id 380
SELECT film_id, COUNT(film_id) AS count
FROM inventory
GROUP BY film_id
ORDER BY count DESC
LIMIT 1;

--- Number of customers having William as last name: 0
SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'William';

--- The employee sold the most rentals: staff_id 2 for 7304 rentals
SELECT staff_id, COUNT(rental_id) AS count
FROM payment
GROUP BY staff_id
ORDER BY count DESC
LIMIT 1;

--- Number of different district names: 378
SELECT COUNT(DISTINCT district)
FROM address

--- Film has the most actors in: film_id 508 for 15 actors
SELECT film_id, COUNT(actor_id) AS count
FROM film_actor
GROUP BY film_id
ORDER BY count DESC
LIMIT 1;

--- Number of customers have a last name ending with ‘es’: 0
SELECT last_name
FROM customer
WHERE last_name = '%es';

--- Number of  payment amounts had a number of rentals above 250 for customers with ids between 380 and 430: 3
SELECT amount, COUNT(*) AS num_of_rentals
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(*) > 250

--- Number of rating categories: 5
SELECT COUNT(DISTINCT rating)
FROM film

--- Rating has the most movies total: PG-13 with 223 films
SELECT rating, COUNT(*) AS count
FROM film
GROUP BY rating
ORDER BY count DESC
LIMIT 1;