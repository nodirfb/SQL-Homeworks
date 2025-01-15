
--1--
SELECT testid,
	   SUM(IIF(score < 70, 1, 0)) AS Low,
	   SUM(IIF(score BETWEEN 70 AND 85, 1, 0)) AS Medium, 
	   SUM(IIF(score > 85, 1, 0)) AS High
FROM stats.scores
GROUP BY testid


--2--

CREATE TABLE ProductSales (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    SaleDate DATE,
    QuantitySold INT
);

ALTER TABLE ProductSales
DROP CONSTRAINT PK__ProductS__B40CC6ED726FA280

-- Sample data for ProductSales
INSERT INTO ProductSales VALUES (1, 'ProductA', '2022-01-01', 100);
INSERT INTO ProductSales VALUES (2, 'ProductB', '2022-01-02', 150);
INSERT INTO ProductSales VALUES (1, 'ProductA', '2023-01-01', 120);
INSERT INTO ProductSales VALUES (2, 'ProductB', '2023-01-02', 200);
INSERT INTO ProductSales VALUES (1, 'ProductA', '2024-01-01', 130);
INSERT INTO ProductSales VALUES (2, 'ProductB', '2024-01-02', 180);

SELECT * FROM productsales

SELECT ProductID, 
	   ProductName, 
	   [2022],[2023],[2024]
FROM (
	  SELECT ProductID, 
			 ProductName, 
			 YEAR(SaleDate) as kkk, 
			 QuantitySold
	  FROM ProductSales) AS SourceTable
PIVOT(sum(quantitySold) for kkk IN ([2022],[2023],[2024])) AS Ptable
