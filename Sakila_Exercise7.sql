SELECT first_name, last_name, COUNT(film_actor.film_id) AS num_films FROM actor JOIN film_actor ON (actor.actor_id = film_actor.actor_id) 
GROUP BY actor.actor_id;