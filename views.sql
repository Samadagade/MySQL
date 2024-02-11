-- view is a virtual table based on the resut-set of the SQL statement.
-- for any teachar the only see the rollno marks and name of student 
CREATE VIEW view1 AS 
SELECT rollno, full_name, marks FROM student;

truncate view1;

DROP VIEW view1;

select * from view1;


-- auto increment :