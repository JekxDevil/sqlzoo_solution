/* SELECT FROM NOBEL */

/* 1 */
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;

/* 2 */
SELECT winner
FROM nobel
WHERE yr = 1962 AND subject = 'Literature';

/* 3 */
SELECT yr, subject
FROM nobel
WHERE winner LIKE('Albert Einstein');

/* 4 */
SELECT winner
FROM nobel
WHERE yr >= 2000 AND subject LIKE('Peace');

/* 5 */
SELECT * 
FROM nobel
WHERE subject LIKE 'Literature' AND yr BETWEEN 1980 AND 1989;

/* 6 */
SELECT * 
FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');

/* 7 */
SELECT winner
FROM nobel
WHERE winner LIKE 'John%';

/* 8 */
SELECT *
FROM nobel
WHERE (subject LIKE 'Physics' AND yr = 1980) 
  OR 
  (subject LIKE 'Chemistry' AND yr = 1984);

/* 9 */
SELECT *
FROM nobel
WHERE subject NOT IN('Chemistry', 'Medicine') AND yr = 1980;

/* 10 */
SELECT *
FROM nobel
WHERE (subject LIKE 'Medicine' AND yr < 1910) 
  OR 
  (subject LIKE 'Literature' AND yr >= 2004);

/* 11 */
SELECT *
FROM nobel
WHERE winner LIKE 'PETER GRÜNBERG';

/* 12 */
SELECT *
FROM nobel
WHERE winner LIKE 'EUGENE O''NEILL';

/* 13 */
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir %'
ORDER BY yr DESC, winner ASC;

/* 14 */
SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject IN ('Physics','Chemistry'), subject, winner;