-- clause(condition) : clause(contion) used with select statement

-- where : where clause(condition) used with select statement :
-- where clause is used to filter records;
select * from city where population <= 20000;
select id, countrycode, district from city where district = 'England';
-- Syntax : select column1, column2 from table_name where condition;

-- operators in sql :   
-- in sql operator are used with where clause
-- arithmatic operatorn  +, -, /, *, %;
-- comparision operator  >,<,>=,<=, = , !=
-- Logical operator AND, OR, NOT, IN, BETWEEN, ALL, LIKE, ANY
-- Bitwise Operator & (Bitwise AND), | (Bitwise OR)

-- and operator or operator: 
select 12 + 23;
select 34/0;
select * from city where population >= 20000 and district = 'England';
select * from city where population >= 20000 or district = 'England';

-- between :  selects for a given range
select * from city where population between 20000 and 30000;

-- In : matches any value in list
select * from city where district IN ("England", "Tahiti", "Beed");

-- Not : to neglect an given condition
select * from city where district NOT IN("England", "Tahiti", "Beed");
-- select * from student where not grade = "B";

-- LIMIT clause : sets and upper limt on number of rows to be returned
-- syntax : select col1, col2 from table_name LIMIT number of rows;
select * from city LIMIT 5;
select * from city where population >= 20000 LIMIT 5;


-- Order by Clause : 
-- To sort the result set in ascending order(ASC) or Descending order(DESC)
-- By default it will sort it ascending order
-- Syntax : select col1, col2 from table_Name ORDER BY col_name(s) ASC/DESC;

-- select * from student order by grade;       -- by default if we do not write asc/desc
select * from city ORDER BY POPULATION ASC;
select * from city ORDER BY POPULATION DESC;

-- it order by grade in ascending order but if two studens have same grade then order by city
-- select * from student order by grade, city;

-- it order by grade in ascending order but if two studens have same grade then order by city in desc order
-- select * from student order by grade asc, city desc;


-- we can use multiple clauses together as follow :
select * from city ORDER BY POPULATION DESC limit 5;


-- Aggrigate function : trick : SCAM  
-- aggregate functions perform a calculations on a set of values and return single value.
select max(population) from city;
select min(population) from city;
select avg(population) from city;
select count('England') from city;
select sum(population) from city;


-- GROUP BY CLAUSE
-- Group By gernarally used with aggrigate functions.
-- it group the rows have same values into summary row
-- it collect data from multiple record and group the result by one more column
-- ? group kiske basis pe banana hain
select city from student group by city;
-- select city, count(rollno) from student group by city;
select city, max(marks) from student group by city;
-- the no. if columns after select should same as no. of columns after 
-- group by else it showin an error eg. select city from student group by city name;

select city, name from student group by city, name;

select city, name, count(roll) from student group by city, name;
-- exercise : write query to find avg marks in each city in ascending  
select city, avg(marks) from student group by city order by marks asc;  -- asc is default
select city, avg(marks) from student group by city order by marks desc;


-- Having clause :
-- similar as where i.e. used to appy some condition
-- where is used to apply condition on rows 
-- having is used to apply condition after grouping
-- HAVING IS USED TO APPLY CONDITION ON GROUPS
select name from student group by name having max(marks)>90;

-- count no of student in each city where max marks cross 95
select city, count(name) from student group by city having max(marks)>=90;

-- ORDER IN WHICH CLAUSE ARE WRITE : 
-- SELECT COLOUMS FROM TABLE_NAME WHERE CONDITION ON ROWS GROUP BY COLUMN HAVING CONDITION ORDER BY COLUMN(S) ASC/DESC;
SELECT CITY FROM STUDENT where GRADE="A" GROUP BY CITY HAVING MAX(MARKS)>90 ORDER BY CITY DESC;
