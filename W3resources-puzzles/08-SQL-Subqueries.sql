

--1  


SELECT * FROM Inventory.Orders
WHERE salesman_id = 
	(SELECT salesman_id 
	FROM Inventory.Salesman
	WHERE name = 'Paul Adam')


--2  


SELECT * FROM Inventory.orders
WHERE salesman_id IN (SELECT salesman_id
					 FROM Inventory.Salesman 
					 WHERE city = 'London')

--3



	SELECT * 
	FROM Inventory.Orders
	WHERE salesman_id = (SELECT DISTINCT salesman_id 
						 FROM Inventory.Orders
						 WHERE customer_id = 3007)

--4  


	SELECT * 
	FROM Inventory.Orders
	WHERE purch_amt > 
		(SELECT AVG(purch_amt)
		 FROM Inventory.Orders
		 WHERE ord_date = '2012-10-10')


--5  


	SELECT * 
	FROM Inventory.Orders
	WHERE salesman_id IN 
		(SELECT salesman_id 
		FROM Inventory.Salesman
		WHERE city = 'New York')
					

--6  


	SELECT commission
	FROM Inventory.Salesman
	WHERE salesman_id IN
		(SELECT salesman_id 
		FROM Inventory.Customer 
		WHERE city = 'Paris')


--7  


	SELECT * 
	FROM Inventory.Customer
	WHERE customer_id = 
		(SELECT salesman_id - 2001
		FROM Inventory.Salesman
		WHERE name = 'Mc Lyon')



--8  

	
	SELECT grade, COUNT(*) AS countt
	FROM Inventory.Customer
	group by grade
	HAVING grade > 
		(SELECT AVG(grade)
		FROM Inventory.Customer
		WHERE city = 'New York')
	

--9 
																  
	
	SELECT * 
	FROM Inventory.Orders
	WHERE salesman_id IN 
		(SELECT salesman_id 
		FROM Inventory.Salesman
		WHERE commission = 
			(SELECT MAX(commission)
			FROM Inventory.Salesman))
	

--10 


SELECT O.*, cust_name
FROM Inventory.Orders AS O, Inventory.Customer AS C
WHERE o.customer_Id = c.customer_id 
	AND o.ord_date = '2012-08-17'



--11 


--my solution
	SELECT salesman_id, name
	FROM Inventory.Salesman
	WHERE salesman_id IN
		(SELECT salesman_id 
		FROM Inventory.Customer
		GROUP BY salesman_id
		HAVING COUNT(*) > 1)


--Solution
	SELECT salesman_id, name 
	FROM Inventory.Salesman AS a
	WHERE 1 < 
		(SELECT COUNT(*)
		FROM Inventory.Customer
		WHERE salesman_id = a.salesman_id)


--12



--my solution
	SELECT * FROM Inventory.Orders
	WHERE purch_amt > 
		(SELECT AVG(purch_amt)
		FROM Inventory.Orders)

--- THERE IS A MISTAKE IN THE CUESTION. IT DIDN'T SAY THE CUSTOEMR'S ORDERS

--solution
	SELECT * FROM inventory.Orders a
	WHERE purch_amt >
		(SELECT AVG(purch_amt) FROM inventory.Orders b 
		 WHERE b.customer_id = a.customer_id);

--13


ORDER BY customer_id

	SELECT * FROM Inventory.orders AS a
	WHERE purch_amt >= 
		(SELECT AVG(purch_amt)
		 FROM Inventory.orders AS b
		 WHERE a.customer_id = b.customer_id)
	ORDER BY customer_id

--14 



SELECT ord_date, SUM(purch_amt)
FROM Inventory.Orders as a
GROUP BY ord_date 
HAVING SUM(purch_amt) > (SELECT MAX(purch_amt) + 1000
						 FROM Inventory.Orders as b
						 WHERE a.ord_date = b.ord_date)




--15 



SELECT * FROM inventory.Customer
WHERE EXISTS (SELECT * FROM inventory.Customer
			  WHERE city = 'London')


--16 



--my solution
SELECT * FROM Inventory.Salesman 
WHERE salesman_id IN (SELECT salesman_id 
					  FROM Inventory.Customer as a
					  WHERE 1 < (SELECT COUNT(*)
								 FROM Inventory.Customer as b
								 WHERE a.salesman_id = b.salesman_id))


--solution
SELECT * 
FROM inventory.Salesman 
WHERE salesman_id IN (
   SELECT DISTINCT salesman_id 
   FROM inventory.Customer a 
   WHERE EXISTS (
      SELECT * 
      FROM inventory.Customer b 
      WHERE b.salesman_id = a.salesman_id 
      AND b.cust_name <> a.cust_name
   )
);
--17 


