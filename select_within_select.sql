/* SELECT WITHIN SELECT */

/* 1 */
SELECT name
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Russia');

/* 2 */
SELECT name
FROM world
WHERE continent = 'Europe' 
  AND (gdp/population) > 
    (SELECT gdp/population FROM world WHERE name = 'United Kingdom');

/* 3 */
SELECT name, continent 
FROM world
WHERE continent IN (SELECT continent
                    FROM world
                    WHERE name = 'Argentina' OR name = 'Australia')
ORDER BY name;

/* 4 */
SELECT name, population
FROM world
WHERE population BETWEEN 
  (SELECT population FROM world WHERE name = 'Poland') 
  AND 
  (SELECT population FROM world WHERE name = 'Canada');

/* 5 */
SELECT name, CONCAT(ROUND(population / (SELECT population FROM world WHERE name = 'Germany') * 100, 0), '%')
FROM world
WHERE continent = 'Europe';

/* 6 */
SELECT name
FROM world
WHERE gdp IS NOT NULL 
  AND gdp > (SELECT MAX(gdp) FROM world WHERE continent = 'Europe');

/* 7 */
SELECT continent, name, area
FROM world AS w1
WHERE area >= all (SELECT area FROM world AS w2 WHERE w2.continent = w1.continent);

/* 8 */
SELECT w2.continent, w2.name
FROM (SELECT name, continent 
      FROM (SELECT name, continent FROM world ORDER BY name ASC)
      AS w1 GROUP BY w1.continent)
AS w2;

/* 9 */
SELECT name, continent, population
FROM world AS w1 WHERE 25000000 >= ALL (SELECT population 
                                        FROM world AS w2 
                                        WHERE w1.continent = w2.continent);

/* 10 */
SELECT name, continent
FROM world AS w1
WHERE w1.population > ALL (SELECT population * 3 
                          FROM world AS w2 
                          WHERE w1.continent = w2.continent AND w2.name <> w1.name);
