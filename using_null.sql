/* USING NULL */

/* 1 */
SELECT teacher.name
FROM teacher LEFT JOIN dept ON teacher.dept=dept.id
WHERE dept.name IS NULL;

/* 2 */
SELECT teacher.name, dept.name
FROM teacher INNER JOIN dept ON teacher.dept=dept.id;

/* 3 */
SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept ON teacher.dept=dept.id;


/* 4 */
SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept ON teacher.dept=dept.id;

/* 5 */
SELECT teacher.name, COALESCE(teacher.mobile, '07986 444 2266') FROM teacher;

/* 6 */
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher LEFT JOIN dept ON teacher.dept=dept.id;

/* 7 */
SELECT COUNT(*), COUNT(mobile)
FROM teacher;

/* 8 */
SELECT dept.name, COUNT(teacher.name)
FROM teacher RIGHT JOIN dept ON teacher.dept=dept.id
GROUP BY dept.name;

/* 9 */
SELECT
  t.name,
  case 
    when t.dept=1 or t.dept=2 then 'Sci'
    else 'Art'
  end yeah
FROM teacher AS t;

/* 10 */
SELECT
  t.name,
  case 
    when t.dept=1 or t.dept=2 then 'Sci'
    when t.dept=3 then 'Art'
    else 'None'
  end yeah
FROM teacher AS t;
