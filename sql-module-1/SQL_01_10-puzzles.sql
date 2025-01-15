
	DECLARE @birthdate DATE = '2000-12-17';

SELECT CASE
           WHEN MONTH(@birthdate) < MONTH(GETDATE()) 
                OR (MONTH(@birthdate) = MONTH(GETDATE()) 
				AND DAY(@birthdate) <= DAY(GETDATE())) 
               THEN DATEDIFF(YEAR, @birthdate, GETDATE())

           ELSE DATEDIFF(YEAR, @birthdate, GETDATE()) - 1
       END AS Age;



	
			
		--HOMEWORK 1--

	DECLARE @birth date = '2003-03-18'
	DECLARE @today date =  GETDATE()
	
	DECLARE @age INT = 
		(SELECT 
		  CASE
           WHEN MONTH(@birth) < MONTH(@today) 
                OR (MONTH(@birth) = MONTH(@today) 
				AND DAY(@birth) <= DAY(@today))
               THEN DATEDIFF(YEAR, @birth, @today)
           ELSE DATEDIFF(YEAR, @birth, @today) - 1
		   END AS Age)

	DECLARE @month INT =
	        (SELECT 
				CASE
					WHEN DAY(@birth) < DAY(@today)
				 OR DAY(@birth) = DAY(@today)
				 THEN datepart(month, @today) - datepart(month, @birth)
				 ELSE (datepart(month, @today) - datepart(month, @birth)) - 1
				 END AS 'Month')
	DECLARE @currentyearbirth date = dateadd(year,@age, @birth)


	SELECT @age AS Yosh,
		   @month AS Oy,
		   DATEDIFF(DAY,dateadd(month, @month, @currentyearbirth),@today) AS Kun
		   




		   --HOMEWORK 2--


SELECT * FROM CountSpaces

SELECT *, LEN(replace(texts,' ','1')) - LEN(REPLACE(texts,' ',''))
FROM countspaces


			--HOMEWORK 3--

--SUBSTRING(input_string , start, length)
--CHARINDEX ( expression_to_find , expression_to_search [ , start_location  ] )

SELECT name,  

SUBSTRING(name,1,charindex(',',name)-1) AS NAME,

SUBSTRING(name,charindex(',',name)+1, (LEN(name)-charindex(',',name))) AS SURNAME

FROM TestMultipleColumns
