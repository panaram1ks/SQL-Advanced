--CTEs - Exercise
WITH OrderHeader AS (
    SELECT
        OrderDate
         ,OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1)
         ,TotalDue
         ,OrderRank = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC)
    FROM Sales.SalesOrderHeader
),
     Top10Orders AS (
         SELECT
             OrderMonth,
             TotalSales = SUM(TotalDue)
         FROM OrderHeader
         WHERE OrderRank > 10
         GROUP BY OrderMonth
     ),
     PurchaseHeader AS (
         SELECT
             OrderDate
              ,OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1)
              ,TotalDue
              ,OrderRank = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC)
         FROM Purchasing.PurchaseOrderHeader
     ),
     Top10Purchase AS (
         SELECT
             OrderMonth,
             TotalPurchases = SUM(TotalDue)
         FROM PurchaseHeader
         WHERE OrderRank > 10
         GROUP BY OrderMonth
     )

SELECT
    A.OrderMonth,
    A.TotalSales,
    B.TotalPurchases
FROM Top10Orders A
         JOIN Top10Purchase B
              ON A.OrderMonth = B.OrderMonth
ORDER BY 1



SELECT
    A.OrderMonth,
    A.TotalSales,
    B.TotalPurchases
FROM (
         SELECT
             OrderMonth,
             TotalSales = SUM(TotalDue)
         FROM (
                  SELECT
                      OrderDate
                       ,OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1)
                       ,TotalDue
                       ,OrderRank = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC)
                  FROM Sales.SalesOrderHeader
              ) S
         WHERE OrderRank > 10
         GROUP BY OrderMonth
     ) A

         JOIN (
    SELECT
        OrderMonth,
        TotalPurchases = SUM(TotalDue)
    FROM (
             SELECT
                 OrderDate
                  ,OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1)
                  ,TotalDue
                  ,OrderRank = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC)
             FROM Purchasing.PurchaseOrderHeader
         ) P
    WHERE OrderRank > 10
    GROUP BY OrderMonth
) B	ON A.OrderMonth = B.OrderMonth

ORDER BY 1