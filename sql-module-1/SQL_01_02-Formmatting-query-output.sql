--1
--my solution is incorrect. i didn't understand the question first.
SELECT salesman_id,
	   name, 
	   city, 
	   '%' AS '?column?',
	   commission AS '?column?'
FROM Inventory.salesman

-- solution
SELECT salesman_id, name, city, '%', commission * 100
FROM inventory.salesman;

--2

SELECT 'For', ord_date, ',there are', COUNT(*), 'orders.'
FROM Inventory.Orders
GROUP BY ord_date;

--3

SELECT * FROM Inventory.Orders
ORDER BY ord_no ASC;

--4

SELECT * FROM Inventory.Orders
ORDER BY ord_date DESC;

--5

SELECT * FROM Inventory.Orders
ORDER BY  ord_date, purch_amt DESC;

--6

SELECT cust_name, city, grade
FROM Inventory.customer
ORDER BY customer_id

--7

SELECT salesman_id, ord_date, MAX(purch_amt)
FROM Inventory.Orders
GROUP BY salesman_id, ord_date
ORDER BY salesman_id, ord_date;

--8

SELECT cust_name, city, grade
FROM Inventory.Customer
ORDER BY 3 DESC;

--9

SELECT customer_id, 
	   COUNT(DISTINCT ord_no), 
	   MAX(purch_amt)
FROM Inventory.Orders
GROUP BY customer_Id
ORDER BY 2 DESC;

--10

SELECT ord_date, 
	   SUM(purch_amt),
	   SUM(purch_amt) * 0.15 AS commissions
FROM Inventory.Orders
GROUP BY ord_date
ORDER BY ord_date