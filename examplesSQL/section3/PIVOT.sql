SELECT
    Bikes,
    Clothing,
    Components,
    Accessories
FROM
    (
        SELECT
            D.Name AS ProductCategoryName,
            A.LineTotal
        FROM Sales.SalesOrderDetail A
                 JOIN Production.Product B
                      ON A.ProductID = B.ProductID
                 JOIN Production.ProductSubcategory C
                      ON B.ProductSubcategoryID = C.ProductSubcategoryID
                 JOIN Production.ProductCategory D
                      ON C.ProductCategoryID = D.ProductCategoryID
    ) A
    PIVOT(
             SUM(LineTotal)
             FOR ProductCategoryName IN(Bikes,Clothing,Components,Accessories)
         ) B



SELECT
    *
FROM
    (
        SELECT
            D.Name AS ProductCategoryName,
            A.LineTotal,
            A.OrderQty
        FROM Sales.SalesOrderDetail A
                 JOIN Production.Product B
                      ON A.ProductID = B.ProductID
                 JOIN Production.ProductSubcategory C
                      ON B.ProductSubcategoryID = C.ProductSubcategoryID
                 JOIN Production.ProductCategory D
                      ON C.ProductCategoryID = D.ProductCategoryID
    ) A
    PIVOT(
             SUM(LineTotal)
             FOR ProductCategoryName IN(Bikes,Clothing,Components,Accessories)
         ) B
ORDER BY OrderQty



