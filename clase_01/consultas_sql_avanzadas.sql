-- Mostrar el título y el nombre del género de todas las series.
SELECT s.title, g.name FROM series s JOIN genres g ON g.id = s.id; 
-- Mostrar el título de los episodios, el nombre y apellido de los actores que trabajan en cada uno de ellos.
SELECT e.title, a.first_name, a.last_name FROM actors a JOIN actor_episode ae ON a.id = ae.actor_id JOIN episodes e ON e.id = ae.episode_id;
-- Mostrar el título de todas las series y el total de temporadas que tiene cada una de ellas.
SELECT series.title, COUNT(seasons.number) as total FROM series JOIN seasons ON seasons.serie_id = series.id GROUP BY series.title;
-- Mostrar el nombre de todos los géneros y la cantidad total de películas por cada uno, siempre que sea mayor o igual a 3.
SELECT g.name, COUNT(m.genre_id) AS total FROM genres g JOIN movies m ON m.genre_id = g.id GROUP BY g.name HAVING total >= 3; 
-- Mostrar sólo el nombre y apellido de los actores que trabajan en todas las películas de la guerra de las galaxias y que estos no se repitan.
SELECT DISTINCT(CONCAT(a.first_name, " ",a.last_name)) AS name FROM actor_movie am JOIN actors a ON a.id = am.actor_id JOIN movies m ON m.id = am.movie_id WHERE m.title LIKE "%La Guerra de las galaxias%";
-- Otra solución al query anterior
SELECT a.first_name, a.last_name FROM actor_movie am JOIN actors a ON a.id = am.actor_id JOIN movies m ON m.id = am.movie_id WHERE m.title LIKE "%La Guerra de las galaxias%" GROUP BY a.id;