SELECT
    soh.OrderDate ,
    soh.TotalDue ,
    DATEFROMPARTS(YEAR(soh.OrderDate),MONTH(soh.OrderDate), 1) AS OrderMonth,
    ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(soh.OrderDate),MONTH(soh.OrderDate), 1) ORDER BY soh.TotalDue DESC) AS OrderRunk
INTO #TempSales
FROM Sales.SalesOrderHeader soh

SELECT
    OrderMonth,
    SUM(TotalDue) AS Top10Due
INTO #Top10
FROM #TempSales
WHERE OrderRunk <= 10
GROUP BY OrderMonth

SELECT
    A.OrderMonth ,
    A.Top10Due ,
    B.Top10Due AS PrevTop10Due
FROM #Top10 A
    LEFT JOIN #Top10 B
ON A.OrderMonth = DATEADD(MONTH, 1, B.OrderMonth )
ORDER BY A.OrderMonth

DROP TABLE #TempSales
DROP TABLE #Top10