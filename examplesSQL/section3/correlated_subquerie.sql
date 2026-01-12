SELECT
    soh.SalesOrderID ,
    soh.OrderDate ,
    soh.SubTotal ,
    soh.TaxAmt ,
    soh.Freight ,
    soh.TotalDue ,
    (
        SELECT
            COUNT(*)
        FROM Sales.SalesOrderDetail innerTable
        WHERE innerTable.SalesOrderID = soh.SalesOrderID
          AND innerTable.OrderQty > 1
    ) as MultiOrderCount
FROM Sales.SalesOrderHeader soh


SELECT
    sod.SalesOrderID ,
    sod.OrderQty
FROM Sales.SalesOrderDetail sod
WHERE sod.SalesOrderID = 43660