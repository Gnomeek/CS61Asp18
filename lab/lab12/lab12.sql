.read fa17data.sql
.read sp18data.sql

-- Q2
CREATE TABLE obedience AS
  SELECT seven, denero FROM students;

-- Q3
CREATE TABLE smallest_int AS
  SELECT time, smallest FROM students WHERE smallest > 15 ORDER BY smallest LIMIT 20;

-- Q4
CREATE TABLE matchmaker AS
  SELECT first.pet, first.song, first.color, second.color 
  		FROM students AS first, students AS second
  		WHERE first.pet = second.pet AND first.song = second.song AND first.time < second.time;
