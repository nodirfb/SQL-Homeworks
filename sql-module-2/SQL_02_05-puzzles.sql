-- Homework 1: Use a Temporary Table
-- Create a temporary table to store employees hired in the last year and their department names.
-- Then return the contents of the temporary table.
---------------------------------------------------------------------------------------------
-- Homework 2: Advanced Stored Procedure
-- Create a stored procedure that assigns an employee to a project.
-- Input: EmployeeID, ProjectID, HoursWorked
-- Output: Success/Failure Message
----------------------------------------------------------------------------------------------
-- Homework 3: Create a View for Analysis
-- Create a view that lists all active projects (projects that have not ended yet)
-- and the number of employees assigned to each project
----------------------------------------------------------------------------------------------------------------
--Homework 4:
--- write a query to check number is perfect or not



-- Homework 1:----------------------------------------------------------------------------------------------------------------
-- Homework 1: Use a Temporary Table
-- Create a temporary table to store employees hired in the last year and their department names.
-- Then return the contents of the temporary table.

--Solution 1
CREATE TABLE #employees (
	name nvarchar(50), 
	hiredate date, 
	departmentName nvarchar(50)
	)
INSERT INTO #employees 
VALUES('Alice', '2020-02-20', 'Hr'),
	  ('Bob', '2021-12-10', 'Marketing'),
	  ('Dan', '2021-03-11', 'Finance')

SELECT * FROM #employees


--Solution 2
CREATE TABLE #employees (
	name nvarchar(50), 
	hiredate date, 
	departmentName nvarchar(50)
	)
SELECT Name, HireDate, departmentName
INTO #employees
FROM Employees
WHERE HireDate >= DATEADD(YEAR, -1, GETDATE());

SELECT * FROM #employees


-- Homework 2:----------------------------------------------------------------------------------------------------------------
-- Homework 2: Advanced Stored Procedure
-- Create a stored procedure that assigns an employee to a project.
-- Input: EmployeeID, ProjectID, HoursWorked
-- Output: Success/Failure Message

CREATE PROCEDURE spAssignEmployee
@employeeid int, 
@projectid int, 
@hourworked int,
@result nvarchar(20) OUTPUT
AS 
BEGIN

INSERT INTO Employees(EmployeeID)
VALUES (@employeeid)

INSERT INTO EmployeeProjects(EmployeeID, ProjectID, HoursWorked)
VALUES (@employeeid, @projectid, @hourworked)

IF EXISTS (SELECT EmployeeID 
	       FROM EmployeeProjects 
		   WHERE EmployeeID = @employeeid)
 set @result = 'Success'
ELSE 
 set @result = 'FAILURE'
END
	


DECLARE @outResult nvarchar(20)
EXECUTE spAssignEmployee
@employeeid = 110, 
@projectid  = 202,
@hourworked = 90,
@result = @outResult output
print @outputresult


SELECT * FROM Employees
SELECT * FROM EmployeeProjects


-- Homework 3:----------------------------------------------------------------------------------------------------------------
-- Homework 3: Create a View for Analysis
-- Create a view that lists all active projects (projects that have not ended yet)
-- and the number of employees assigned to each project

CREATE VIEW vwCountEmployeesInActiveProjects
AS
SELECT p.ProjectName, COUNT(e.EmployeeID) as numberOfEmployees 
FROM Employees AS e
JOIN EmployeeProjects AS ep ON e.EmployeeID =ep.EmployeeID
JOIN Projects AS p on p.projectid = ep.projectid and p.EndDate is null
GROUP BY p.ProjectName

SELECT * FROM vwCountEmployeesInActiveProjects



--SELECT e.EmployeeID, e.Name, p.ProjectName
--FROM Employees AS e
--JOIN EmployeeProjects AS ep ON e.EmployeeID =ep.EmployeeID
--JOIN Projects AS p on p.projectid = ep.projectid and p.EndDate is null



-- Homework 4:----------------------------------------------------------------------------------------------------------------
--Homework 4:
--- write a query to check number is perfect or not

/*
Definition: A perfect number is a positive integer where 
the sum of its proper divisors (excluding the number itself) 
equals the number itself. 

Here are some perfect numbers: 
6, 28, 496, 8128, 33550336, 8589869056, 137438691328 .... */

declare @number int = 28
declare @cnt int = 1
declare @sumdivisors int = 0

WHILE @cnt < @number
BEGIN 
IF (@number % @cnt) = 0 
	SET @sumdivisors = @sumdivisors + @cnt
SET @cnt = @cnt + 1
END

print CONCAT('The sum of the divisors of ', @number, ' is ', @sumdivisors)
IF @sumdivisors = @number
	PRINT CONCAT(@number, ' is a Perfect number')
ELSE 
	PRINT CONCAT(@number, ' is NOT a Perfect number') 
	     

----------------------------------------------------------------------------------------------------









