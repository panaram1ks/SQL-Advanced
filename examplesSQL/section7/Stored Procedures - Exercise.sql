CREATE PROCEDURE dbo.OrdersAboveThreshold(@Threshold MONEY, @StartYear INT, @EndYear INT)
    AS
BEGIN
SELECT * FROM (
                  SELECT
                      ProductID,
                      ModifiedDate,
                      LineTotal
                  FROM Sales.SalesOrderDetail
                  WHERE LineTotal <= @Threshold
                    AND (YEAR(ModifiedDate) BETWEEN @StartYear AND @EndYear)
              ) X
ORDER BY ProductID
END


EXEC dbo.OrdersAboveThreshold 50,2012,2013