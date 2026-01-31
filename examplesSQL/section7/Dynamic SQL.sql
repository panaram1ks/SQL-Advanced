--SELECT TOP 100 * FROM Production.Product
DECLARE @DynamicSQL VARCHAR(MAX)
SET @DynamicSQL = 'SELECT TOP 100 * FROM Production.Product'

EXEC(@DynamicSQL)

-- SQL example
SELECT
    *
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


-- Dynamic SQL PROCEDURE

CREATE PROCEDURE dbo.DynamicTopN(@TopN INT, @AggFunction VARCHAR(50))
    AS
BEGIN
	DECLARE @DynamicSQL VARCHAR(MAX)

	SET @DynamicSQL = 'SELECT
	*
	FROM (
		SELECT
			ProductName = B.Name,
			LineTotalSum = '
	SET @DynamicSQL = @DynamicSQL + @AggFunction
	SET @DynamicSQL = @DynamicSQL + '(A.LineTotal),
			LineTotalSumRank = DENSE_RANK() OVER(ORDER BY '
	SET @DynamicSQL = @DynamicSQL + @AggFunction
	SET @DynamicSQL = @DynamicSQL + '(A.LineTotal) DESC)
		FROM Sales.SalesOrderDetail A
		JOIN Production.Product B
		ON A.ProductID = B.ProductID
		GROUP BY B.Name
	) X
	WHERE LineTotalSumRank <= '
	SET @DynamicSQL = @DynamicSQL + CAST(@TopN AS VARCHAR)

	--SELECT @DynamicSQL
	EXEC(@DynamicSQL)
END


EXEC dbo.DynamicTopN 5,'MIN'



