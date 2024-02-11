-- Database Related Queries :
CREATE DATABASE  COLLEGE;
CREATE DATABASE IF NOT EXISTS COLLEGE;
USE COLLEGE;

DROP DATABASE COMPANY;
DROP DATABASE IF EXISTS COMPANY;

SHOW DATABASES;
SHOW TABLES;

-- table relate queries 

-- to create table
CREATE TABLE student(
 rollno INT PRIMARY KEY, 
 name VARCHAR(50),
 marks INT NOT NULL, 
 grade VARCHAR(1),
 city VARCHAR(20)
);

-- to insert into table
INSERT INTO student(id, name, age) VALUES(5,'sagar',22);

-- if you adding values in all columns then no need to specity column names
INSERT INTO student VALUES(6,'sushant',22); 

-- to insert multiple rows at a time
INSERT INTO student(rollno, name, marks, grade, city)VALUES
(101, "anil", 78, "C","Pune"), 
(102, "bhumika", 93, "A","Mumbai"), 
(103, "chetan", 85, "B","Mumbai"), 
(104, "dhruv", 96, "A","Delhi"), 
(105, "emanuel", 12, "F","Delhi"), 
(106, "farah", 82,"B","Delhi");



-- select statement in SQL
SELECT * FROM student;

SELECT name, age FROM student;

-- select DISTICT is used to return distinct(different) values
SELECT DISTINCT grade  FROM student;
SELECT COUNT(DISTINCT grade) FROM student;  -- distinct with Aggrigate function


-- clause(condition) : clause(condition) used with select/updata/delete statement

-- where : where clause(condition) used with select statement :
-- where clause is used to filter records

-- Syntax : select column1, column2 from table_name where condition;
SELECT * FROM city WHERE population <= 20000;
SELECT id, countrycode, district FROM city WHERE district = 'England';

-- operators in sql :   in sql operator are used with where clause

-- arithmatic operatorn  +, -, /, *, %;
-- comparision operator  >,<,>=,<=, = , !=
-- Logical operator AND, OR, NOT, Between, In, ALL, LIKE, ANY
-- Bitwise Operator & (Bitwise AND), | (Bitwise OR)

-- and operator or operator: 
SELECT 12 + 23;   -- arithmatic operator with where
SELECT * FROM city WHERE population >= 20000 AND district = 'England';  -- logical opetor with where

-- Not : to neglect an given condition
SELECT * FROM city WHERE district NOT IN("England", "Tahiti", "Beed");
-- select * from student where not grade = "B";

-- between :  selects for a given range
SELECT * FROM city WHERE population BETWEEN 20000 AND 30000;

-- select all records alphabatically between england andf gelderland
SELECT * FROM city WHERE district BETWEEN 'england' AND 'Gelderland';

-- select * from city where population NOT between 20000 and 30000;

-- In : matches any value in list
SELECT * FROM city WHERE district IN ("England", "Tahiti", "Beed");
-- select * from city where district NOT IN ("England", "Tahiti", "Beed");


-- LIMIT clause : sets and upper limt on number of rows to be returned
-- syntax : select col1, col2 from table_name LIMIT number of rows;
SELECT * FROM city LIMIT 5;
SELECT * FROM city WHERE population >= 20000 LIMIT 5;


-- Order by Clause : 
-- To sort the result set in ascending order(ASC) or Descending order(DESC)
-- By default it will sort it ascending order
-- Syntax : select col1, col2 from table_Name ORDER BY col_name(s) ASC/DESC;

-- select * from student order by grade;  -- by default if we do not write asc/desc
SELECT * FROM city ORDER BY POPULATION ASC;
SELECT * FROM city ORDER BY POPULATION DESC;

-- sorting by position
-- select grade, marks from student order by 1, 2 desc; 

-- it order by grade in ascending order but if two studens have same grade then order by city
-- select * from student order by grade, city;

