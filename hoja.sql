use sakila

Select distinct r.customer_id  from rental r join inventory i Using (inventory_id) 
where i.film_id = AnY (Select film_id from film  where length > any( 
select avg(f2.length)  From film f2 join film_category fc Using(film_id) group by fc.category_id));

-- hotra forma de hacerlo 

with lista_pelis AS(SELECT film_id FROM film WHERE length>any (SELECT AVG(f.lenght)
FROM film f JOIN film_category fc USING(film_id) GROUP BY fc.category_id,f.film_id)
)
Select distinct r.customer_id  from rental r join inventory i Using (inventory_id)
 where i.film_id = AnY (Select film_id from lista_pelis);


WITH tabla1 AS (
    SELECT film_id, COUNT(actor_id) total FROM film_actor GROUP BY film_id
    ), tabla2 AS (
        SELECT customer_id FROM rental GROUP BY customer_id ORDER BY COUNT(rental_id) DESC LIMIT 5
    )
    SELECT AVG(total) FROM tabla1 join inventory i USING (film_id) JOIn rental USING(inventory_id) JOIN tabla2  USING(customer_id) ;

    SELECT COUNT(film_id) FROM film_category GROUP BY category_id;


SELECT AVG(t.total) FROM tabla2 JOIN rental USING (customer_id) JOIN inventory USING(inventory_id)JOIN tabla1 t USING(film_id)  ;

SELECT c.customer_id 
From customer c  
where  c.customer_id in (
SELECT c2.first_name
FROM customer c2    
where c.first_name = c2.first_name  AND
 c.customer_id <> c2.customer_id )


SELECT c.customer_id 
From customer c  
where  c.first_name in (
SELECT c2.first_name
FROM customer c2    
where c.first_name = c2.first_name  AND
 c.customer_id <> c2.customer_id )

SELECT c.customer_id 
From customer c  
where c.first_name  IN(
SELECT c2.first_name
FROM customer c2    
where    c.customer_id <> c2.customer_id );

SELECT c.customer_id 
From customer c  
where  EXISTS(
SELECT c2.first_name
FROM customer c2    
where c.first_name = c2.first_name  AND
 c.customer_id <> c2.customer_id );

Create VIEW top5_clinete As  SELECT customer _id  From rental GROUP BY customer_id ORDER BY  COUNT(rental_id)
DESC LIMIT 5 ;


EXPLAIN ANALYSE



-- numereo de medio de actores enlas peliculas  de las 3 categorias
--que suman  mas durasion en sus pelicullas 
--solo para las catgorias alquiladas por los 5 clientes 
--que mas dinero se han gastado



-- los 5 clientes que mas dinero an gastado
Select p.customer_id
FROM payment p 
 GROUP BY 
 p.customer_id 
 ORDER BY SUM(p.amount) DESC LIMIT 5 ;

-- categorias de las peliculas alquiladas por los 5 clintes 
With top5_clients as ( 
Select p.customer_id 
FROM payment p 
 GROUP BY p.customer_id ORDER BY SUM(p.amount) DESC LIMIT 5 )
 SELECT DISTINCT fc.category_id FROM
 top5_clients t5 JOIN rental USING(customer_id)
 JOIN inventory USING(inventory_id)

 JOIN film_category  fc USING (film_id) ;

 -- las tres categorias que sume mayor durasion de su peliculas
With top5_clients as ( 
Select p.customer_id 
FROM payment p 
 GROUP BY p.customer_id ORDER BY SUM(p.amount) DESC LIMIT 5 
 ), top5_cli_cat as(
 SELECT DISTINCT fc.category_id FROM
 top5_clients t5 JOIN rental USING(customer_id)
 JOIN inventory USING(inventory_id) 
 JOIN film_category  fc USING (film_id)
 ) 
 SELECT category_id 
 from  top5_cli_cat JOIN film_category USING(category_id) 
 JOIN film f USING( film_id)
 GROUP BY category_id ORDER BY SUM(f.length) DESC LIMIT 3;


 -- numero medio de actores en las 3 peliculas
 With top5_clients as ( 
Select p.customer_id 
FROM payment p 
 GROUP BY p.customer_id ORDER BY SUM(p.amount) DESC LIMIT 5 
 ), top5_cli_cat as(
 SELECT DISTINCT fc.category_id FROM
 top5_clients t5 JOIN rental USING(customer_id)
 JOIN inventory USING(inventory_id) 
 JOIN film_category  fc USING (film_id)
 ), top3_category_id AS( 
 SELECT category_id 
 from  top5_cli_cat JOIN film_category USING(category_id) 
 JOIN film f USING( film_id)
 GROUP BY category_id ORDER BY SUM(f.length) DESC LIMIT 3 
 ), to3_count as ( 
 SELECT COUNT(fa.actor_id) as total  FROM top3_category_id  
 JOIN film_category USING(category_id) 
 JOIN film USING(film_id) 
 JOIN film_actor fa USING(film_id)
GROUP BY category_id
)
SELECT AVG(total) FROM to3_count ;


-- crear una nueba instacia de aws e istala  mysql server
--crear una base de datos ' sakila' con un usuario'sakila'


-- conextar dsde el dbeaver al servidor con el usuario
--ejcutar sakila-schema.sql y sakila-data.sql

-- crear una vista que muestre :
-- lista de clientes que hallan  alquilafo al menos 3 peliculas 
-- de las 5 categorias mas alquilADAS 

CREATE VIEW vista as SELECT r.customer_id From film_category fc
JOIN film USING (film_id) 
JOIN inventory  USING (film_id)
JOIN rental r USING (inventory_id) 
WHERE r.rental_id >=3  GROUP BY fc.category_id  ;

SELECT category_id, SUM(rental_id) From film_category fc
JOIN film USING (film_id) 
JOIN inventory  USING (film_id)
JOIN rental r USING (inventory_id) GROUP BY category_id ORDER BY category_id DESC ;

SELECT r.customer_id From film_category fc
JOIN film USING (film_id) 
JOIN inventory  USING (film_id)
JOIN rental r USING (inventory_id) 
WHERE r.rental_id >=3  GROUP BY fc.category_id  h ;

WITH categ5 as (
    SELECT fc.category_id FROM  film_category fc
JOIN inventory  USING (film_id)
JOIN rental r USING (inventory_id)
 GROUP BY fc.category_id  ORDER BY COUNT(fc.film_id)DESC LIMIT 5
)
SELECT r.customer_id From rental r 
JOIN inventory  USING (inventory_id)
JOIN film_category USING (film_id)
JOIN categ5 c5 USING(category_id) 
 GROUP BY r.customer_id  ;

