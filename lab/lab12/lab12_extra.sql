.read lab12.sql

-- Q5
CREATE TABLE greatstudents AS
  SELECT cur.date, cur.color, cur.pet, cur.number, pre.number
  			FROM students AS cur, fa17students AS pre
  			WHERE pre.date = cur.date AND pre.color = cur.color AND pre.pet = cur.pet;

-- Q6
CREATE TABLE sevens AS
  SELECT stu.seven FROM students AS stu, checkboxes AS che
        WHERE stu.time = che.time AND stu.number = 7 AND che."7" = 'True';

-- Q7
CREATE TABLE fa17favnum AS
  SELECT number, COUNT(*) AS count FROM fa17students GROUP BY number ORDER BY count DESC LIMIT 1;


CREATE TABLE fa17favpets AS
  SELECT pet, COUNT(*) AS count FROM fa17students GROUP BY pet ORDER BY count DESC LIMIT 10;


CREATE TABLE sp18favpets AS
  SELECT pet, COUNT(*) AS count FROM students GROUP BY pet ORDER BY count DESC LIMIT 10;


CREATE TABLE sp18dog AS
  SELECT pet, COUNT(*) AS count FROM students WHERE pet = 'dog' GROUP BY pet;


CREATE TABLE sp18alldogs AS
  SELECT pet, COUNT(*) AS count FROM students WHERE pet LIKE '%dog%';


CREATE TABLE obedienceimages AS
  SELECT seven, denero, COUNT(*) AS count FROM students WHERE seven = '7' GROUP BY denero;

-- Q8
CREATE TABLE smallest_int_count AS
  SELECT smallest, COUNT(*) AS count FROM students GROUP BY smallest ORDER BY smallest ASC;
