CREATE TABLE #Sales
(
    OrderDate DATETIME
    ,OrderMonth DATE
    ,TotalDue MONEY
    ,OrderRank INT
)

INSERT INTO #Sales (
                    OrderDate
                   ,OrderMonth
                   ,TotalDue
                   ,OrderRank
)
SELECT
    OrderDate
     ,OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1)
     ,TotalDue
     ,OrderRank = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC)
FROM Sales.SalesOrderHeader

SELECT * FROM #Sales

--DROP TABLE #Sales


DROP TABLE #Purchases

CREATE TABLE #Purchases (
                            OrderMonth DATE,
                            TotalSales INT
)

INSERT INTO #Purchases
(
    OrderMonth,
    TotalSales
)
SELECT
    OrderMonth,
    TotalSales = SUM(TotalDue)
FROM #Sales
WHERE OrderRank > 10
GROUP BY OrderMonth

SELECT * FROM #Purchases