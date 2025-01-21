


--1 


SELECT * FROM hr.Employees
WHERE salary < 6000



--2


SELECT * FROM hr.Employees
WHERE salary > 8000


--3


SELECT * FROM hr.Employees
WHERE last_name = 'McEwen'



--4



SELECT * FROM hr.Employees
WHERE department_id is null


--5



SELECT * FROM hr.departments
WHERE department_name = 'Marketing';



--6

SELECT * FROM hr.Employees
WHERE first_name not like '%m%'
ORDER BY department_id


--7


SELECT * FROM hr.Employees
WHERE (salary between 8000 and 12000 
	AND commission_pct is not null)
	AND (hire_date > '1987-06-05'
	AND department_id not in (40, 120, 70))




--8



SELECT * FROM hr.Employees
WHERE commission_pct is null



--9



SELECT first_name + ' ' + last_name as full_name,
	   phone_number + ' - ' + email as contact_details, 
	   salary as remuneration
	   FROM hr.Employees
WHERE salary between 9000 and 17000


--10



SELECT * FROM hr.Employees
WHERE first_name like '%m'


--11


SELECT  first_name + ' ' + last_name as name, salary FROM hr.Employees
WHERE salary not between 7000 and 15000
ORDER BY name	


--12



SELECT first_name + ' ' + last_name as name, 
		job_id, hire_date
FROM hr.Employees
WHERE hire_date between '2007-11-05' and '2009-07-05'



--13



SELECT first_name + ' ' + last_name as name, 
	   department_id
FROM hr.Employees
WHERE department_id IN (70, 90)

--14



SELECT first_name + ' ' + last_name as name, 
	   salary, 
	   manager_id
FROM hr.Employees
WHERE manager_id IS NOT NULL



--15



SELECT * FROM hr.Employees
WHERE hire_date < '2002-06-21'



--16


SELECT first_name, last_name, email, salary, manager_id
FROM hr.Employees
WHERE manager_id in (120, 103, 145)

--17


SELECT * FROM hr.Employees
WHERE first_name LIKE '%[D,S,N]%'
ORDER BY salary DESC;




--18


SELECT first_name + ' ' + last_name as name, 
	   hire_date, 
	   commission_pct, 
	   email, 
	   phone_number + ' - ' + email as contact_details, 
	   salary
FROM hr.Employees
WHERE salary > 11000 
	OR phone_number LIKE '______3%'
ORDER BY first_name DESC


--19


SELECT first_name, last_name, department_id FROM hr.Employees
WHERE first_name like '__s%'



--20


SELECT employee_id, first_name, job_id, department_id FROM hr.Employees
WHERE department_id not in (50, 30, 80);



--21



SELECT employee_id, first_name, job_id, department_id FROM hr.Employees
WHERE department_id in (40, 30, 90);


--22


SELECT employee_id FROM hr.Job_History
GROUP BY employee_id
HAVING count(*) >= 2



--23


SELECT job_id, COUNT(*) countt , SUM(salary) summ, MAX(salary) - MIN(salary) salary_difference FROM hr.Employees
GROUP BY job_id



--24


SELECT job_id FROM hr.Job_History
WHERE DATEDIFF(day,start_date,end_date) > 300
GROUP BY job_id
HAVING count(*) >= 2


--25


SELECT country_id, count(*) FROM hr.Locations
GROUP BY country_id



--26

SELECT manager_id, count(*) FROM hr.Employees
GROUP BY manager_id




--27



SELECT * FROM hr.Jobs
ORDER BY job_title DESC


--28

SELECT first_name, last_name, hire_date FROM hr.Employees
WHERE job_id IN ('SA_MAN', 'SA_REP')


--29


SELECT department_id, avg(salary) FROM hr.Employees
WHERE commission_pct is not null
GROUP BY department_id


--30


SELECT DISTINCT department_id FROM hr.Employees
GROUP BY manager_id, department_id
HAVING COUNT(*) > 4



--31



SELECT DISTINCT department_id FROM hr.Employees
WHERE commission_pct is not null
GROUP BY department_id
HAVING COUNT(*) > 10



--32


SELECT employee_id, Max(end_date)as maxx FROM hr.Job_History
WHERE end_date is not null
GROUP BY employee_id
having count(*) > 1


--33



SELECT * FROM hr.Employees
WHERE commission_pct is null 
	  and salary between 7000 and 12000 
	  and department_id = 50


--34


SELECT job_id, AVG(salary) FROM hr.Employees
GROUP BY job_id
HAVING AVG(salary) > 8000


--35


SELECT job_title, max_salary - min_salary FROM hr.Jobs
WHERE max_salary between 12000 and 18000



--36



SELECT first_name, last_name FROM hr.Employees
WHERE first_name like 'D%'
	or last_name like 'D%'


--37


SELECT * FROM hr.Jobs
WHERE min_salary > 9000



--38


SELECT * FROM hr.Employees
WHERE hire_date > '1987-09-07'


















































	