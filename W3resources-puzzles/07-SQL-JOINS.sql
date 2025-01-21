
--1


-- my version  incorrect
SELECT a.name, b.cust_name, b.city, a.city, 
a.salesman_id, b.salesman_id
FROM Inventory.Salesman a
JOIN Inventory.Customer b ON a.salesman_id = b.salesman_id
and a.city = b.city
order by a.name

--correct version
SELECT a.name, b.cust_name, b.city, a.city,
a.salesman_id, b.salesman_id
FROM Inventory.Salesman a, Inventory.Customer b
WHERE a.city = b.city
order by a.name


--2


-- i use left join. output is same in both
SELECT a.ord_no, a.purch_amt, b.cust_name, b.city
FROM inventory.orders a
LEFT JOIN Inventory.Customer b ON a.customer_id = b.customer_id
WHERE a.purch_amt BETWEEN 500 AND 2000

-- solution
SELECT  a.ord_no, a.purch_amt,
        b.cust_name, b.city 
FROM inventory.orders a, Inventory.Customer b 
WHERE a.customer_id = b.customer_id 
AND a.purch_amt BETWEEN 500 AND 2000;


--3


SELECT a.cust_name, a.city, b.name, b.commission
FROM Inventory.Customer a 
JOIN Inventory.Salesman b ON a.salesman_id = b.salesman_id;


--4--?


SELECT a.cust_name, a.city,
	   b.name as salesman, b.commission
FROM Inventory.Customer a
RIGHT JOIN Inventory.Salesman b 
ON a.salesman_id = b.salesman_id
WHERE b.commission > 0.12
-- I use right join 
--because it said  find salespeople who 
--received commissions of more than 12 percent
-- it is not saying about customers.

--- solution is same except it has inner join


--5


SELECT a.cust_name, a.city,
	   b.name AS salesman, b.city, b.commission
FROM Inventory.Customer a
JOIN Inventory.Salesman b 
ON a.salesman_id = b.salesman_id 
WHERE a.city <> b.city 
	AND b.commission > 0.12


--6


SELECT a.ord_no, a.ord_date, a.purch_amt,
	   b.cust_name, b.grade,
	   c.name as salesman, c.commission
FROM inventory.Orders a
JOIN Inventory.Customer b ON a.customer_id = b.customer_id
JOIN Inventory.Salesman c ON a.salesman_id = c.salesman_id


--7--?


--NATURAL JOIN DOESN'T WORK IN SQL SERVER


--8--?


SELECT a.cust_name, a.city, a.grade, 
	   b.name as salesman, b.city as salesman_city
FROM Inventory.Customer as a
JOIN Inventory.Salesman as b 
ON a.salesman_id = b.salesman_id
ORDER BY a.customer_id 
-- MINE IS INCORRECT BECASUE I DIDN'T USE LEFT JOIN
-- I DID NOT UNDERSTAND THE	QUESTION.
-- THERE IS NOT ANY REASON TO USE LEFT JOIN IN TASK 🤷‍♂️


--9


SELECT a.cust_name, a.city, a.grade, 
	   b.name as salesman, b.city as salesman_city
FROM Inventory.Customer AS a 
LEFT JOIN Inventory.Salesman AS b 
ON a.salesman_id = b.salesman_id
WHERE a.grade < 300
ORDER BY a.customer_id;


--10


SELECT a.cust_name, a.city, 
	   b.ord_no, b.ord_date, b.purch_amt
FROM Inventory.Customer AS a
LEFT JOIN Inventory.Orders AS b
ON a.customer_id = b.customer_id
ORDER BY b.ord_date;



--11


SELECT a.cust_name, a.city, 
	   b.ord_no, b.ord_date, b.purch_amt,
	   c.name as sales_name, c.commission
FROM inventory.customer as a 
LEFT JOIN inventory.orders as b 
ON a.customer_id = b.customer_id 
LEFT JOIN inventory.salesman as c 
ON b.salesman_id = c.salesman_id


--12--?

select * from inventory.Salesman

SELECT *
FROM Inventory.Salesman AS a 
LEFT JOIN Inventory.Customer AS b 
ON a.salesman_id = b.salesman_id
ORDER BY a.salesman_id;

SELECT *
FROM Inventory.Customer AS a 
RIGHT JOIN Inventory.Salesman AS b 
ON a.salesman_id = b.salesman_id
ORDER BY b.salesman_id;

--13--????????????????????????????????????????


SELECT a.cust_name, a.city, a.grade, 
       c.name AS "Salesman", 
       b.ord_no, b.ord_date, b.purch_amt
FROM inventory.customer AS a
RIGHT JOIN inventory.orders AS b
ON a.customer_id = b.customer_id
RIGHT JOIN inventory.salesman AS c
ON a.salesman_id = c.salesman_id


SELECT a.cust_name, a.city, a.grade, 
       b.name AS "Salesman", 
       c.ord_no, c.ord_date, c.purch_amt 
FROM inventory.Customer a 
RIGHT JOIN inventory.Salesman b 
ON b.salesman_id = a.salesman_id 
RIGHT JOIN inventory.Orders c 
ON c.customer_id = a.customer_id;


--14



-- FULL SALESMANS + CUSTOMER  salesman.salesman_id = customer.salesman_Id

-- CUSTOMERLAR 1 YO KO'P, YO UMUMON ORDER QO'YMOG'ON CUSTOMERLAR

