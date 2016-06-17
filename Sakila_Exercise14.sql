--Write a stored procedure that takes in a film_id and outputs useful details – such as category, actors, film_text, etc.

--Most or all useful info for a given film is stored in the film_list table, including fields from film_text, so I'll just pull from there
CREATE PROCEDURE spFilmInfo(@FilmID AS INT)
AS
BEGIN
SELECT title, description, category, actors, rating FROM film_list
WHERE film_list.FID = @FilmID
END