-- 1- Get a list of all film languages.
SELECT name FROM language;

--2-  Get a list of all films joined with their languages – select the following details : film title, description, and language name. Try your query with different joins:
-- 2.1- Get all films, even if they don’t have languages.
SELECT film.title, film.description, language.name
FROM film
LEFT JOIN language ON film.language_id = language.language_id;

--2.2- Get all languages, even if there are no films in those languages.
SELECT film.title, film.description, language.name
FROM film
RIGHT JOIN language ON film.language_id = language.language_id;
 -- 3-Create a new table called new_film with the following columns : id, name. Add some new films to the table.
 CREATE TABLE new_film (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

-- 4- Create a new table called customer_review, which will contain film reviews that customers will make.
-- 1-review_id – a primary key, non null, auto-increment.
CREATE TABLE customer_review (
    review_id SERIAL,
    film_id INT,
    language_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    score INT NOT NULL,
    review_text TEXT NOT NULL,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(film_id),
	CONSTRAINT fk_film
		FOREIGN KEY(film_id)
		REFERENCES new_film(id) ON DELETE CASCADE,
	UNIQUE (language_id),
	CONSTRAINT fk_language
    FOREIGN KEY (language_id) REFERENCES language(language_id)
);

-- 5- Add 2 movie reviews. Make sure you link them to valid objects in the other tables.
INSERT INTO customer_review (film_id, language_id, title, score, review_text)
VALUES (3, 3, 'this film make sad!', 9, 'any person does not like ');

INSERT INTO customer_review (film_id, language_id, title, score, review_text)
VALUES (4, 4, 'Blood film. it terrible', 3, 'I did not like this movie at all.');

--Delete a film that has a review from the new_film table, what happens to the customer_review table?
DELETE FROM customer_review WHERE review_id=4 AND film_id=4;