SELECT
    *
FROM
    (
        SELECT
            sod.SalesOrderID ,
            sod.SalesOrderDetailID ,
            sod.LineTotal ,
            ROW_NUMBER() OVER(partition by SalesOrderID ORDER BY sod.LineTotal DESC) as LineTotalRanking
        FROM Sales.SalesOrderDetail sod
    ) tempTable
WHERE LineTotalRanking = 1