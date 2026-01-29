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

TRUNCATE TABLE dbo.Calendar
SELECT * FROM dbo.Calendar
;

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

-- INSERT INTO dbo.Calendar
-- (
--     DateValue,
--     DayOfWeekNumber,
--     DayOfWeekName,
--     DayOfMounthNumber,
--     MonthNumber,
--     YearNumber,
--     WeekendFlag,
--     HolidayFlag
-- )
-- VALUES
--     (CAST('01-01-2025' AS DATE),7, 'Saturday',1,1,2011,1,1),
--     (CAST('02-01-2025' AS DATE),1, 'Sunday',2,2,2011,0,0)


