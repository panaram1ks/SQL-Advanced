SELECT * FROM Sales.SalesOrderHeader soh  Where soh.SalesOrderID = 43683

SELECT  * FROM Sales.SalesOrderDetail sod Where sod.SalesOrderDetailID = 43683


SELECT
    soh.SalesOrderID ,
    soh.OrderDate ,
    soh.TotalDue ,
    sod.SalesOrderDetailID ,
    sod.LineTotal
FROM Sales.SalesOrderHeader soh
         INNER JOIN Sales.SalesOrderDetail sod
                    ON soh.SalesOrderID  = sod.SalesOrderID
WHERE sod.LineTotal > 10000
ORDER BY 1

-- Example: Using exists to pick only the records we need
SELECT
    soh.SalesOrderID ,
    soh.OrderDate ,
    soh.TotalDue
FROM Sales.SalesOrderHeader soh
WHERE EXISTS (
        SELECT 1 FROM Sales.SalesOrderDetail sod WHERE sod.LineTotal > 10000 AND sod.SalesOrderID = soh.SalesOrderID
    )
  AND  soh.SalesOrderID = 43659
ORDER BY 1


SELECT
    soh.SalesOrderID ,
    soh.OrderDate ,
    soh.TotalDue ,
    sod.SalesOrderDetailID ,
    sod.LineTotal
FROM Sales.SalesOrderHeader soh
         INNER JOIN Sales.SalesOrderDetail sod
                    ON soh.SalesOrderID  = sod.SalesOrderID
WHERE sod.LineTotal < 10000
  AND soh.SalesOrderID = 43683
ORDER BY 1

SELECT
    soh.SalesOrderID ,
    soh.OrderDate ,
    soh.TotalDue
FROM Sales.SalesOrderHeader soh
WHERE NOT EXISTS (
        SELECT 1 FROM Sales.SalesOrderDetail sod
        WHERE sod.LineTotal > 10000
          AND sod.SalesOrderID = soh.SalesOrderID
    )
--AND  soh.SalesOrderID = 43659
ORDER BY 1
