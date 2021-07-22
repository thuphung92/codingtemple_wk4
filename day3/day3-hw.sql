--- Customers living in Texas
SELECT first_name, last_name, district
FROM    customer c JOIN address a
        ON c.address_id = a.address_id
WHERE   district = 'Texas';

--- All payments above $6.99 with customer's full name
SELECT  amount, first_name, last_name
FROM    customer c INNER JOIN payment p
        ON c.customer_id = p.customer_id
WHERE   amount > 6.99
ORDER BY amount, first_name;

--- Show all customer's names having made payments over $175: 
SELECT first_name, last_name
FROM    customer
WHERE   customer_id IN
                    (SELECT      customer_id
                     FROM        payment
                     GROUP BY    customer_id
                     HAVING      SUM(amount) > 175);

--- Customers living in Nepal: 0
SELECT  first_name, last_name, city
FROM    customer c
        JOIN address a
        ON c.address_id = a.address_id
        JOIN city ct
        ON a.city_id = ct.city_id
WHERE   city = 'Nepal';

--- Staff having the most TRANSACTIONs: Jon Stephens
SELECT  s.first_name, s.last_name, COUNT(*) AS num_of_transactions
FROM    staff s
        JOIN payment p
        ON   s.staff_id = p.staff_id
GROUP BY s.staff_id
ORDER BY COUNT(*) DESC
LIMIT   1;

--- Number of movies of each rating
SELECT      rating, COUNT(*)
FROM        film
GROUP BY    rating;

--- Customers having made a single payment above $6.99
SELECT  first_name, last_name
FROM    customer
WHERE   customer_id IN
        (SELECT customer_id
         FROM    payment
         WHERE amount > 6.99);

--- Number of free rentals given away from: 24
SELECT COUNT(*)
from payment
WHERE amount = 0;