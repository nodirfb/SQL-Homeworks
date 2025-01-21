
--1

SELECT * FROM inventory.Salesman
WHERE city = 'Paris'
	OR city = 'Rome';

--2

SELECT * FROM inventory.Salesman
WHERE city = 'Paris'
	OR city = 'Rome';

--3

SELECT * FROM inventory.Salesman
WHERE NOT(city = 'Paris'
	OR city = 'Rome');

--4

SELECT * FROM inventory.customer
WHERE customer_id IN (3007, 3008, 3009);

--5

SELECT * FROM inventory.Salesman
WHERE commission BETWEEN 0.13 AND 0.14;

--6

SELECT * FROM inventory.orders
WHERE purch_amt BETWEEN 500 AND 4000
	AND purch_amt NOT IN (948.50, 1983.43)
	
--7
-- MY SOLUTION.
SELECT * FROM inventory.Salesman
WHERE name LIKE '[B-K]%'

-- SOLUTION
SELECT * FROM inventory.Salesman
WHERE name BETWEEN 'A' AND 'L';


--8

SELECT * FROM inventory.salesman
WHERE name NOT BETWEEN 'A' AND 'M';

--9

SELECT * FROM inventory.customer
WHERE cust_name LIKE 'B%'

--10

SELECT * FROM inventory.customer
WHERE cust_name LIKE '%n';

--11

SELECT * FROM inventory.salesman
WHERE name LIKE 'N__l%';

--12

CREATE TABLE testtable (
col1 varchar(50)
);

INSERT INTO testtable
VALUES ('A001/DJ-402\44_/100/2015'),
       ('A001_\DJ-402\44_/100/2015'),
       ('A001_DJ-402-2014-2015'),
       ('A002_DJ-401-2014-2015'),
       ('A001/DJ_401'),
       ('A001/DJ_402\44'),
       ('A001/DJ_402\44\2015'),
       ('A001/DJ-402%45\2015/200'),
       ('A001/DJ_402\45\2015%100'),
       ('A001/DJ_402%45\2015/300'),
       ('A001/DJ-402\44')	   


SELECT * FROM testtable
WHERE col1 LIKE '%\_%' ESCAPE '\'

--13

SELECT * FROM testtable
WHERE col1 NOT LIKE '%\_%' ESCAPE '\'

--14

SELECT * FROM testtable
WHERE col1 LIKE '%/%'

--15

SELECT * FROM testtable 
WHERE col1 NOT LIKE '%/%'

--16

SELECT * FROM testtable
WHERE col1 LIKE '%/_//%' ESCAPE '/'

--17

SELECT * FROM testtable
WHERE col1 NOT LIKE '%/_//%' ESCAPE '/'

--18

SELECT * FROM testtable
WHERE col1 LIKE '%/%%' ESCAPE '/'

--19

SELECT * FROM testtable
WHERE col1 not LIKE '%/%%' ESCAPE '/'

--20

SELECT * FROM INVENTORY.customer
WHERE grade IS NULL;

--21

SELECT * FROM inventory.customer 
WHERE grade  IS NOT NULL

--22

SELECT * FROM emp_details
WHERE emp_lname LIKE 'D%'



























