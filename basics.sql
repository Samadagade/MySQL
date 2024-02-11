-- Database Related Queries :
CREATE DATABASE  COLLEGE;
CREATE DATABASE IF NOT EXISTS COLLEGE;

USE COLLEGE;

DROP DATABASE COMPANY;
DROP DATABASE IF EXISTS COMPANY;

SHOW databases;
SHOW TABLES;

-- table relate queries 
-- CREATE TABLE student(id int primary key, name varchar(50), age int not null);
CREATE TABLE student(
 rollno INT PRIMARY KEY, 
 name VARCHAR(50),
 marks INT NOT NULL, 
 grade VARCHAR(1),
 city VARCHAR(20)
);
  
-- to insert into table
insert into student(id, name, age) values(5,'sagar',22);

insert into student values(6,'sushant',22);  -- if you adding values in all columns then no need to specity column names

-- to insert multiple rows at a time
insert into student(id, name, age) values(7,'sushil',22),(8, 'vikas', 22) ;
INSERT INTO student(rollno, name, marks, grade, city)VALUES
(101, "anil", 78, "C","Pune"), 
(102, "bhumika", 93, "A","Mumbai"), 
(103, "chetan", 85, "B","Mumbai"), 
(104, "dhruv", 96, "A","Delhi"), 
(105, "emanuel", 12, "F","Delhi"), 
(106, "farah", 82,"B","Delhi");


-- select statement in SQL
select * from student;
select name, age from student;

-- select DISTICT is used to return distinct(different) values
select DISTINCT grade  from student;
select count(DISTINCT grade) from student;


/* see file of claus.sql */

-- to off safe mode : safe mode is permission to update the table used in sql
SET SQL_SAFE_UPDATES = 0;

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

-- ALERT : if do not write where clause with WHEE it will DELET ALL DATA ALL ROWS IN table


/* see foreignkey.sql */

-- Alter Table in sql :
-- schema : column, datatype of column, constrains of column
-- Alter is used to change in schema

-- Add Column :
ALTER TABLE student ADD COLUMN age INT;
ALTER TABLE student ADD COLUMN age INT NOT NULL DEFAULT 19;

-- Modify Column : used to modity datatype and constrain of table
ALTER TABLE student MODIFY age varchar(2);

-- Change Column:
ALTER TABLE stuent CHANGE age studentage INT;

-- Drop Column :
ALTER TABLE STUDENT DROP COLUMN age;

-- Rename Table :
ALTER TABLE student RENAME TO stu;

-- Truncate table : delete only data in table not schema
-- TRUNCATE TABLE student;

-- Drop table : delete data and structure in table
-- DROP TABLE student;
select * from student;


/* join in sql */
/* set operations */
/* sub quries */
/* views in sql */













