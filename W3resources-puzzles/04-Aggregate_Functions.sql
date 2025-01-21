--1

SELECT SUM(purch_amt) 
FROM inventory.orders

--2

SELECT AVG(purch_amt) 
FROM inventory.orders

--3

SELECT COUNT(DISTINCT salesman_id )
from inventory.Orders

--4

SELECT COUNT(customer_id)
FROM inventory.Customer;

--5

SELECT COUNT(customer_id)
FROM inventory.customer
WHERE grade IS NOT NULL;

--6

SELECT MAX(purch_amt)
FROM Inventory.Orders;

--7

SELECT MIN(purch_amt)
FROM Inventory.Orders;

--8

SELECT city, MAX(grade)
FROM Inventory.Customer
GROUP BY city;


--9

SELECT customer_id, MAX(purch_amt)
FROM Inventory.Orders
GROUP BY customer_id;

--10

SELECT customer_id, ord_date,  MAX(purch_amt)
FROM Inventory.Orders
GROUP BY customer_id, ord_date;

--11

SELECT salesman_id, MAX(purch_amt)
FROM Inventory.Orders
WHERE ORD_DATE = '2012-08-17'
GROUP BY salesman_id


--12

-- My solution
SELECT customer_id, ord_date, MAX(purch_amt) as max 
FROM Inventory.orders
WHERE purch_amt > 2000
GROUP BY customer_id, ord_date


-- solution

SELECT customer_id, ord_date, MAX(purch_amt)
FROM inventory.orders
GROUP BY customer_id, ord_date
HAVING MAX(purch_amt) > 2000.00;

--13

SELECT customer_id, ord_date, max(purch_amt)
FROM Inventory.orders
GROUP BY customer_id, ord_date
HAVING max(purch_amt) BETWEEN 2000 AND 6000;


--14

SELECT customer_id, ord_date, MAX(purch_amt) AS max
FROM Inventory.Orders
GROUP BY customer_id, ord_date
HAVING MAX(purch_amt) IN (2000, 3000, 5760, 6000)

--15

SELECT customer_ID, MAX(purch_amt)
FROM Inventory.orders
WHERE customer_id BETWEEN 3002 AND 3007
GROUP BY customer_Id;

--16

SELECT customer_id, MAX(purch_amt)
FROM Inventory.Orders
WHERE customer_id BETWEEN 3002 AND 3007
GROUP BY customer_id
HAVING MAX(PURCH_AMT) > 1000;

--17

SELECT salesman_id, MAX(purch_amt)
FROM Inventory.Orders
WHERE salesman_id BETWEEN 5003 AND 5008
GROUP BY salesman_id;

--18

SELECT COUNT(*)
FROM Inventory.Orders
WHERE ord_date = '2012-08-17'

--19
-- MY SOLUTION

SELECT COUNT(*)
FROM Inventory.Salesman

-- SOLUTION
SELECT COUNT(*)
FROM Inventory.Salesman
WHERE city IS NOT NULL;

--20

SELECT ord_date, salesman_id, COUNT(salesman_id) 
FROM Inventory.Orders
GROUP BY ord_date, salesman_id;


--21

SELECT AVG(PRO_PRICE)
FROM item_mast;

--22

SELECT COUNT(PRO_ID)
FROM item_mast
WHERE PRO_PRICE >= 350;

--23

SELECT AVG(PRO_PRICE), PRO_COM
FROM item_mast
GROUP BY PRO_COM;

--24


CREATE TABLE emp_department (
	DPT_CODE INT, 
	DPT_NAME VARCHAR(50),
	DPT_ALLOTMENT INT 
	);

INSERT INTO emp_department 
VALUES(57, 'IT', 65000),
      (63, 'Finance', 15000),
      (47, 'HR', 240000),
      (27, 'RD', 55000),
      (89, 'QC', 75000)


SELECT SUM(DPT_ALLOTMENT)
FROM emp_department;


--25

SELECT EMP_DEPT, COUNT(*) AS count
FROM emp_details
GROUP BY emp_dept




















































