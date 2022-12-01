

-- 2.8 Lab | SQL Join (Part II)

-- 1. Write a query to display for each store its store ID, city, and country.



SELECT s.store_id as store_ID, cty.city as City_Name, ctr.country as Country_Name
FROM sakila.store as s
JOIN sakila.address as ad
ON s.address_id = ad.address_id
JOIN sakila.city as cty
ON cty.city_id = ad.city_id
JOIN sakila.country as ctr
ON cty.country_id = ctr.country_id
GROUP BY store_id;



-- 2. Write a query to display how much business, in dollars, each store brought in.

SELECT s.store_id as store, sum(p.amount) as total_dollars
FROM sakila.store as s
JOIN sakila.staff as st
ON s.store_id = st.store_id
JOIN sakila.payment as p
ON p.staff_id = st.staff_id
GROUP BY s.store_id;

-- 3. Which film categories are longest?
SELECT f.length as film_duration, c.name as category_name
FROM sakila.film as f
JOIN sakila.film_category as fcat
ON f.film_id = fcat.film_id
JOIN sakila.category as c
ON c.category_id = fcat.category_id
WHERE f.length = '185'
GROUP BY c.name , f.length
ORDER BY length DESC;


-- 4. Display the most frequently rented movies in descending order.

SELECT i.film_id, count(distinct r.rental_id) as total
FROM sakila.payment p
JOIN sakila.rental r
ON p.rental_id = r.rental_id
JOIN sakila.inventory i
on i.inventory_id = r.inventory_id
JOIN sakila.film_category fc
on fc.film_id = i.film_id
GROUP BY i.film_id
ORDER BY total DESC;

-- 5. List the top five genres in gross revenue in descending order.

SELECT cat.name as genres, sum(p.amount) as gross_revenue
FROM sakila.payment p
JOIN sakila.rental r
ON p.rental_id = r.rental_id
JOIN sakila.inventory i
on i.inventory_id = r.inventory_id
JOIN sakila.film_category fc
on fc.film_id = i.film_id
JOIN sakila.category cat
on cat.category_id = fc.category_id
GROUP BY cat.name 
ORDER BY gross_revenue DESC
limit 5;

-- 6. Is "Academy Dinosaur" available for rent from Store 1?
-- As we can see record of Academy Dinosaur in the inventory/film joined table, we will assume that it is available to rent. 
SELECT *
FROM sakila.film f
JOIN sakila.inventory i
ON f.film_id = i.film_id
WHERE f.title = 'Academy Dinosaur' AND i.store_id = '1';

-- 7.  Get all pairs of actors that worked together.

SELECT *
FROM film_actor as fa1
JOIN film_actor as fa2
ON (fa1.film_id = fa2.film_id) AND (fa1.actor_id > fa2.actor_id)
ORDER BY fa1.film_id ASC;


