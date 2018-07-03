SELECT id, title
 FROM movie
 WHERE yr=1962

SELECT yr
 FROM movie
 WHERE title LIKE 'Citizen Kane'

SELECT id, title, yr
 FROM movie
 WHERE title LIKE '%Star Trek%'

SELECT id
  FROM actor
  WHERE name LIKE 'Glenn Close'
 
select id 
  FROM movie
  WHERE title LIKE 'Casablanca'
 
SELECT name
  FROM casting
  JOIN actor ON casting.actorid=actor.id
  WHERE movieid=11768
 
SELECT name
  FROM casting
  JOIN actor ON casting.actorid=actor.id
  WHERE movieid=(SELECT id FROM movie WHERE title='Alien')

SELECT movie.title
  FROM movie
  JOIN casting ON movie.id=casting.movieid
  JOIN actor ON casting.actorid=actor.id
  WHERE actor.id = (SELECT id FROM actor WHERE name LIKE 'Harrison Ford')

SELECT title 
  FROM movie
  JOIN casting ON movie.id=casting.movieid
  JOIN actor ON casting.actorid=actor.id
  WHERE actor.id = (SELECT id FROM actor WHERE name LIKE 'Harrison Ford' AND casting.ord<>1)

SELECT title, name
  FROM movie
  JOIN casting ON movie.id=casting.movieid
  JOIN actor ON casting.actorid=actor.id
  WHERE movie.yr = 1962
  AND casting.ord = 1

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
where name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 where name='John Travolta'
 GROUP BY yr) AS t
)

SELECT title, name
  FROM movie
  JOIN casting ON (movie.id=casting.movieid AND casting.ord=1)
  JOIN actor ON casting.actorid=actor.id  
  WHERE movie.id IN (SELECT movieid FROM casting WHERE actorid IN (SELECT id FROM actor WHERE name LIKE 'Julie Andrews'))

SELECT name
  FROM actor JOIN casting ON casting.actorid=actor.id
  WHERE casting.ord = 1
  GROUP BY name
  HAVING COUNT(movieid) >= 30;

SELECT title, COUNT(actorid)
  FROM movie JOIN casting ON casting.movieid=movie.id
  WHERE yr = 1978
  GROUP BY title
  ORDER BY COUNT(actorid) DESC, title
 
SELECT name
  FROM actor 
  JOIN casting ON casting.actorid=actor.id
  WHERE movieid IN(SELECT movieid FROM casting WHERE actorid = (SELECT id FROM actor WHERE name = 'Art Garfunkel'))
  AND name <> 'Art Garfunkel';