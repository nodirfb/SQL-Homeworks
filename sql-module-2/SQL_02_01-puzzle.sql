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



	/*Question: 
		From the Employees table below, 
	
	PER department compare the salaries of employees who 
	were hired first with ones who were hired last 
	and show the difference.*/

	-- FIND employees who were hired first WITH MIN()
	-- FIND employees who were hired last WITH MAX()
  


SELECT *
FROM Employees

WITH a AS (

	SELECT Department_id, 
		   MIN(hire_date)as minDate, 
		   MAX(hire_date) as maxDate
	FROM employees 
	GROUP BY Department_id
)
SELECT a.*,
	   e1.salary as minDateSalary, 
	   e2.salary as	maxDateSalary, 
	   e1.salary - e2.salary as difference
FROM a
JOIN employees as e1 ON a.department_id = e1.department_id AND a.mindate = e1.hire_date
JOIN employees as e2 ON a.department_id = e2.department_id AND a.maxdate = e2.hire_date
order by a.department_id





