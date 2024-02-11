create database school;
-- join is used to combine data from two or more tables, based on a related(common) column between them.
-- types of joins 1. Inner join 2. outer join i) left join ii) right join iii) full join

CREATE TABLE student(id int primary key, name varchar(50));
insert into student(id, name) values(101, "adman"),(102, 'bob'),(103, 'casey');

create table course( id INT primary key, name varchar(50));
INSERT INTO course (id, name) values(102, "english"),(105, "math"),(103, "science"),(107, "Computer Science");

-- 1. Inner join : return all the records(rows) have matching values in both tables.
SELECT * FROM student
INNER JOIN course
ON student.id = course.id;

-- Alias : alternate name or temprary name given to the column or table
-- above condition with alias
SELECT * FROM student as s
INNER JOIN course as c
ON s.id = c.id;
use college;
select full_name AS name, stu_age AS age from student;

-- if alias with space seprated
select full_name AS name, stu_age AS "student age" from student;


-- 2. Outer join
-- i) return all the records(rows) form left table and matched records(rows) form right table
select * from student
LEFT JOIN course
ON student.id = course.id; 

-- ii) return all the records form right table and matched records(rows) from left table
 select * from student
RIGHT JOIN course
ON student.id = course.id;

-- iii) return all the records form left and right table, including mathch and non-match
SELECT * from student
LEFT JOIN course
ON student.id = course.id
UNION 
SELECT * from student
RIGHT JOIN course
ON student.id = course.id;

-- left exclusive join : 
SELECT * FROM student AS a
LEFT JOIN course AS b
ON a.id = b.id 
WHERE b.id IS NULL;

-- right exclusive join : 
select * from student as a
right join course as b
on a.id = b.id
where a.id is null;

-- full exclusive join
SELECT * FROM student AS a
LEFT JOIN course AS b
ON a.id = b.id 
WHERE b.id IS NULL
union
select * from student as a
right join course as b
on a.id = b.id
where a.id is null;


-- set operations :
-- union : it is used to combine result set of two or more select statements.
-- gives unique records.

SELECT NAME FROM student 
UNION
SELECT NAME FROM student;

-- union all
SELECT NAME FROM student 
UNION ALL
SELECT NAME FROM student;





