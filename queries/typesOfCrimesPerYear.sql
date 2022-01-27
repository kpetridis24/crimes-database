DROP TABLE IF EXISTS T1, T2, T3, T4;

CREATE TABLE T1 AS
SELECT YEAR(date) as year, count(type) AS felonies
FROM crimes
WHERE crimes.type=1
GROUP BY year;

CREATE TABLE T2 AS
SELECT YEAR(date) as year, count(type) AS misdemeanors
FROM crimes
WHERE crimes.type=2
GROUP BY year;

CREATE TABLE T3 AS
SELECT YEAR(date) as year, count(type) AS infractions
FROM crimes
WHERE crimes.type=3
GROUP BY year;

CREATE TABLE T4 AS
SELECT T1.year, felonies, misdemeanors
FROM T1
LEFT OUTER JOIN T2 ON T1.year=T2.year
UNION
SELECT T2.year, felonies, misdemeanors
FROM T1
RIGHT OUTER JOIN T2 ON T1.year=T2.year;

SELECT T4.year, felonies, misdemeanors, infractions
FROM T4
LEFT OUTER JOIN T3 ON T3.year=T4.year
UNION
SELECT T3.year, felonies, misdemeanors, infractions
FROM T4
RIGHT OUTER JOIN T3 ON T3.year=T4.year

