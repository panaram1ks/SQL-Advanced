SELECT 
	SalesOrderID,
	OrderDate,
	CustomerID,
	TotalDue,
	LEAD(soh.TotalDue,1) OVER(ORDER BY soh.SalesOrderID) as NextTotalDue,
	LAG(soh.TotalDue,1) OVER(ORDER BY soh.SalesOrderID ) as PrevTotalDue
FROM Sales.SalesOrderHeader soh 
ORDER BY SalesOrderID


SELECT 
	CustomerID,
	SalesOrderID,
	OrderDate,	
	TotalDue,
	LEAD(soh.TotalDue,1) OVER(Partition by CustomerID ORDER BY soh.SalesOrderID) as NextTotalDue,
	LAG(soh.TotalDue,1) OVER(Partition by CustomerID ORDER BY soh.SalesOrderID) as PrevTotalDue
FROM Sales.SalesOrderHeader soh 
ORDER BY CustomerID, SalesOrderID