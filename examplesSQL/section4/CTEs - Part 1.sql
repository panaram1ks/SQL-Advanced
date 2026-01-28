SELECT
    A.OrderMonth ,
    A.Top10Due ,
    B.Top10Due AS PrevTop10Due
FROM
    (
        SELECT
            X.OrderMonth,
            SUM(X.TotalDue) AS Top10Due
        FROM
            (
                SELECT
                    soh.OrderDate ,
                    soh.TotalDue ,
                    DATEFROMPARTS(YEAR(soh.OrderDate),MONTH(soh.OrderDate), 1) AS OrderMonth,
                    ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(soh.OrderDate),MONTH(soh.OrderDate), 1) ORDER BY soh.TotalDue DESC) AS OrderRunk
                FROM Sales.SalesOrderHeader soh
            ) X
        WHERE X.OrderRunk <= 10
        GROUP BY X.OrderMonth
    ) A
        LEFT JOIN
    (
        SELECT
            X.OrderMonth,
            SUM(X.TotalDue) AS Top10Due
        FROM
            (
                SELECT
                    soh.OrderDate ,
                    soh.TotalDue ,
                    DATEFROMPARTS(YEAR(soh.OrderDate),MONTH(soh.OrderDate), 1) AS OrderMonth,
                    ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(soh.OrderDate),MONTH(soh.OrderDate), 1) ORDER BY soh.TotalDue DESC) AS OrderRunk
                FROM Sales.SalesOrderHeader soh
            ) X
        WHERE X.OrderRunk <= 10
        GROUP BY X.OrderMonth
    ) B
    ON A.OrderMonth = DATEADD(MONTH, 1, B.OrderMonth )
ORDER BY A.OrderMonth
