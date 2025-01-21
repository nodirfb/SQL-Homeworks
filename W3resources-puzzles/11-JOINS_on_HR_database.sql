




--1  


SELECT e.first_name, e.last_name, e.department_id, d.department_name 
FROM hr.Employees as e
JOIN hr.departments as d ON E.department_id = D.department_id








--2



SELECT e.first_name, e.last_name, d.department_name, l.city, l.state_province 
FROM hr.Employees as e
JOIN hr.Departments as d ON E.department_id = D.department_id
JOIN hr.Locations as l ON d.location_id = l.location_id







--3





SELECT e.first_name, e.last_Name, e.salary, jg.grade_level
FROM hr.Employees as e
JOIN hr.Job_Grades as jg ON E.salary >= jg.lowest_sal and E.salary <= JG.highest_sal





--4




SELECT E.first_name, E.last_name, e.department_id, d.department_name
FROM hr.Employees AS e
JOIN hr.Departments AS d ON e.department_id = d.department_id
WHERE E.department_id IN (80,40)





--5


SELECT E.first_name, E.last_name, D.department_name, L.city, L.state_province
FROM hr.Employees as e 
JOIN hr.Departments as d  on e.department_id = d.department_id
JOIN hr.Locations as l on D.location_id = L.location_id
WHERE e.first_name LIKE '%z%'





--6


SELECT E.first_name, E.last_name, D.department_id, D.department_name
FROM hr.departments as d
LEFT JOIN hr.employees as e ON d.department_id = e.department_id








--7



SELECT a.first_name, a.last_name, a.salary
FROM hr.Employees as a
join hr.Employees as b
ON a.salary < b.salary and b.employee_id = 182 



--8



SELECT e.first_name as employee,  m.first_name as manager
FROM hr.Employees as e
JOIN hr.Employees as m ON E.manager_id = m.employee_id




--9



SELECT d.department_name, l.city, l.state_province 
FROM hr.Departments as d 
JOIN hr.Locations as l ON d.location_id = l.location_id






--10



SELECT e.first_name,	e.last_name,	e.department_id,	d.department_name
FROM hr.employees as e
LEFT JOIN hr.departments as d ON E. department_id = d.department_id







--11





select E.first_name as employee, M.first_name as manager
FROM hr.Employees as E
LEFT JOIN hr.Employees as M ON E.manager_id = M.employee_id





--12


SELECT a.first_name, a.last_name, a.department_id 
FROM hr.Employees as a
JOIN hr.employees as b
ON a.department_id = b.department_id
and b.last_name = 'Taylor'









--13




SELECT j.job_title, d.department_name, CONCAT(e.first_name,' ' ,e.last_name) AS employee_name, jh.start_date
FROM hr.Job_History as jh
JOIN hr.jobs AS j ON jh.job_id = j.job_id 
JOIN  hr.Employees as e ON jh.employee_id = e. employee_id
JOIn hr.Departments as d ON jh.department_id = d.department_id
WHERE jh.start_date BETWEEN  '1983-01-01' AND '1997-08-31'






--14



SELECT j.job_title, CONCAT(e.first_name,' ' ,e.last_name)AS employee_name, j.max_salary - e.salary as salary_difference
FROM hr.Employees as e
JOIN hr.jobs as j ON e.job_id =j.job_id







--15



SELECT d.department_name, avg(salary)AS avg, count(E.commission_pct)as count
FROM hr.Employees as e
JOIN hr.Departments as d ON e.department_id = d.department_id
GROUP BY d.department_name



--16





SELECT j.job_title, CONCAT(e.first_name,' ' ,e.last_name)AS employee_name,  j.max_salary - e.salary as salary_difference
FROM hr.Employees as e
JOIN hr.jobs as j ON e.job_id = j.job_id
WHERE e.department_id = 80





--17




SELECT C.country_name, l.city, d.department_name
FROM hr.Countries as c
JOIN hr.Locations as l ON c.country_id = l.country_id
JOIN hr.Departments as d ON d.location_id = l.location_id






--18


SELECT d.department_name,CONCAT(e.first_name,' ' ,e.last_name)AS employee_name
FROM hr.Departments as d
JOIN hr.Employees as e ON d.manager_id = e.employee_id








--19




SELECT j.job_title, avg(salary) AVG
FROM hr.Employees as e
JOIN hr.jobs as j ON e.job_id = j.job_id
GROUP BY j.job_title





--20




SELECT e.employee_id, jh.start_date, jh.end_date, jh.job_id, jh.department_id, e.salary
FROM hr.Employees as e
JOIN hr.Job_History as jh ON e.employee_id = jh.employee_id
WHERE e.salary >= 12000





--21



SELECT C.country_name, l.city, count(*) as COUNT
FROM hr.departments AS d
LEFT join hr.Locations as l ON l.location_id = d.location_id
JOIN hr.Countries as c ON l.country_id = c.country_id
WHERE d.department_id IN (SELECT  department_id
						  FROM hr.Employees AS E
						  GROUP BY department_id
						  HAVING count(*) >= 2)
GROUP BY c.country_name, l.city



--22



SELECT D.department_name, CONCAT(e.first_name,' ' ,e.last_name)AS manager_name, l.city
FROM hr.Departments AS d
JOIN hr.Employees as e ON d.manager_id = e.employee_id
JOIN hr.Locations as l ON l.location_id = d.location_id



--23




select jh.employee_id, j.job_title, DATEDIFF(DAY, jh.start_date, jh.end_date) AS days
from hr.jobs as j
join hr.Job_History as jh
ON j.job_id = jh.job_id
WHERE jh.department_id = 80



--24




SELECT  CONCAT(e.first_name,' ' ,e.last_name)AS employee_name, e.salary, l.city
FROM hr.Employees as e
JOIN hr.Departments as d ON e.department_id = d.department_id
JOIN hr.Locations AS l ON l.location_id = d.location_id
WHERE l.city = 'London'






--25



SELECT CONCAT(e.first_name,' ' ,e.last_name)AS employee_name, jh.employee_id, j.job_title, jh.start_date, jh.end_date
FROM hr.Employees AS e 
JOIN (SELECT employee_id, min(start_date) start_date ,max(end_date)as end_date
	  FROM hr.Job_History
	  group by employee_id) as jh 
ON jh.employee_id = e.employee_id

JOIN hr.jobs as j ON J.job_id = E.job_id AND E.commission_pct = 0.00








--26




SELECT d.department_name, count(*) as no_of_employees,	d.department_id
FROM hr.Departments as d
JOIN hr.Employees as e ON d.department_id = e.department_id
GROUP BY d.department_name, d.department_id





--27

SELECT  CONCAT(e.first_name,' ' ,e.last_name)AS employee_name, e.employee_id, c.country_name
FROM hr.Employees as e
JOIN hr.Departments as d ON  e.department_id = d.department_id
JOIN hr.Locations as l ON d.location_id = l.location_id
JOIN hr.Countries as c on l.country_id = c.country_id









