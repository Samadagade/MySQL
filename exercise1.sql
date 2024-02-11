-- exercise 1 :
CREATE DATABASE XYZ;
use XYZ;
create table employee(id int primary key, name varchar(100), salary int);
insert into employee(id, name, salary) values(1, 'adam', 25000), (2, 'bob', 30000), (3,'casey', 40000);
select * from employee;

-- exercise 2 : 
-- exercise : write query to find avg marks in each city in ascending  
select city, avg(marks) from student group by city order by marks asc;  -- asc is default
select city, avg(marks) from student group by city order by marks desc;

-- exercise 3 :
-- exercise : change name of column "name" to "full_name"
ALTER TABLE student CHANGE name full_name VARCHAR(50);

-- exercise : delete all the students who scored marks less than 80
DELETE FROM student WHERE  marks<80;

-- exercise : delete the column for grade
ALTER TABLE student DROP COLUMN grade;