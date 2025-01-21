
CREATE DATABASE practice_sql;
USE practice_sql;

-- CREATING TABLES and INSERTING DATA

CREATE TABLE salesman (
	salesman_id int,
	name varchar(50), 
	city varchar(50), 
	commission decimal(3,2)
	);

INSERT INTO salesman 
values(5001, 'James Hoog', 'New York', 0.15), 
	(5002, 'Nail Knite', 'Paris', 0.13),
    (5005, 'Pit Alex', 'London', 0.11),
    (5006, 'Mc Lyon', 'Paris', 0.14),
    (5007, 'Paul Adam', 'Rome', 0.13),
    (5003, 'Lauson Hen', 'San Jose', 0.12);

	SELECT * FROM salesman;

CREATE TABLE orders (
	ord_no int,
	purch_amt decimal(6,2), 
	ord_date date,
	customer_id int, 
	salesman_id int
	);

INSERT INTO orders
VALUES(70001, 150.5, '2012-10-05', 3005, 5002),
	  (70009, 270.65 , '2012-09-10', 3001, 5005),
	  (70002, 65.26  , '2012-10-05', 3002, 5001),
	  (70004, 110.5  , '2012-08-17', 3009, 5003),
	  (70007, 948.5  , '2012-09-10', 3005, 5002),
	  (70005, 2400.6 , '2012-07-27', 3007, 5001),
	  (70008, 5760   , '2012-09-10', 3002, 5001),
	  (70010, 1983.43, '2012-10-10', 3004, 5006),
	  (70003, 2480.4 , '2012-10-10', 3009, 5003),
	  (70012, 250.45 , '2012-06-27', 3008, 5002),
	  (70011, 75.29  , '2012-08-17', 3003, 5007),
	  (70013, 3045.6 , '2012-04-25', 3002, 5001);

SELECT * FROM orders;

CREATE TABLE customer(
	customer_id int,
	cust_name varchar(50),
	city varchar(50),
	grade int, 
	salesman_id int
	);

INSERT INTO customer(customer_id, cust_name, city, grade, salesman_id)
VALUES(3002, 'Nick Rimando  ', 'New York  ', 100, 5001),
      (3007, 'Brad Davis    ', 'New York  ', 200, 5001),
      (3005, 'Graham Zusi   ', 'California', 200, 5002),
      (3008, 'Julian Green  ', 'London    ', 300, 5002),
      (3004, 'Fabian Johnson', 'Paris     ', 300, 5006),
      (3009, 'Geoff Cameron ', 'Berlin    ', 100, 5003),
      (3003, 'Jozy Altidor  ', 'Moscow    ', 200, 5007);
      
INSERT INTO customer(customer_id, cust_name, city, salesman_id)
VALUES(3001, 'Brad Guzan', 'London', 5005);

	  SELECT * FROM customer;
	  

CREATE TABLE nobel_win(
	year int, 
	subject varchar(50), 
	winner varchar(50), 
	country varchar(50), 
	category varchar(50)
	);


