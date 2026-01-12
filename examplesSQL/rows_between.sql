SELECT
    OrderDate,
    TotalDue,
    SalesLast3Days = SUM(TotalDue) OVER(ORDER BY X.OrderDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
FROM (
         SELECT
             OrderDate,
             TotalDue = SUM(TotalDue)
         FROM Sales.SalesOrderHeader soh
         WHERE YEAR(soh.OrderDate) = 2014
         GROUP BY soh.OrderDate
     )X



SELECT
    OrderDate,
    TotalDue,
    SalesLast4DaysExeptCurrentDay = SUM(TotalDue) OVER(ORDER BY X.OrderDate ROWS BETWEEN 3 PRECEDING AND 1 PRECEDING)
FROM (
         SELECT
             OrderDate,
             TotalDue = SUM(TotalDue)
         FROM Sales.SalesOrderHeader soh
         WHERE YEAR(soh.OrderDate) = 2014
         GROUP BY soh.OrderDate
     )X



SELECT
    OrderDate,
    TotalDue,
    SalesPreviousCurrentAnd1NextDay = SUM(TotalDue) OVER(ORDER BY X.OrderDate ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
FROM (
         SELECT
             OrderDate,
             TotalDue = SUM(TotalDue)
         FROM Sales.SalesOrderHeader soh
         WHERE YEAR(soh.OrderDate) = 2014
         GROUP BY soh.OrderDate
     )X



SELECT
    OrderDate,
    TotalDue,
    SalesPreviousCurrentAnd1NextDay = AVG(TotalDue) OVER(ORDER BY X.OrderDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
FROM (
         SELECT
             OrderDate,
             TotalDue = SUM(TotalDue)
         FROM Sales.SalesOrderHeader soh
         WHERE YEAR(soh.OrderDate) = 2014
         GROUP BY soh.OrderDate
     )X
