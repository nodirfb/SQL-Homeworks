

--- PUZZLE 1-------------------------------------
CREATE table findGaps (num int);
 
insert into findGaps
select 1 union all
select 2 union all
select 3 union all
select 6 union all
select 8 union all
select 11 union all
select 12 union all
select 13 union all
select 15 union all
select 17 union all
select 28;



--SOLUTION
WITH a AS (
	SELECT num, 
		   num -1 as minus1,
		   num + 1 as plus1 
	FROM findGaps
), b AS (
	SELECT num, 
		   LAG(plus1) OVER(order by num) GapStart,
		   minus1 as GapEnd
	FROM a
)
SELECT GapStart, GapEnd
from b
WHERE num <> GapStart






---PUZZLE 2-------------------------------------


CREATE TABLE MyTable (
    Id int,
    rID int,
    Vals int
);

INSERT INTO MyTable
    VALUES (121, 9, 1)
    , (121, 9, 8)
    , (122, 9, 14)
    , (122, 9, 0)
    , (122, 9, 1)
    , (123, 9, 1)
    , (123, 9, 2)
    , (123, 9, 10)

	

	;
	--SOLUTION 1
	WITH cte AS (
		SELECT *, 
			   MAX(Vals) OVER(PARTITION BY id ORDER BY VALS ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS maxVals
		FROM MyTable
	), cte2 as(
		SELECT DISTINCT id, rid, maxVals
		FROM cte
	)
	SELECT COUNT(id) AS distinct_Ids, 
		   rid, 
		   SUM(maxvals) AS totalOfMaxVals
	FROM cte2
	GROUP BY rid




	--SOLUTION 2
	SELECT count(id) as distinct_ids , rid, Sum(maxVals) as totalOfMaxVals from (
		SELECT id, rid, max(vals) as maxVals
		FROM MyTable
		GROUP BY id, rid
	) as dv
	GROUP BY rid