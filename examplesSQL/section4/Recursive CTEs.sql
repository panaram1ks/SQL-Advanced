WITH NumberSeries AS (
    SELECT  1 AS MyNumber

    UNION ALL

    SELECT
            MyNumber + 1
    FROM NumberSeries
    WHERE MyNumber < 50
)

SELECT
    MyNumber
FROM NumberSeries
