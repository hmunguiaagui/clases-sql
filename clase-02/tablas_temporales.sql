USE movies_db;

-- Con la base de datos “movies”, se propone crear una tabla temporal llamada “TWD” y guardar en la misma los episodios de todas las temporadas de “The Walking Dead”.
DROP TABLE IF EXISTS TWD;
CREATE TEMPORARY TABLE TWD(title VARCHAR(200), number INT, release_date DATE, rating INT, season VARCHAR(100));

INSERT INTO TWD 
	SELECT e.title, e.number, e.release_date, e.rating, seasons.title FROM episodes e 
		JOIN seasons ON e.season_id = seasons.id 
			JOIN series ON seasons.serie_id = series.id 
				WHERE series.title LIKE "The Walking Dead";
-- Realizar una consulta a la tabla temporal para ver los episodios de la primera temporada.
SELECT * FROM TWD WHERE season LIKE "Primer Temporada";