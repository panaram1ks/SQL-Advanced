SELECT
    ProductID,
    OrderQty,
    SUM(LineTotal)
FROM Sales.SalesOrderDetail
GROUP BY ProductID, OrderQty
ORDER BY 1, 2


SELECT
    ProductID,
    SalesOrderID,
    SalesOrderDetailID,
    OrderQty,
    UnitPrice,
    UnitPriceDiscount,
    LineTotal,
    SUM(LineTotal) over(partition by [ProductID] , [OrderQty])as ProductIDLineTotal
FROM Sales.SalesOrderDetail
ORDER BY ProductID, OrderQty DESC