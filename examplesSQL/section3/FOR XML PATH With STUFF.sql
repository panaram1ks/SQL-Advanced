SELECT
    STUFF(
            (
                select
                        ',' + CAST(CAST(sod.LineTotal AS MONEY) AS varchar)
                from Sales.SalesOrderDetail sod
                where sod.SalesOrderID  = 43659
                    FOR XML PATH('')
        ),
1,1,'');


SELECT
    soh.SalesOrderID ,
    soh.OrderDate ,
    soh.SubTotal ,
    soh.TaxAmt ,
    soh.Freight ,
    soh.TotalDue ,
    STUFF(
            (
                select
                        ',' + CAST(CAST(sod.LineTotal AS MONEY) AS varchar)
                from Sales.SalesOrderDetail sod
                where sod.SalesOrderID  = soh.SalesOrderID
                    FOR XML PATH('')
        ),
1,1,'') as LineTotals
FROM Sales.SalesOrderHeader soh