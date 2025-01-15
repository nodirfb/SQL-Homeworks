
-- //////////------Homework 1------////////// --

--create table Friends (
--	col1 varchar(20),
--	col2 varchar(20)
--	);

--insert into Friends 
--values  ('John','Bob'),
--		('Bob','Rich'),
--		('Ann','John'),
--		('Ann','Rob')


SELECT col1, count (col1) AS num_friends
FROM (

SELECT col1
FROM friends
union all
SELECT col2
FROM friends

) AS [count friends]
GROUP BY col1;

SELECT * FROM friends

--SELECT col1, col2 
--FROM friends
--UNION ALL
--SELECT col2, col1 
--FROM friends

-- //////////------Homework 2------////////// --

--create table max_value  (
--	col1 int, 
--	col2 int,
--	col3 int
--	);

--insert into max_value 
--values (40,30,60),
--	   (20,15,42),
--	   (50,33,23),
--	   (25,40,35);

--select * from max_value


SELECT
	CASE
		WHEN col1 > col2 and col1 > col3 THEN col1
		WHEN col2 > col1 and col2 > col3 THEN col2
		ELSE col3
	END as max_val
FROM max_value;


SELECT
	IIF(col1 > col2 and col1 > col3, col1, 
	IIF(col2 > col1 and col2 > col3, col2, col3)) AS max_val
FROM max_value;

-- //////////------Homework 3------////////// --

--Write a query which will find maximum value from multiple columns of the table.

--CREATE TABLE TestMax
--(
--    Year1 INT
--    ,Max1 INT
--    ,Max2 INT
--    ,Max3 INT
--)
 
--INSERT INTO TestMax 
--VALUES
--    (2001,10,101,87)
--    ,(2002,103,19,88)
--    ,(2003,21,23,89)
--    ,(2004,27,28,91)

SELECT * FROM TestMax

SELECT 
	Year1, 
	CASE
		WHEN max1 > max2 AND max1 > max3 THEN max1
		WHEN max2 > max1 AND max2 > max3 THEN max2
		ELSE max3
		END as max_val
FROM TestMax;