--my solution
SELECT * FROM Inventory.Salesman 
WHERE salesman_id IN (SELECT salesman_id 
					  FROM Inventory.Customer as a
					  WHERE 1 = (SELECT COUNT(*)
								 FROM Inventory.Customer as b
								 WHERE a.salesman_id = b.salesman_id))


--solution
SELECT * 
FROM inventory.Salesman 
WHERE salesman_id IN (
   SELECT DISTINCT salesman_id 
   FROM inventory.Customer a 
   WHERE NOT EXISTS (
      SELECT * 
      FROM inventory.Customer b 
      WHERE b.salesman_id = a.salesman_id 
      AND b.cust_name <> a.cust_name
   )
);


--18 


--my solution
	SELECT * FROM Inventory.Salesman
	WHERE salesman_id in 
		(SELECT salesman_id
		FROM Inventory.Orders
		GROUP BY salesman_id, customer_id
		having COUNT(*) > 1)


--solution
	SELECT * 
	FROM inventory.Salesman a 
	WHERE EXISTS     
	   (SELECT * FROM inventory.Customer b     
		WHERE a.salesman_id = b.salesman_id     
		 AND 1 <             
			 (SELECT COUNT (*)              
			  FROM inventory.Orders             
			  WHERE orders.customer_id = b.customer_id));


--19 



	SELECT * FROM Inventory.Salesman
	WHERE city = ANY 
		(SELECT city 
		FROM Inventory.Customer)



--20 



	-- my solution.
	SELECT * FROM Inventory.Salesman a
	WHERE city = ANY 
		(SELECT city 
		FROM Inventory.Customer b
		WHERE a.salesman_id = b.salesman_id
			AND a.city = b.city)

	--solution
	SELECT * FROM Inventory.Salesman
	WHERE city = ANY 
		(SELECT city 
		FROM Inventory.Customer)

	--I didn't understand the question or the question is written wrong


--21 


	--my solution also correct
	SELECT * FROM Inventory.Salesman
	WHERE name < ANY
		(SELECT cust_name
		FROM Inventory.Customer)
	
	--solution
	SELECT * FROM Inventory.Salesman a
	WHERE EXISTS 
		(SELECT * FROM Inventory.Customer b
		WHERE a.name < b.cust_name)

--22 


	SELECT * FROM Inventory.Customer
	WHERE grade > ANY
		(SELECT grade 
		FROM Inventory.Customer
		WHERE city < 'New York')

--23 


	SELECT * FROM Inventory.Orders
	WHERE purch_amt > ANY
		(SELECT purch_amt FROM Inventory.Orders
		WHERE ord_date = '2012-09-10')

		(SELECT purch_amt FROM Inventory.Orders
		WHERE ord_date = '2012-09-10')


--24 



	--MY SOLUTION
	SELECT * FROM Inventory.Orders
	WHERE purch_amt < ANY 
		(SELECT purch_amt 
		FROM Inventory.Orders a
		WHERE EXISTS 
			(SELECT * 
			FROM Inventory.Customer b
			WHERE a.customer_id = b.customer_id 
			AND city = 'London'))

	-- solution same output
	SELECT *
	FROM inventory.Orders
	WHERE purch_amt < ANY
		(SELECT purch_amt
		FROM inventory.Orders a, Inventory.customer b
		WHERE  a.customer_id = b.customer_id
		AND b.city = 'London');


--25 


	--solution 1
	SELECT * FROM Inventory.Orders
	WHERE purch_amt < 
		(SELECT MAX(purch_amt)
		FROM Inventory.Orders
		WHERE customer_id in 
			(SELECT customer_id 
			FROM Inventory.Customer
			WHERE city = 'London'))

	-- solution 2
	SELECT * FROM Inventory.Orders
	WHERE purch_amt <
		(SELECT MAX(purch_amt)
		FROM Inventory.Orders a
		WHERE EXISTS 
			(SELECT customer_id 
			FROM Inventory.Customer b
			WHERE city = 'London'
			and a.customer_id = b.customer_id))

	-- site's solution
	SELECT * FROM Inventory.Orders
	WHERE purch_amt <
		(SELECT MAX(purch_amt)
		FROM Inventory.Customer b, Inventory.Orders a
		WHERE a.customer_id = b.customer_id
			AND b.city = 'London')


--26 



	SELECT * FROM Inventory.Customer 
	WHERE grade > ALL 
		(SELECT grade FROM Inventory.Customer
		WHERE city = 'New York')


