DECLARE @MyVar INT = 11
--SET @MyVar = 11
SELECT @MyVar



           DECLARE @MinPrice MONEY
SET @MinPrice = 1000

SELECT
    *
FROM  Production.Product
WHERE ListPrice  >= @MinPrice


SELECT
    ProductID
     ,[Name]
     ,StandardCost
     ,ListPrice
     ,AvgListPrice = (SELECT AVG(ListPrice) FROM AdventureWorks2019.Production.Product)
     ,AvgListPriceDiff = ListPrice - (SELECT AVG(ListPrice) FROM AdventureWorks2019.Production.Product)

FROM AdventureWorks2019.Production.Product

WHERE ListPrice > (SELECT AVG(ListPrice) FROM AdventureWorks2019.Production.Product)

ORDER BY ListPrice ASC




--Rewritten with variables:
DECLARE @AvgPrice MONEY = (SELECT AVG(ListPrice) FROM Production.Product)

SELECT
    ProductID
     ,[Name]
     ,StandardCost
     ,ListPrice
     ,AvgListPrice = @AvgPrice
     ,AvgListPriceDiff = ListPrice - @AvgPrice
FROM Production.Product
WHERE ListPrice > @AvgPrice
ORDER BY ListPrice ASC



