SELECT
    A.SalesOrderID
     ,A.OrderDate
     ,B.ProductID
     ,B.LineTotal
     ,C.Name AS ProductName
     ,D.Name AS ProductSubcategory
     ,E.Name AS ProductCategory
FROM Sales.SalesOrderHeader A
         JOIN Sales.SalesOrderDetail B
              ON A.SalesOrderID  = B.SalesOrderID
         JOIN Production.Product C
              ON B.ProductID  = C.ProductID
         JOIN Production.ProductSubcategory D
              ON C.ProductSubcategoryID = D.ProductSubcategoryID
         JOIN Production.ProductCategory E
              ON D.ProductCategoryID = E.ProductCategoryID

WHERE YEAR(A.OrderDate) = 2012