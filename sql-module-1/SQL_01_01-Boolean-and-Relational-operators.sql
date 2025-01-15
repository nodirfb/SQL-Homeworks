--1--

SELECT * FROM inventory.Customer
WHERE grade > 100;


--2--

SELECT * FROM inventory.Customer
WHERE city = 'New York'
	AND grade > 100;

--3--

SELECT * FROM Inventory.Customer
WHERE city = 'New York'
	OR grade > 100;

--4-- ?

SELECT * FROM Inventory.Customer
WHERE city = 'New York'
	OR NOT grade > 100;

--5-- ?

SELECT * FROM inventory.customer
WHERE NOT city = 'New York' 
	AND NOT grade > 100;

--6-- ?

SELECT * FROM Inventory.Orders
WHERE NOT (ord_date = '2012-09-10' 
	AND salesman_id > 5005 
	OR purch_amt > 1000)

--7-- ?

SELECT * FROM inventory.salesman
WHERE commission > 0.10 
	AND commission < 0.12;

--8-- ?

SELECT * FROM inventory.orders
WHERE purch_amt < 200 
	OR NOT(ord_date >= '2012-02-10' 
	AND customer_id < 3009);

--9-- ?

SELECT * FROM inventory.orders
WHERE NOT(ord_date = '2012-08-17' 
	OR customer_id > 3005 
	AND purch_amt < 1000)

--10-- ?

SELECT ord_no, purch_amt,
	purch_amt * 100/6000 AS Achieved,
	100 - (purch_amt * 100/6000) AS Unachieved
FROM inventory.orders
WHERE (purch_amt * 100/6000) > 50;

--11--

SELECT * FROM emp_details
WHERE emp_lname = 'Dosni' 
	OR emp_lname = 'Mardy';

--12--

SELECT * FROM emp_details
WHERE emp_dept = 47
	OR emp_dept = 63;


























