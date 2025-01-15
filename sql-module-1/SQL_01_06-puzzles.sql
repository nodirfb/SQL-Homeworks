
--CREATE TABLE #Cart1
--(
--    Item  VARCHAR(100) PRIMARY KEY
--);

--CREATE TABLE #Cart2
--(
--    Item  VARCHAR(100) PRIMARY KEY
--);

--INSERT INTO #Cart1 (Item) 
--VALUES
--    ('Sugar'),('Bread'),('Juice'),('Soda'),('Flour');

--INSERT INTO #Cart2 (Item) 
--VALUES
--    ('Sugar'),('Bread'),('Butter'),('Cheese'),('Fruit');

--SELECT * FROM #cart1
--SELECT * FROM #cart2

------------------------------------

--declare @max int = 100, @min int = 1

--create table Nums(value int)

--while @min <= @max
--begin
--  insert into Nums
--  values(@min)

--  set @min = @min + 1
--end

--create table Employees(id int, fname varchar(25), lname varchar(25))

--insert into Employees
--values (1, 'John', 'Doe'),
--     (2, 'Mark', 'Frazier'),
--     (3, 'Jeff', 'Charles')



-----SOLUTION FOR HOMEWOR 1------

SELECT * 
FROM #cart1 as a 
FULL JOIN #cart2 as b ON a.Item = b.Item

-----SOLUTION FOR HOMEWOR 2------

SELECT id, fname, lname, value
FROM nums AS a 
CROSS JOIN Employees AS b 
where a.value <= 5
ORDER BY b.id





