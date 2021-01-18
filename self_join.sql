/* SELF JOIN */

/* 1 */
SELECT COUNT(*) 
FROM stops;

/* 2 */
SELECT id
FROM stops
WHERE name LIKE 'Craiglockhart'

/* 3 */
SELECT stops.id, stops.name
FROM stops right JOIN route ON stops.id=route.stop
WHERE route.num = 4 AND route.company LIKE 'LRT'
ORDER BY route.num;

/* 4 */
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2;


/* 5 */
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=149;

/* 6 */
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='LONdON Road';

/* 7 */
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket' AND stopb.name='Leith';


/* 8 */
SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='Tollcross';


/* 9 */
SELECT DISTINCT stopa.name, a.company, a.num
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
WHERE b.stop = 53 AND a.company = 'LRT';


/* 10 */

SELECT t1.numa, t1.companya, t2.stopcname, t2.numc, t2.companyc
FROM (SELECT ra.num AS numa, 
        ra.company AS companya, 
        ra.pos AS posa, 
        ra.stop AS stopa, 
        rb.num AS numb, 
        rb.company AS companyb, 
        rb.pos AS posb, 
        rb.stop AS stopb, 
        stopa.id AS stopaid, 
        stopa.name AS stopaname
      FROM route AS ra JOIN route AS rb ON (ra.company=rb.company AND ra.num=rb.num)
        JOIN stops stopa ON (stopa.id = ra.stop)
      WHERE stopa.name = 'Craiglockhart') AS t1
  JOIN (SELECT rc.num AS numc, 
          rc.company AS companyc, 
          rc.pos AS posc, 
          rc.stop AS stopc, 
          rd.num AS numd, 
          rd.company AS companyd, 
          rd.pos AS posd, 
          rd.stop AS stopd, 
          stopb.id AS stopbid, 
          stopb.name AS stopbname, 
          stopc.id AS stopcid, 
          stopc.name AS stopcname
        FROM route AS rc JOIN route AS rd ON (rc.company=rd.company AND rc.num=rd.num)
          JOIN stops stopb ON stopb.id=rd.stop
          JOIN stops stopc ON stopc.id = rc.stop
        WHERE stopb.name = 'Lochend') AS t2
  ON t1.stopb=t2.stopc
ORDER BY t1.numa, t1.posa, t2.stopcname, t1.numb, t1.posb, t2.numc, t2.posc, t2.numd, t2.posd;
