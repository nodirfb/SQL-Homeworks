
create database f14_final_exam
use f14_final_exam


--- base table

CREATE TABLE Employees (
    employee_id int,
    first_name varchar(50),
    last_name varchar(50),
    department_id int,
    salary decimal(10, 2),
    hire_date date
)

INSERT INTO employees (employee_id, first_name, last_name, department_id, salary, hire_date)
VALUES
    (1, 'Alice', 'Johnson', 101, 75000.00, '2020-02-15'),
    (2, 'Bob', 'Smith', 102, 64000.00, '2019-07-22'),
    (3, 'Charlie', 'Brown', 103, 82000.00, '2021-03-18'),
    (4, 'Diana', 'Evans', 101, 92000.00, '2018-11-05'),
    (5, 'Eve', 'Campbell', 104, 56000.00, '2022-01-10'),
    (6, 'Frank', 'Harris', 102, 72000.00, '2020-05-29'),
    (7, 'Grace', 'Lee', 103, 81000.00, '2019-09-17'),
    (8, 'Henry', 'Green', 104, 59000.00, '2021-06-01'),
    (9, 'Isabella', 'Garcia', 101, 66000.00, '2020-12-08'),
    (10, 'Jack', 'White', 102, 87000.00, '2017-08-25'),
	(11, 'Joe', 'Smith', 101, 75000.00, '2017-08-25'),
	(12, 'Lily', 'Pete', 102, 72000.00, '2017-08-25')



--Question 1:(10 score)
/*
  split column FullName into 3 part ( Firstname, Middlename, and Lastname)
*/



create table Students(
	StudentID int,
	FullName varchar(100),
	Grade decimal(5,2)
)

insert into Students values 
(1,'James Alexander Hamilton',98.5),
(2,'Arthur George Mason',78.2),
(3,'Lily B Peters',81),
(4,'Kayne Thomas Derek',87.3),
(5,'April Dukane Paris',79.1),
(6,'Payton Carl Johnson',97.1)

--Solution:

WITH cte AS (
	SELECT *,  
	substring(fullname, 1, CHARINDEX(' ', fullname)) as Firstname,

	TRIM(SUBSTRING(fullname, charindex(' ', fullname) + 1, len(fullname)-CHARINDEX(' ', fullname))) AS st
	FROM STUDENTS

)select studentid, fullname, firstname, 

	SUBSTRING(st,1,CHARINDEX(' ',st)) as Middlename,
	TRIM(SUBSTRING(st,charindex(' ',st) +1, LEN(st))) AS Lastname

from cte





----------------------------------------------------------------------------------------------------
--Question 2:(10 score)
	---from the table below,find the running total of sales
	---Show 2 solutions, 1 using Correleted Subqueries another using Window Functions


create table NextVal(
    year INT,
    sales float
);

insert into NextVal values (2005, 67.5);
insert into NextVal values (2006, 70.4);
insert into NextVal values (2007, 71.5);
insert into NextVal values (2008, 68.9);
insert into NextVal values (2009, 73.6);
insert into NextVal values (2010, 75.6);
insert into NextVal values (2011, 80.4);
insert into NextVal values (2012, 81.9);
insert into NextVal values (2013, 83.4);

--Solution:

	--1
	select *, SUM(sales)OVER(ORDER BY year) as runningtotal
	from NextVal

	--2
	select *, 
		(select sum(b.sales) from NextVal as b where a.year >= b.year  ) as runningtotal
	from nextval as a



-------------------------------------------------------------------------------------
--Question 3:(10 score)
/*
	Using the employees table abve, find rows where the employees receive 
	higher than or equal to the average salary of their department

	Show 2 solutions, 1 using Subqueries another using Window Functions
*/

--Solution:



--1

SELECT * FROM Employees as a
WHERE salary >= 
(select avg(salary) avg from Employees as b group by department_id HAVING A.department_id = B.department_id)

--2
SELECT * FROM (
SELECT *, avg(salary)OVER(PARTITION BY department_Id) as avg FROM Employees a
) as dv
WHERE salary >= AVG





-------------------------------------------------------------------------------------
--Question 4:(10 score)


	CREATE TABLE Seat (
    id INT PRIMARY KEY,
    student VARCHAR(50)
);

INSERT INTO Seat (id, student) VALUES (1, 'Abbot');
INSERT INTO Seat (id, student) VALUES (2, 'Doris');
INSERT INTO Seat (id, student) VALUES (3, 'Emerson');
INSERT INTO Seat (id, student) VALUES (4, 'Green');
INSERT INTO Seat (id, student) VALUES (5, 'Jeames');


Question:
--Write an SQL query to reorder the students in the Seat table according to the given output:

Doris  
Abbot  
Green  
Emerson  
Jeames  

--Solution:

SELeCT id, student from (
select *,
   case when student = 'Doris' then 1
    when student = 'Abbot' then 2
    when student = 'Green' then 3
    when student = 'Emerson' then 4
    when student = 'Jeames' then 5
  end as ord
from Seat 
) as dv
ORDER BY ORD





