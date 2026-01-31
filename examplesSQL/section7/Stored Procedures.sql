CREATE PROCEDURE dbo.OrdersReport
    AS
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
WHERE LineTotalSumRank <= 10
END

ALTER PROCEDURE dbo.OrdersReport(@TopN INT)
    AS
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


EXEC dbo.OrdersReport 7


