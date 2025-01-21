


--1
-- My solution. I didn't know that i shouldn't use joins in this exercises.
 ALTER TABLE inventory.customer
 ADD FOREIGN KEY (salesman_id) REFERENCES Inventory.salesman(salesman_id)

SELECT cust_name, name, inventory.Salesman.city
FROM Inventory.Salesman
JOIN Inventory.Customer
	ON Inventory.Salesman.city = Inventory.Customer.city;

-- Solution

SELECT salesman.name AS "Salesman",
	   customer.cust_name, 
	   customer.city
FROM inventory.Salesman, inventory.Customer
WHERE salesman.city = customer.city;
 
--2

SELECT cust_name, name 
FROM Inventory.Customer, Inventory.Salesman
WHERE Inventory.Customer.salesman_id = inventory.salesman.salesman_id;

--3

SELECT ord_no, 
	   cust_name, 
	   Orders.customer_id,
	   Orders.salesman_id, 
	   Salesman.city, 
	   Customer.city
FROM Inventory.Salesman,
	 Inventory.Customer,
	 Inventory.Orders
WHERE Customer.customer_id = orders.customer_id 
	and Salesman.salesman_id = Orders.salesman_id
	and Salesman.city <> Customer.city
	


--4

SELECT ord_no, cust_name
FROM Inventory.Orders, Inventory.Customer
WHERE Orders.customer_id = Customer.customer_id

--5

SELECT cust_name AS Customer,
	   grade AS Grade, 
	   ord_no
FROM inventory.orders, inventory.customer
WHERE Customer.customer_id = orders.customer_id
	AND Customer.grade IS NOT NULL
	AND customer.city IS NOT NULL;


--6

SELECT cust_name AS Customer,
	   Customer.city AS City, 
	   Salesman.name AS Salesman, 
	   commission
FROM Inventory.Salesman, Inventory.customer
WHERE salesman.salesman_id = customer.salesman_id
	  AND salesman.commission BETWEEN 0.12 AND 0.14



--7

SELECT ord_no,
	   cust_name, 
	   Commission AS 'Commission%', 
	   orders.purch_amt * salesman.commission AS Commission
FROM inventory.salesman, 
	 inventory.customer, 
	 inventory.orders
WHERE orders.salesman_id = salesman.salesman_id 
	AND orders.customer_id = customer.customer_id
	AND customer.grade >= 200;

--8


SELECT * 
FROM Inventory.Customer, 
	 Inventory.Orders
WHERE orders.customer_id = Customer.customer_id
	AND orders.salesman_id = customer.salesman_id
	AND orders.ord_date = '2012-10-05'
	   
