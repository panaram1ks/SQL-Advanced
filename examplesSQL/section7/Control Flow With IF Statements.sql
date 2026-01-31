DECLARE @MyInput INT

SET @MyInput = 4

IF @MyInput > 1
BEGIN
SELECT 'Hello World'
END
ELSE
BEGIN
SELECT 'Goodbye World'
END

DROP PROCEDURE dbo.OrdersReport

CREATE PROCEDURE dbo.OrdersReport(@TopN INT, @OrderType INT)
    AS
BEGIN

	IF @OrderType = 1
BEGIN
SELECT *
FROM (
         SELECT
             ProductName = B.Name,
             LineTotalSum = SUM(A.LineTotal),
             LineTotalSumRank = DENSE_RANK() OVER(ORDER BY SUM(A.LineTotal) DESC)
         FROM Sales.SalesOrderDetail A
                  JOIN Production.Product B
                       ON A.ProductID = B.ProductID
         GROUP BY B.Name
     ) X
WHERE LineTotalSumRank <= @TopN
END
ELSE
BEGIN
SELECT *
FROM (
         SELECT
             ProductName = B.Name,
             LineTotalSum = SUM(A.LineTotal),
             LineTotalSumRank = DENSE_RANK() OVER(ORDER BY SUM(A.LineTotal) DESC)
         FROM Purchasing.PurchaseOrderDetail A
                  JOIN Production.Product B
                       ON A.ProductID = B.ProductID
         GROUP BY B.Name
     ) X
WHERE LineTotalSumRank <= @TopN
END

END

EXEC dbo.OrdersReport 5,2