--27 


	SELECT * FROM Inventory.Salesman
	SELECT * FROM Inventory.Customer
	--SELECT * FROM Inventory.Orders

	SELECT SUM(purch_amt) 
	FROM Inventory.Orders as a
	GROUP BY salesman_id
	HAVING Salesman_id IN 
		(SELECT a.salesman_id 
		FROM inventory.salesman as a, Inventory.Customer as b
		WHERE a.salesman_id = b.salesman_id
			AND a.city = b.city)



		
	  -- mine is incorrect
	SELECT	a.name, 
			a.city,
			(SELECT SUM(purch_amt)
			FROM Inventory.Orders c
			WHERE c.salesman_id = a.salesman_id) as summ
	FROM inventory.salesman as a, Inventory.Customer as b
	WHERE a.salesman_id = b.salesman_id
		AND a.city = b.city

	 -- solution 
	SELECT salesman.name, salesman.city, subquery1.total_amt
	FROM inventory.Salesman, 
		(SELECT salesman_id, SUM(orders.purch_amt) AS total_amt 
		FROM Inventory.Orders 
		GROUP BY salesman_id) subquery1
	WHERE subquery1.salesman_id = salesman.salesman_id
	AND salesman.city IN (SELECT DISTINCT city FROM inventory.Customer);

	

--28 

--uncompleted 

SELECT a.*
FROM Inventory.Customer as a, 
	(SELECT grade FROM Inventory.Customer 
	WHERE city = 'London') as b
WHERE a.grade not in (b.grade)


--solution

SELECT *
FROM inventory.Customer
WHERE grade <> ALL 
   (SELECT grade FROM inventory.Customer 
   WHERE city='London' AND NOT grade IS NULL);




--29 



SELECT * FROM Inventory.Customer
WHERE grade not in
	(SELECT grade FROM Inventory.Customer
	WHERE city = 'Paris')



--30 



SELECT * FROM Inventory.Customer
WHERE Not grade = ANY 
	(SELECT grade FROM Inventory.Customer
	WHERE city = 'Dallas')



--31 



	SELECT AVG(b.pro_price) as average, a.com_name
	FROM company_mast as a 
	JOIN item_mast as b ON a.com_id = b.pro_com
	GROUP BY com_name 



--32 



	SELECT AVG(b.pro_price) as average, a.com_name
	FROM company_mast as a 
	JOIN item_mast as b ON a.com_id = b.pro_com
	GROUP BY com_name 
	HAVING AVG(b.pro_price) >= 350


--33 


SELECT b.pro_name, b.pro_price, a.com_name
	FROM company_mast as a, item_mast as b
	where a.com_id = b.pro_com
		AND pro_price = 
		 (SELECT MAX(pro_price)
		 FROM item_mast as c 
		 WHERE c.pro_com = a.COM_ID )
	

--34 


	SELECT * 
	FROM emp_details
	WHERE emp_lname IN ('Gabriel', 'Dosio') 


		
--35 


	SELECT * 
	FROM emp_details
	WHERE emp_dept in (89, 63)


--36 




	SELECT emp_fname, emp_lname 
	FROM emp_details
	WHERE emp_dept in 
		(SELECT dpt_code 
		FROM emp_department
		WHERE DPT_ALLOTMENT > 5000)


--37 

	SELECT * 
	FROM emp_department
	WHERE DPT_ALLOTMENT > 
		(SELECT AVG(DPT_ALLOTMENT)
		FROM emp_department)


--38 
	-- mine
	SELECT * 
	FROM emp_department a
	WHERE 2 < 
		(SELECT COUNT(*)
		FROM emp_details b
		WHERE a.DPT_CODE = b.emp_dept)

		--
	SELECT dpt_name FROM emp_department
	  WHERE dpt_code IN
		  (SELECT emp_dept
		  FROM emp_details
		  GROUP BY emp_dept
		  HAVING COUNT(*) > 2);


--39 

-- my solution
	SELECT emp_fname, emp_lname
	FROM emp_department as a, emp_details as b
	WHERE a.DPT_CODE = b.emp_dept
		and a.DPT_ALLOTMENT = 
			(SELECT MIN(DPT_ALLOTMENT) 
			FROM emp_department a
			WHERE DPT_ALLOTMENT NOT IN 
				(SELECT MIN(DPT_ALLOTMENT)
				FROM emp_department))


-- solution
	SELECT emp_fname, emp_lname 
	FROM emp_details 
	WHERE emp_dept IN (
	  SELECT dpt_code
	  FROM emp_department 
	  WHERE dpt_allotment = (
		SELECT MIN(dpt_allotment)
		FROM emp_department 
		WHERE dpt_allotment > (
		  SELECT MIN(dpt_allotment) 
		  FROM emp_department )));

   
   
   























