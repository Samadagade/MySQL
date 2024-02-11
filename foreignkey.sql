-- FOREIGN KEY IN SQL : 
   
-- create table dept insert values in it

-- parent table
CREATE TABLE dept(id INT PRIMARY KEY, NAME VARCHAR(50));
INSERT INTO dept VALUES(101,"English"), (102, "IT");

-- create table teacher take a dept_id as foreign key and
-- insert values in it

-- child table : because it use the primary key of parent
CREATE TABLE teacher(
   id INT PRIMARY KEY, 
   name VARCHAR(50), 
   dept_id INT,
   FOREIGN KEY(dept_id) REFERENCES dept(id)
   ON UPDATE CASCADE -- cascade : changes(update or delete) done in parent table reflect in child table
   ON DELETE CASCADE 
);

INSERT INTO TEACHER(id, name, dept_id) 
VALUES
(101, "Adam", 101), 
(102,"Bob", 102);

select * from dept;
select * from teacher;
UPDATE dept SET id = 103 where id = 102;

select * from dept;
select * from teacher;