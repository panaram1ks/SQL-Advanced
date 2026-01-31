CREATE PROCEDURE dbo.Report(@TopN INT, @Type INT)
    AS
BEGIN
	IF 	@Type = 1
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

DROP PROCEDURE dbo.Report

    EXEC dbo.Report 5,2