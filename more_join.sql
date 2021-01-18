/* MORE JOIN */

/* 1 */
SELECT id, title 
FROM movie 
WHERE yr = 1962;

/* 2 */
SELECT yr 
FROM movie 
WHERE title LIKE 'Citizen Kane';

/* 3 */
SELECT id, title, yr 
FROM movie 
WHERE title LIKE '%Star Trek%' 
ORDER BY yr;

/* 4 */
SELECT id 
FROM actor 
WHERE name LIKE 'Glenn Close';

/* 5 */
SELECT id 
FROM movie 
WHERE title LIKE 'Casablanca';

/* 6 */
SELECT actor.name
FROM movie 
  JOIN casting ON movie.id=casting.movieid
  JOIN actor ON actor.id=casting.actorid
WHERE title LIKE 'Casablanca';

/* 7 */
SELECT actor.name
FROM movie 
  JOIN casting ON movie.id=casting.movieid
  JOIN actor ON actor.id=casting.actorid
WHERE title LIKE 'Alien';

/* 8 */
SELECT movie.title
FROM movie 
  JOIN casting ON movie.id=casting.movieid
  JOIN actor ON actor.id=casting.actorid
WHERE actor.name LIKE 'Harrison Ford';

/* 9 */
SELECT movie.title
FROM movie 
  JOIN casting ON movie.id=casting.movieid
  JOIN actor ON actor.id=casting.actorid
WHERE actor.name LIKE 'Harrison Ford' AND casting.ord <> 1;

/* 10 */
SELECT m.title, a.name
FROM movie AS m 
  JOIN casting AS c ON m.id=c.movieid
  JOIN actor AS a ON a.id=c.actorid
WHERE m.yr = 1962 AND c.ord = 1;

/* 11 */
SELECT yr, t1.number 
FROM (SELECT yr, COUNT(*) AS number
      FROM movie 
        JOIN casting ON movie.id=casting.movieid 
        JOIN actor ON actor.id=casting.actorid
      WHERE actor.name LIKE 'Rock HudsON'
      GROUP BY yr) AS t1
WHERE t1.number > 2;

/* 12 */
SELECT m.title, a.name
FROM  movie AS m 
  JOIN casting AS c ON m.id=c.movieid 
  JOIN actor AS a ON c.actorid=a.id
WHERE m.id IN (SELECT m.id
              FROM movie AS m 
              JOIN casting AS c ON m.id=c.movieid 
              JOIN actor AS a ON c.actorid=a.id
              WHERE a.name LIKE 'Julie Andrews') 
AND c.ord = 1;

/* 13 */
SELECT t1.name
FROM (SELECT a.id AS id, a.name AS name, COUNT(*) AS number
      FROM movie AS m 
      JOIN casting AS c ON m.id=c.movieid 
      JOIN actor AS a ON c.actorid=a.id
      WHERE c.ord = 1
      GROUP BY a.id, a.name) AS t1
WHERE t1.number >= 15
ORDER BY t1.name ASC;

/* 14 */
SELECT t1.title, t1.actors_num
FROM (SELECT movie.id, movie.title, movie.yr, COUNT(*) AS actors_num
      FROM movie JOIN casting ON movie.id=casting.movieid
      GROUP BY movie.id, movie.title, movie.yr) AS t1
WHERE t1.yr = 1978
ORDER BY t1.actors_num DESC, t1.title;

/* 15 */
SELECT actor.name
FROM movie 
  JOIN casting ON movie.id=casting.movieid 
  JOIN actor ON actor.id=casting.actorid 
WHERE movie.id IN (SELECT movie.id AS id
                  FROM movie 
                  JOIN casting ON movie.id=casting.movieid 
                  JOIN actor ON actor.id=casting.actorid
                  WHERE actor.name = 'Art Garfunkel') 
AND actor.name <> 'Art Garfunkel';