INSERT INTO nobel_win
VALUES(1970, 'Physics','Hannes Alfven ', 'Sweden', 'Scientist'),
	  (1970, 'Physics   ', 'Louis Neel            ', 'France ', 'Scientist '),
	  (1970, 'Chemistry ', 'Luis Federico Leloir  ', 'France ', 'Scientist'),
	  (1970, 'Physiology', 'Ulf von Euler         ', 'Sweden ', 'Scientist'),
	  (1970, 'Physiology', 'Bernard Katz          ', 'Germany', 'Scientist'),
	  (1970, 'Literature', 'Aleksandr Solzhenitsyn', 'Russia ', 'Linguist'),
	  (1970, 'Economics ', 'Paul Samuelson  ', 'USA    ', 'Economist'),
	  (1970, 'Physiology', 'Julius Axelrod  ', 'USA    ', 'Scientist'),
	  (1971, 'Physics   ', 'Dennis Gabor    ', 'Hungary', 'Scientist'),
	  (1971, 'Chemistry ', 'Gerhard Herzberg', 'Germany', 'Scientist'),
	  (1971, 'Peace     ', 'Willy Brandt    ', 'Germany', 'Chancellor'),
	  (1971, 'Literature', 'Pablo Neruda    ', 'Chile  ', 'Linguist'),
	  (1971, 'Economics ', 'Simon Kuznets   ', 'Russia ', 'Economist'),
	  (1978, 'Peace     ', 'Anwar al-Sadat  ', 'Egypt  ', 'President'),
	  (1978, 'Peace     ', 'Menachem Begin  ', 'Israel ', 'Prime Minister'),
	  (1987, 'Chemistry ', 'Donald J. Cram  ', 'USA    ', 'Scientist'),
	  (1987, 'Chemistry ', 'Jean-Marie Lehn ', 'France ', 'Scientist'),
	  (1987, 'Physiology', 'Susumu Tonegawa ', 'Japan  ', 'Scientist'),
	  (1994, 'Economics ', 'Reinhard Selten ', 'Germany', 'Economist'),
	  (1994, 'Peace     ', 'Yitzhak Rabin   ', 'Israel ', 'Prime Minister'),
	  (1987, 'Physics   ', 'Johannes Georg Bednorz', 'Germany', 'Scientist'),
	  (1987, 'Literature', 'Joseph Brodsky ', 'Russia ', 'Linguist'),
	  (1987, 'Economics ', 'Robert Solow   ', 'USA    ', 'Economist'),
	  (1994, 'Literature', 'Kenzaburo Oe   ', 'Japan  ', 'Linguist');

	  SELECT * FROM nobel_win;




CREATE TABLE item_mast(
	pro_id int, 
	pro_name varchar(50), 
	pro_price decimal(6,2),
	pro_com int
	);

INSERT INTO item_mast
VALUES(101, 'Mother Board',3200.00, 15),
      (102, 'Key Board', 450.00, 16),
      (103, 'ZIP drive', 250.00, 14),
      (104, 'Speaker', 550.00, 16),
      (105, 'Monitor',5000.00, 11),
      (106, 'DVD drive', 900.00, 12),
      (107, 'CD drive', 800.00, 12),
      (108, 'Printer',2600.00, 13),
      (109, 'Refill cartridge', 350.00, 13),
      (110, 'Mouse', 250.00, 12);

	  SELECT * FROM item_mast;


CREATE TABLE emp_details(
	emp_idno int, 
	emp_fname varchar(50), 
	emp_lname varchar(50), 
	emp_dept int
	);

INSERT INTO emp_details
VALUES(127323, 'Michale', 'Robbin',57),
      (526689, 'Carlos', 'Snares',63),
      (843795, 'Enric', 'Dosio',57),
      (328717, 'Jhon', 'Snares',63),
      (444527, 'Joseph', 'Dosni',47),
      (659831, 'Zanifer', 'Emily',47),
      (847674, 'Kuleswar', 'Sitaraman',57),
      (748681, 'Henrey', 'Gabriel',47),
      (555935, 'Alex', 'Manuel',57),
      (539569, 'George', 'Mardy',27),
      (733843, 'Mario', 'Saule',63),
      (631548, 'Alan', 'Snappy',27),
      (839139, 'Maria', 'Foster',57);

	  
SELECT * FROM emp_details;


	--RETRIEVING DATA FROM TABLES--

-- 1

SELECT * FROM salesman;

-- 2

SELECT 'This is SQL Exercise, Practice and Solution';

-- 3

SELECT 1,2,3;

-- 4

SELECT 10 + 15;

-- 5

SELECT 50 + 10 * 3;

-- 6

SELECT name, commission FROM salesman;

-- 7

SELECT ord_date, salesman_id, ord_no, purch_amt
FROM orders;

-- 8

SELECT DISTINCT salesman_id
FROM orders;

-- 9

SELECT name, city 
FROM salesman
WHERE city = 'Paris';

-- 10

SELECT * 
FROM customer
WHERE grade = 200;

-- 11

SELECT ord_no, ord_date, purch_amt
FROM orders
WHERE salesman_id = 5001;

-- 12

SELECT year, subject, winner 
FROM nobel_win
WHERE year = 1970;