-- it order by grade in ascending order but if two studens have same grade then order by city in desc order
-- select * from student order by grade asc, city desc;



-- Aggrigate function : trick : SCAM  
-- aggregate functions perform a calculations on a set of values and return single value.
SELECT MAX(population) FROM city;
SELECT MIN(population) FROM city;
SELECT AVG(population) FROM city;
SELECT COUNT('England') FROM city;
SELECT SUM(population) FROM city;


-- GROUP BY CLAUSE
-- Group By gernarally used with aggrigate functions.
-- it group the rows have same values into summary row
-- it collect data from multiple record and group the result by one more column
-- ? group kiske basis pe banana hain
SELECT city, grade FROM student GROUP BY city, grade;
-- select city, count(rollno) from student group by city;
SELECT city, MAX(marks) FROM student GROUP BY city;
-- the no. if columns after select should same as no. of columns after 
-- group by else it showin an error eg. select city from student group by city name;

SELECT city, name FROM student GROUP BY city;
SELECT city, name FROM student GROUP BY city, name;
SELECT city, name, COUNT(roll) FROM student GROUP BY city, name;
-- exercise : write query to find avg marks in each city in ascending  
SELECT city, AVG(marks) FROM student GROUP BY city ORDER BY marks ASC;  -- asc is default
SELECT city, AVG(marks) FROM student GROUP BY city ORDER BY marks DESC;

-- Having clause :
-- similar as where i.e. used to appy some condition
-- where is used to apply condition on rows 
-- having is used to apply condition after grouping
-- HAVING IS USED TO APPLY CONDITION ON GROUPS
SELECT name FROM student GROUP BY name HAVING MAX(marks)>90;

-- count no of student in each city where max marks cross 95
SELECT city, COUNT(name) FROM student GROUP BY city HAVING MAX(marks)>=90;


-- ORDER IN WHICH CLAUSE ARE WRITE : 
-- SELECT COLOUMS FROM TABLE_NAME WHERE CONDITION ON ROWS GROUP BY COLUMN HAVING CONDITION ORDER BY COLUMN(S) ASC/DESC;
SELECT CITY FROM STUDENT WHERE GRADE="A" GROUP BY CITY HAVING MAX(MARKS)>90 ORDER BY CITY DESC;


-- MySQL Null values
-- A field with null values is a field with no value
-- it is possible to insert a new record or update a record without adding a value to this field. 
-- Then, the field will be saved with a NULL value.

-- IS NULL used to find null values in the table
SELECT * FROM student WHERE marks IS NULL;
SELECT * FROM student WHERE marks IS NOT NULL;



-- update : update the data in table and set the new data
UPDATE student SET GRADE = "O" WHERE Grade = "A";
UPDATE STUDENT SET MARKS = 82 WHERE ROLLNO = 105;
UPDATE STUDENT SET GRADE = "B" WHERE MARKS BETWEEN 80 AND 90;

-- increase the marks of all student by one
UPDATE STUDENT SET MARKS = MARKS+1;

-- ALERT : if do not write where clause with update it will update whole table
-- UPDATE student set grade = "B";



-- delete : to delete existing row
-- syntax : DELETE FROM TABLE_NAME WHERE CONDTION
DELETE FROM STUDENT WHERE MARKS<33;

-- My SQL LIKE Operator :
-- The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.

-- two wildcard often used with the LIKE operator.
--  (%) sign represent zero, one or multiple charactors
-- (_) sign represent one, single charactor

-- Syntax :
-- SELECT column1, column2, ... FROM table_name WHERE columnN LIKE pattern;
SELECT * FROM student WHERE full_name LIKE 'a%';
SELECT * FROM student WHERE full_name LIKE '%a';
SELECT * FROM student WHERE full_name LIKE '%il%';
SELECT * FROM student WHERE full_name LIKE '_a%';
SELECT * FROM student WHERE full_name LIKE 'a%l';
SELECT * FROM student WHERE full_name LIKE 'a_%_%';
SELECT * FROM student WHERE full_name LIKE 'b_u_%';

