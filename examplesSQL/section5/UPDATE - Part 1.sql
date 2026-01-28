CREATE TABLE #SalesOrders
(
    SalesOrderId INT,
    OrderDate DATE,
    TaxAmt MONEY,
    Freight MONEY,
    TotalDue MONEY,
    TaxFreightPercent FLOAT,
    TaxFreightBucket VARCHAR(32),
    OrderAmtBucket VARCHAR(32),
    OrderCategory VARCHAR(32),
    OrderSubcategory VARCHAR(32)
    )

INSERT INTO #SalesOrders (
    SalesOrderId,
    OrderDate,
    TaxAmt,
    Freight,
    TotalDue,
    OrderCategory
)
SELECT
    SalesOrderId,
    OrderDate,
    TaxAmt,
    Freight,
    TotalDue,
    OrderCategory = 'Non-holiday Order'
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2013

--select * from #SalesOrders
SELECT 	TaxFreightPercent = (TaxAmt + Freight)/TotalDue FROM #SalesOrders

UPDATE #SalesOrders
SET TaxFreightPercent = (TaxAmt + Freight)/TotalDue,
    OrderAmtBucket =
CASE
	WHEN TotalDue < 100 THEN 'Small'
	WHEN TotalDue < 1000 THEN 'Medium'
	ELSE 'Large'
END


select * from #SalesOrders


