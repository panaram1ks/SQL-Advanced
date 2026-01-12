-- Exercise 1
SELECT
    YEAR(OrderDate) as OrderYear,
    MONTH(OrderDate) as OrderMonth,
    SUM(SubTotal)
FROM Purchasing.PurchaseOrderHeader poh
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY YEAR(OrderDate), MONTH(OrderDate)


-- Exercise 2
SELECT
    OrderYear,
    OrderMonth,
    Sum,
    SUM(Sum) OVER(ORDER BY X.OrderYear, X.OrderMonth ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) as Rolling3MonthTotal
FROM(
        SELECT
            YEAR(OrderDate) as OrderYear,
            MONTH(OrderDate) as OrderMonth,
            SUM(SubTotal) as Sum
        FROM Purchasing.PurchaseOrderHeader poh
        GROUP BY YEAR(OrderDate), MONTH(OrderDate)
    ) X
ORDER BY OrderYear, OrderMonth


-- Exercise 3
SELECT
    OrderYear,
    OrderMonth,
    Sum,
    AVG(Sum) OVER(ORDER BY X.OrderYear, X.OrderMonth ROWS BETWEEN 7 PRECEDING AND 1 PRECEDING) as MovingAvg6Month
FROM(
        SELECT
            YEAR(OrderDate) as OrderYear,
            MONTH(OrderDate) as OrderMonth,
            SUM(SubTotal) as Sum
        FROM Purchasing.PurchaseOrderHeader poh
        GROUP BY YEAR(OrderDate), MONTH(OrderDate)
    ) X
ORDER BY OrderYear, OrderMonth


-- Exercise 4
SELECT
    OrderYear,
    OrderMonth,
    Sum,
    SUM(Sum) OVER(ORDER BY X.OrderYear, X.OrderMonth ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) as MovingAvgNext2Months
FROM(
        SELECT
            YEAR(OrderDate) as OrderYear,
            MONTH(OrderDate) as OrderMonth,
            SUM(SubTotal) as Sum
        FROM Purchasing.PurchaseOrderHeader poh
        GROUP BY YEAR(OrderDate), MONTH(OrderDate)
    ) X
ORDER BY OrderYear, OrderMonth