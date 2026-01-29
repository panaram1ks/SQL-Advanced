CREATE TABLE dbo.Calendar
(
    DateValue DATE,
    DayOfWeekNumber INT,
    DayOfWeekName VARCHAR(32),
    DayOfMounthNumber INT,
    MonthNumber INT,
    YearNumber INT,
    WeekendFlag TINYINT,
    HolidayFlag TINYINT
)
--TRUNCATE TABLE dbo.Calendar


WITH Dates AS
         (
             SELECT CAST('01-01-2012' AS DATE) AS MyDate

             UNION ALL

             SELECT DATEADD(DAY,1,MyDate)
             FROM Dates
             WHERE MyDate < '2026-12-31'
         )

INSERT INTO dbo.Calendar(DateValue)
SELECT MyDate FROM Dates
                       OPTION(MAXRECURSION 10000)

UPDATE dbo.Calendar
SET
    DayOfWeekNumber = DATEPART(WEEKDAY, DateValue),
    DayOfWeekName = FORMAT(DateValue, 'dddd'),
    DayOfMounthNumber = DAY(DateValue),
    MonthNumber = MONTH(DateValue),
    YearNumber = YEAR(DateValue)

UPDATE dbo.Calendar
SET
    WeekendFlag =
        CASE
            WHEN DayOfWeekName IN ('Saturday', 'Sunday') THEN 1
            ELSE 0
            END

UPDATE dbo.Calendar
SET
    HolidayFlag =
        CASE
            WHEN DayOfMounthNumber = 1 AND MonthNumber = 1 THEN 1
            ELSE 0
            END

-- Exercise 1
UPDATE dbo.Calendar
SET
    HolidayFlag =
        CASE
            WHEN MonthNumber = 12 AND DayOfMounthNumber = 31 THEN 1
            ELSE 0
            END

SELECT * FROM dbo.Calendar;


SELECT
    A.*
FROM Sales.SalesOrderHeader A
         JOIN dbo.Calendar B
              ON A.OrderDate  = B.DateValue
WHERE B.WeekendFlag = 1

-- Exercise 2
SELECT
    A.*
FROM Sales.SalesOrderHeader A
         JOIN dbo.Calendar B
              ON A.OrderDate  = B.DateValue
WHERE B.HolidayFlag = 1

-- Exercise 3
SELECT
    A.*
FROM Sales.SalesOrderHeader A
         JOIN dbo.Calendar B
              ON A.OrderDate  = B.DateValue
WHERE B.HolidayFlag = 1
   OR B.WeekendFlag = 1