/* foreignkey.sql */


-- Alter Table in sql :
-- schema : column, datatype of column, constrains of column
-- Alter is used to change in schema

-- Add Column :
ALTER TABLE student ADD COLUMN age INT;
ALTER TABLE student ADD COLUMN age INT NOT NULL DEFAULT 19;

-- Modify Column : used to modity datatype and constrain of table
ALTER TABLE student MODIFY age VARCHAR(2);

-- Change Column:
ALTER TABLE student CHANGE age studentage INT;

-- Drop Column :
ALTER TABLE STUDENT DROP COLUMN age;

-- Rename Table :
ALTER TABLE student RENAME TO stu;

-- Truncate table : delete only data in table not schema
-- TRUNCATE TABLE student;

-- Drop table : delete data and structure in table
-- DROP TABLE student;
SELECT * FROM student;




-- Alias : alternate name or temprary name given to the column or table
-- above condition with alias
SELECT * FROM student AS s INNER JOIN course AS c ON s.id = c.id;
SELECT full_name AS name, stu_age AS age FROM student;
-- if alias with space seprated
SELECT full_name AS name, stu_age AS "student age" FROM student;


/* join in sql */
-- join is used to combine data from two or more tables, based on a related(common) column between them.
-- types of joins 1. Inner join 2. outer join i) left join ii) right join iii) full join

-- 1. Inner join : return all the records(rows) have matching values in both tables.
SELECT * FROM student AS s
INNER JOIN course AS c
ON s.id = c.id;
USE college;
SELECT full_name AS name, stu_age AS age FROM student;

-- 2. Outer join

-- left join
-- i) return all the records(rows) form left table and matched records(rows) form right table

-- right join
-- ii) return all the records form right table and matched records(rows) from left table

-- full join
-- iii) return all the records form left and right table, including mathch and non-match


-- left exclusive join : 
SELECT * FROM student AS a
LEFT JOIN course AS b
ON a.id = b.id 
WHERE b.id IS NULL;

-- right exclusive join : 
SELECT * FROM student AS a
RIGHT JOIN course AS b
ON a.id = b.id
WHERE a.id IS NULL;

-- full exclusive join
SELECT * FROM student AS a
LEFT JOIN course AS b
ON a.id = b.id 
WHERE b.id IS NULL
UNION
SELECT * FROM student AS a
RIGHT JOIN course AS b
ON a.id = b.id
WHERE a.id IS NULL;


/* set operations */
/* UNION and UNION ALL */
-- set operations :
-- union : it is used to combine result set of two or more select statements.
-- gives unique records.

SELECT NAME FROM student 
UNION
SELECT NAME FROM student;

-- UNION ALL : gives uniques as well as repeated records from two or more select statement
SELECT NAME FROM student 
UNION ALL
SELECT NAME FROM student;


/* sub quries */
-- SQL Sub Queries / Nested Query : it is a query within another sql qurey.
 -- three ways to use subquery :
 -- 1. inside select statement : 
 -- 2. inside from : 
 -- 3. inside wehre clause/ condition : 
 
  -- subqueries inside where clause :
  SELECT full_name, marks 
FROM student 
WHERE marks > (SELECT AVG(marks) FROM student);


-- subqueries inside from
SELECT MAX(marks) FROM (SELECT * FROM student WHERE city = "delhi") AS temp;

-- subqueries inside select statement : 
SELECT(SELECT MAX(marks) FROM student), full_name FROM student;



/* views in sql */
-- view is a virtual table based on the resut-set of the SQL statement.
-- for any teachar the only see the rollno marks and name of student 
CREATE VIEW view1 AS 
SELECT rollno, full_name, marks FROM student;

TRUNCATE view1;

DROP VIEW view1;

SELECT * FROM view1;