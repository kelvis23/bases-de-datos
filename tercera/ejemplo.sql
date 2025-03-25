use sakila


-- 1. Crea una vista llamada top_actores que muestre nombre y apellidos de los actores 
--    que han participado en las 10 películas más taquilleras (payment.amount)
--    ordenador por el número de películas taquilleras en las que han participado.

WITH film_amount as (SELECT f.film_id  From film f 
JOIN inventory USING (film_id)
JOIN rental  USING( inventory_id)
JOIN payment p USING (rental_id)
GROUP BY p.payment_id ORDER BY p.amount DESC
)
SELECT a.first_name , a.last_name FROM actor a JOIN film_actor USING(actor_id) join film USING(film_id) JOIN  film_amount fa USING( film_id) GROUP BY a.actor_id  limit 10 ;



SELECT f.film_id  From film f 
JOIN inventory USING (film_id)
JOIN rental  USING( inventory_id)
JOIN payment p USING (rental_id)
GROUP BY p.payment_id ORDER BY p.amount DESC  ;

-- 2. Lista con la película con más alquileres de cada categoría.
--    Dos columnas: category_id, film_id
 Select film_id  from  film 
 JOIN  inventory USING (film_id) 
 JOIN rental(inventory_id) GROUP BY  rental_id;

SELECT category_id, film_id FROM  film_category JOIN film USING(film_id) GROUP BY category_id, film_id ; 

-- 3. a) trabajador (staff) con más alquileres.
--    b) lista de las 10 películas de mayor longitud alquiladas por a)
--    c) las 3 categorías con mayor media de actores por película.
--    CONSULTA GENERAL: lista de las películas que están en a) y tienen categoría c)

