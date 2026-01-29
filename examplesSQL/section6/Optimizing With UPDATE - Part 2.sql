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


CREATE TABLE #Sales2012
(
    SalesOrderID INT,
    OrderDate DATE
)

INSERT INTO #Sales2012
(
    SalesOrderID,
    OrderDate
)
SELECT
    SalesOrderID,
    OrderDate
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2012


CREATE TABLE #ProductSold2012 (
                                  SalesOrderID INT,
                                  OrderDate DATE,
                                  LineTotal MONEY,
                                  ProductID INT,
                                  ProductName VARCHAR(64),
    ProductSubcategoryID INT,
    ProductSubcategory VARCHAR(64),
    ProductCategoryID INT,
    ProductCategory VARCHAR(64)
    )

SELECT * FROM #Sales2012;

INSERT INTO #ProductSold2012 (
    SalesOrderID,
    OrderDate,
    LineTotal,
    ProductID
)
SELECT
    A.SalesOrderID,
    A.OrderDate,
    LineTotal,
    ProductID
FROM #Sales2012 A
    JOIN Sales.SalesOrderDetail B
ON A.SalesOrderID = B.SalesOrderID

SELECT * FROM #ProductSold2012
--TRUNCATE TABLE #ProductSold2012

UPDATE A
SET ProductName = B.Name,
    ProductSubcategoryID = B.ProductSubcategoryID
FROM #ProductSold2012 A
    JOIN Production.Product B
ON A.ProductID  = B.ProductID

UPDATE A
SET ProductSubcategory = B.Name,
    ProductCategoryID = B.ProductCategoryID
FROM #ProductSold2012 A
    JOIN Production.ProductSubcategory B
ON A.ProductSubcategoryID = B.ProductSubcategoryID

UPDATE A
SET ProductCategory = B.Name
FROM #ProductSold2012 A
    JOIN Production.ProductCategory B
ON A.ProductCategoryID = B.ProductCategoryID
