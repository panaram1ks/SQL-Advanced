SELECT
    sod.SalesOrderID ,
    sod.SalesOrderDetailID ,
    sod.LineTotal ,
    SUM(sod.LineTotal) OVER(Partition by sod.SalesOrderID)as ProductIDLineTotal,
    ROW_NUMBER() OVER(Partition by sod.SalesOrderID ORDER BY LineTotal)as Ranking
FROM Sales.SalesOrderDetail sod
--ORDER BY sod.SalesOrderID