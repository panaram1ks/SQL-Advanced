SELECT 
	SalesOrderID ,
	SalesOrderDetailID ,
	LineTotal ,
	ROW_NUMBER() OVER(Partition by SalesOrderID ORDER BY LineTotal DESC) as Ranking,
	FIRST_VALUE(LineTotal) OVER(Partition by SalesOrderID Order by LineTotal DESC) as Highest,
	FIRST_VALUE(LineTotal) OVER(Partition by SalesOrderID Order by LineTotal ASC) as Lowest
FROM Sales.SalesOrderDetail
ORDER BY SalesOrderID , LineTotal DESC


-- Customer orders by date
SELECT 
	CustomerID,
	OrderDate,
	TotalDue,
	FIRST_VALUE(soh.TotalDue ) OVER(Partition by soh.CustomerID Order by soh.OrderDate ) as FirstOrderAmount
FROM Sales.SalesOrderHeader soh 
ORDER BY CustomerID, OrderDate