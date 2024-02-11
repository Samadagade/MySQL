-- SQL Sub Queries / Nested Query : it is a query within another sql qurey.
 -- three ways to use subquery :
 -- 1. inside select statement : 
 -- 2. inside from : 
 -- 3. inside wehre clause/ condition : 
 
 -- subqueries inside where clause :
use college;
select * from student;
-- get names of all the student who scored more than class avarage
-- step 1. find the avg of class
-- step 2. find the names of student with marks>avg

select full_name, marks 
from student 
where marks > (select avg(marks) from student);

-- get names of all students with even roll numbers
-- find all even roll numbers
-- get all the students with even roll numbers

-- step 1 :
select rollno from student where rollno %2 = 0;

-- step 2 :
select * from student where rollno IN(102, 104, 106);

select full_name, rollno 
from student 
where rollno IN(
	select rollno 
    from student 
    where rollno % 2 = 0); 
    
-- subquery inside form
-- find the max marks form the studdnet in delhi
-- step 1 : find all the students in delhi
-- stept 2 : find the max of marks using sublist in step 1

select * from student where city = "delhi";

select max(marks) from (select * from student where city = "delhi") as temp;

-- subquery inside select :
select(select max(marks) from student), full_name from student;
