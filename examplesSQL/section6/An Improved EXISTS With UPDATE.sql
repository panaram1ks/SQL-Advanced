SELECT
    A.SalesOrderID ,
    A.OrderDate ,
    A.TotalDue
FROM Sales.SalesOrderHeader A
WHERE EXISTS(
              SELECT 1
              FROM Sales.SalesOrderDetail B
              WHERE A.SalesOrderID = B.SalesOrderID
                AND B.LineTotal > 10000
          )
ORDER BY 1


CREATE TABLE #Sales
(
    SalesOrderID INT,
    OrderDate DATE,
    TotalDue MONEY,
    LineTotal MONEY
)
INSERT INTO #Sales
(
    SalesOrderID,
    OrderDate,
    TotalDue
)
SELECT
    SalesOrderID,
    OrderDate,
    TotalDue
FROM Sales.SalesOrderHeader

         UPDATE A
SET LineTotal = B.LineTotal
FROM #Sales A
JOIN Sales.SalesOrderDetail B
ON A.SalesOrderID = B.SalesOrderID
WHERE B.LineTotal > 10000

SELECT * FROM #Sales WHERE LineTotal IS NOT NULl




