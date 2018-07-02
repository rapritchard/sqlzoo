SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;
 
SELECT winner
FROM nobel
WHERE yr = 1962 AND subject = 'Literature';

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

SELECT winner
FROM nobel
WHERE yr >= 2000 AND subject = 'Peace';

SELECT *
FROM nobel
WHERE yr BETWEEN 1980 and 1989 AND subject = 'Literature';
   
SELECT * FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');

SELECT winner
FROM nobel
WHERE winner LIKE "John%";

SELECT *
FROM nobel
WHERE yr = 1980 AND subject = 'Physics' OR yr = 1984 AND subject = 'Chemistry';

SELECT *
FROM nobel
WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine');

SELECT *
FROM nobel
WHERE yr < 1910 and subject = 'Medicine' OR yr >= 2004 AND subject = 'Literature';

SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG';

SELECT *
FROM nobel
WHERE winner = "EUGENE O'NEILL";

SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE "Sir%" ORDER BY yr DESC, winner;

SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY
CASE WHEN subject IN ('Physics','Chemistry') THEN 1 ELSE 0 END,
 subject,winner;