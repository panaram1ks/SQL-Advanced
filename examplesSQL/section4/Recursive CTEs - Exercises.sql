-- Exercise 1
WITH OddNumbers AS (
    SELECT 1 AS MyNumber

    UNION ALL

    SELECT
        (MyNumber + 1) AS MyNum
    FROM OddNumbers
)

SELECT MyNumber
FROM OddNumbers
WHERE (MyNumber % 2) = 0

-- Exercise 2
WITH Years29 AS (
    SELECT CAST(' 1/1/2020' AS DATE) AS MyDate

    UNION ALL

    SELECT
        DATEADD(MONTH, 1, MyDate)
    FROM Years29
)
SELECT MyDate FROM Years29
                       OPTION(MAXRECURSION 108 )

