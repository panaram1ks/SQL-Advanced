SELECT
    SalesOrderID,
    OrderDate,
    DueDate,
    ShipDate,
    ElapsedBusinessDays = (
        SELECT
            COUNT(*)
        FROM dbo.Calendar B
        WHERE B.DateValue BETWEEN A.OrderDate AND A.ShipDate
          AND B.WeekendFlag = 0
          AND B.HolidayFlag = 0
    )
FROM Sales.SalesOrderHeader A
WHERE YEAR(A.OrderDate) = 2012


CREATE FUNCTION dbo.ufnElapsedBusinessDays(@StartDate DATE, @EndDate DATE)
    RETURNS INT
AS
BEGIN
RETURN (
           SELECT
               COUNT(*)
           FROM dbo.Calendar
           WHERE DateValue BETWEEN @StartDate AND @EndDate
             AND WeekendFlag = 0
             AND HolidayFlag = 0
       )
END


SELECT
    SalesOrderID,
    OrderDate,
    DueDate,
    ShipDate,
    ElapsedBusinessDays = dbo.ufnElapsedBusinessDays(A.OrderDate , A.ShipDate)
FROM Sales.SalesOrderHeader A
WHERE YEAR(A.OrderDate) = 2012
  AND dbo.ufnElapsedBusinessDays(A.OrderDate , A.ShipDate) != 0

