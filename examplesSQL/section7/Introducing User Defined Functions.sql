CREATE FUNCTION dbo.ufnCurrentDate()
    RETURNS DATE
AS
BEGIN
RETURN CAST(GETDATE() AS DATE)
END


SELECT
    SalesOrderID,
    OrderDate,
    DueDate,
    ShipDate,
    dbo.ufnCurrentDate() AS Today
FROM Sales.SalesOrderHeader A
WHERE YEAR(A.OrderDate) = 2011
