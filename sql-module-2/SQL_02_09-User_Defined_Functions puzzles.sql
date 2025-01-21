

--Puzzles are based on AdventureWorks database and custom tables

--Puzzle 1 


--Create a function that Finds total sales for a given product category
--using the tables in Production and Sales schemas


ALTER FUNCTION totalSalesByCategory (@category varchar(50))
RETURNS TABLE
AS 
RETURN SELECT 
		pc.ProductCategoryID, 
		pc.Name as Category, 
		CAST(SUM(sod.LineTotal)AS DECIMAL(10,2)) totalSales
		--sod.SalesOrderID, 
		--p.ProductID,
		--p.Name 
		--p.ProductSubcategoryID
		--ps.Name
	   FROM Production.Product AS p	                                                                 -- [ProductID]   [ProductSubcategoryID]
	   LEFT JOIN Production.ProductSubcategory AS ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
	   LEFT JOIN Production.ProductCategory AS pc ON pc.ProductCategoryID = ps.ProductCategoryID
	   JOIN Sales.SalesOrderDetail AS sod ON sod.ProductID = p.ProductID
	   GROUP BY pc.ProductCategoryID, pc.Name
	   HAVING pc.Name = @category


SELECT * FROM totalSalesByCategory('bikes')

		--Accessories
		--Bikes
	    --Clothing
		--Components

--Puzzle 1.1 (Use the above function with the following 
--SELECT statement to obtain total sales for each category)


 -- gpt solution 
SELECT pc.ProductCategoryID,
       pc.Name AS CategoryName,
       sales.TotalSales
FROM AdventureWorks2019.Production.ProductCategory AS pc
OUTER APPLY totalSalesByCategory(pc.Name) AS sales





--Puzzle 2:  ??????????????????????????


--Create a scalar function that returns top selling product name for a given
--product category using Production and Sales schemas.

CREATE FUNCTION topSellingProductName();

		--pc.ProductCategoryID, 
		--pc.Name as Category, 
		--CAST(SUM(sod.LineTotal)AS DECIMAL(10,2)) totalSales
		--sod.SalesOrderID, 
		--p.ProductSubcategoryID
		--ps.Name

	   SELECT top(1)	p.ProductID,
		p.Name , 
		count(*)as numOfProductSold
	   FROM Production.Product AS p	                                                                 
	   LEFT JOIN Production.ProductSubcategory AS ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
	   LEFT JOIN Production.ProductCategory AS pc ON pc.ProductCategoryID = ps.ProductCategoryID
	   JOIN Sales.SalesOrderDetail AS sod ON sod.ProductID = p.ProductID
	   WHERE PC.ProductCategoryID = 1
	   GROUP BY  p.ProductID, p.Name
	  ORDER BY count(*) DESC, ProductID 
	




--Use the obtained function in the following select statement 

select ProductCategoryID,Name
from Production.ProductCategory




--Puzzle 3:



--Create a table valued function that returns top selling product name and 
--price of that product for a given product category using 
--Production and Sales schemas.

;
	 CREATE FUNCTION topSellingProduct (@category varchar(50))
	 RETURNS TABLE
	 AS
	 RETURN 
	 WITH cte AS(
	   SELECT top(1)  p.ProductID, p.Name ,count(*)as numOfProductSold
	   FROM Production.Product AS p	                                                                 
	   LEFT JOIN Production.ProductSubcategory AS ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
	   LEFT JOIN Production.ProductCategory AS pc ON pc.ProductCategoryID = ps.ProductCategoryID
	   JOIN Sales.SalesOrderDetail AS sod ON sod.ProductID = p.ProductID
	   WHERE PC.Name = @category
	   GROUP BY  p.ProductID, p.Name
	   ORDER BY numOfProductSold desc
	  ) SELECT cte.*  , pp.ListPrice FROM cte 
	  JOIN Production.Product as pp ON cte.ProductID = pp.ProductID


	  SELECT * FROM topSellingProduct('Bikes')
	   --Accessories
		--Bikes
	    --Clothing
		--Components



--Use the obtained function in the following select statement 
select ProductCategoryID, pp.Name, smth.*
from Production.ProductCategory as pp
OUTER APPLY dbo.topSellingProduct(pp.name) as smth



--Puzzle 4: ?????????????



--Create a function that returns most common keyword in bad reviews (Rating 1,2)
--for a given ProductID
--Use the obtained function to get most common bad keyword for each product.
--(Optional)--If the top keyword is useless or an insignificant word then ignore it and get the next
--(Optional)--one based on popularity










---Puzzle 5: ?????????????




--Create a scalar function that returns top selling product name 
--for a given country and state within that country 
--Use that function to get the top selling products for every state or province
--in the following SELECT statement

select 
	CR.Name as Country,
	SP.Name as [State/Province]
from Person.StateProvince as SP 
left join Sales.SalesTerritory as ST on SP.TerritoryID=ST.TerritoryID
left join Person.CountryRegion as CR on CR.CountryRegionCode=SP.CountryRegionCode