-- 13

SELECT winner 
FROM nobel_win 
WHERE subject = 'Literature' 
	AND year = 1971;

-- 14

SELECT year, subject
FROM nobel_win
WHERE winner = 'Dennis Gabor';

-- 15

SELECT winner
FROM nobel_win
WHERE subject = 'Physics' 
	AND year >= 1950; 

-- 16

SELECT year, subject, winner, country
FROM nobel_win
WHERE subject = 'Chemistry' 
	AND year BETWEEN 1965 AND 1975;

-- 17

SELECT *
FROM nobel_win
WHERE year > 1972
  AND winner IN ('Menachem Begin', 'Yitzhak Rabin');

-- 18

SELECT * 
FROM nobel_win
WHERE winner LIKE 'Louis%';

-- 19

--mine is incorrect
SELECT * 
FROM nobel_win
WHERE subject = 'Physics'
	AND year = 1970
	--AND subject = 'Economics'
	--AND year = 1971;

--the solution ---------------------------------
SELECT * 
FROM nobel_win
WHERE subject = 'Physics'
	AND year = 1970
UNION
SELECT * 
FROM nobel_win
WHERE subject = 'Economics'
	AND year = 1971;


-- 20

--my version is also correct. 
SELECT * 
FROM nobel_win
WHERE year = 1970
	AND subject <> 'Physiology'
	AND subject <> 'Economics';


--correct version of site-----------------------------------
SELECT * 
FROM nobel_win
WHERE year = 1970
AND subject NOT IN ('Physiology', 'Economics');
-------------------------------------------------------------
-- 21

SELECT *
FROM nobel_win
WHERE subject = 'Physiology' 
	AND year < 1971
UNION 
SELECT * 
FROM nobel_win 
WHERE subject = 'Peace' 
	AND year > 1974;


/*
SELECT *
FROM nobel_win
WHERE subject IN('Physiology', 'Peace')
	AND year < 1971
	and year > 1974;

	why does this query not work???
*/

-- 22

SELECT *
FROM nobel_win 
WHERE winner = 'Johannes Georg Bednorz';

-- 23

SELECT * 
FROM nobel_win
WHERE subject NOT LIKE 'P%'
ORDER BY year DESC;

-- 24

-- my unfinished solution-------------------------------
SELECT * 
FROM nobel_win 
WHERE year = 1970 
AND subject NOT IN ('Chemistry', 'Economics')

--the solution-----------------------------------
SELECT * 
FROM nobel_win 
WHERE year = 1970
ORDER BY
  CASE
    WHEN subject IN ('Economics', 'Chemistry') THEN 1
    ELSE 0
  END ASC,
  subject,
  winner;
-------------------------------------------------------------------

-- 25

SELECT * 
FROM item_mast
WHERE pro_price BETWEEN 200 AND 600;

-- 26

SELECT AVG(pro_price)
FROM item_mast
WHERE pro_com = 16;


-- 27

SELECT pro_name AS 'Item Name',
	   pro_price AS 'Price in Rs'
FROM item_mast;

-- 28

SELECT pro_name, pro_price
FROM item_mast
WHERE pro_price >= 250
ORDER BY pro_price desc;

-- 29

SELECT AVG(pro_price), pro_com
FROM item_mast
GROUP BY pro_com

--The GROUP BY statement groups rows
--that have the same values into summary rows in the ba

--The GROUP BY statement is often used with aggregate functions:
--COUNT(), MAX(), MIN(), SUM(), AVG()
--FOR EXAMPLE:
SELECT COUNT(pro_com), pro_com
FROM item_mast
GROUP BY pro_com

-- 30

--my unfinished query
SELECT MIN(pro_price)
FROM item_mast;

--the solution
SELECT pro_name, pro_price
FROM item_mast
WHERE pro_price = (SELECT MIN(pro_price) FROM item_mast);
-- 31

SELECT DISTINCT emp_lname
FROM emp_details;


-- 32

SELECT * 
FROM emp_details
WHERE emp_lname = 'Snares';

-- 33

SELECT * 
FROM emp_details
WHERE emp_dept = 57;