-- FULL CUSTOMER + ORDERS  customer.customer_id = orders.customer_id
SELECT cust_name, Customer.city, grade, name, ord_no, ord_date, purch_amt
FROM inventory.salesman
LEFT JOIN inventory.customer on salesman.salesman_id = customer.salesman_id
LEFT JOIN Inventory.orders on customer.customer_id = orders.customer_id
WHERE orders.purch_amt > 2000 
	AND Customer.grade IS NOT NULL

SELECT cust_name, a.city, grade, name, ord_no, ord_date, purch_amt
FROM inventory.customer a 
RIGHT OUTER JOIN inventory.salesman b 
ON b.salesman_id = a.salesman_id 
LEFT OUTER JOIN inventory.orders c 
ON c.customer_id = a.customer_id 
WHERE c.purch_amt >= 2000 
AND a.grade IS NOT NULL;



--15

SELECT * FROM Inventory.Salesman

SELECT * FROM Inventory.Customer
SELECT * FROM Inventory.Orders



--my solution
--MY SOLUTION IS CORRECT THERE IS A MISTAKE IN THE SITE'S SOLUTION
SELECT a.cust_name, a.city, 
	   b.ord_no, b.ord_date, b.purch_amt
FROM Inventory.Customer AS a
RIGHT JOIN Inventory.Orders AS b
ON a.customer_id = b.customer_id


--solution
SELECT a.cust_name, a.city, 
	   b.ord_no, b.ord_date, b.purch_amt
FROM Inventory.Customer AS a
LEFT JOIN Inventory.Orders AS b
ON a.customer_id = b.customer_id


--16

--my solution is incorrect.
SELECT * 
FROM Inventory.Customer AS a
RIGHT JOIN Inventory.Orders AS b 
ON a.grade IS NOT NULL
	AND a.customer_id = b.customer_id;

--correct solution
SELECT * 
FROM Inventory.Customer AS a
FULL JOIN Inventory.Orders AS b 
ON  a.customer_id = b.customer_id 
WHERE a.grade IS NOT NULL


--17


SELECT * 
FROM Inventory.Salesman AS a 
CROSS JOIN Inventory.Customer AS b


--18


--MINE INCORRECT .>>>> WEIRD QUESTOINS?j???j?j?jDLKJFHDSKJHGDSIPGHDSIP
SELECT * 
FROM Inventory.Salesman AS a 
CROSS JOIN Inventory.Customer AS b 
WHERE a.city = b.city

--CORRECT

SELECT * 
FROM Inventory.Salesman AS a 
CROSS JOIN Inventory.Customer AS b 
WHERE a.city IS NOT NULL;


--19


SELECT * 
FROM Inventory.Salesman AS a 
CROSS JOIN Inventory.Customer AS b 
WHERE a.city IS NOT NULL 
	AND b.grade IS NOT NULL


--20


SELECT * 
FROM Inventory.Salesman AS a 
CROSS JOIN Inventory.Customer AS b 
WHERE a.city IS NOT NULL 
	AND a.city <> b.city 
	AND b.grade IS NOT NULL


--21

CREATE TABLE company_mast(
COM_ID INT, 
COM_NAME VARCHAR(50)
);

INSERT INTO company_mast 
VALUES (11, 'Samsung'),
       (12, 'iBall'),
       (13, 'Epsion'),
       (14, 'Zebronics'),
       (15, 'Asus'),
       (16, 'Frontech')

SELECT * 
FROM company_mast AS a
JOIN item_mast AS b 
ON a.com_Id = b.pro_com



--22

--my is incorrect. but in question it says all the products thats why i chose the left join!
SELECT pro_name, pro_price, com_name 
FROM item_mast
LEFT JOIN company_mast ON item_mast.pro_com = company_mast.COM_ID

--solution
SELECT pro_name, pro_price, com_name 
FROM item_mast
JOIN company_mast ON item_mast.pro_com = company_mast.COM_ID


--23


SELECT AVG(pro_price) AS average_price, com_name 
FROM item_mast
JOIN company_mast ON item_mast.pro_com = company_mast.COM_ID
GROUP BY com_name


--24


SELECT AVG(pro_price) AS average_price, com_name 
FROM item_mast
JOIN company_mast ON item_mast.pro_com = company_mast.COM_ID
GROUP BY com_name
HAVING AVG(pro_price) >= 350


--25

--INCORRECT MY UNFINISHED
SELECT MAX(pro_price) AS MAXX, com_name 
FROM item_mast
JOIN company_mast ON item_mast.pro_com = company_mast.COM_ID
GROUP BY com_name



--THE SOLUTION
SELECT pro_name, pro_price, com_name
FROM item_mast
JOIN company_mast 
ON item_mast.pro_com = company_mast.COM_ID
AND pro_price =
   (
     SELECT MAX(pro_price)
     FROM item_mast
     WHERE pro_com = com_id
   );


--26


SELECT * 
FROM emp_details AS a 
JOIN emp_department AS b 
ON a.emp_dept = b.DPT_CODE


--27


SELECT emp_fname, emp_lname, dpt_name, DPT_ALLOTMENT
FROM emp_details AS a
JOIN emp_department AS b
ON a.emp_dept = b.DPT_CODE

--28


SELECT emp_fname AS "First Name", 
	   emp_lname AS "Last Name",
	   dpt_allotment
FROM emp_details AS a 
JOIN emp_department AS b 
ON a.emp_dept = b.DPT_CODE
WHERE b.DPT_ALLOTMENT > 50000


--29


SELECT  dpt_name, COUNT(dpt_name) AS numof_emp
FROM emp_details AS a
JOIN emp_department AS b
ON a.emp_dept = b.DPT_CODE
GROUP BY b.DPT_NAME
HAVING COUNT(dpt_name) > 2