-- Exercise 1
SELECT
    pp.Name,
    pps.Name as ProductSubcategory,
    ppc.Name as ProductCategory
FROM Production. ProductSubcategory pps
         inner JOIN Production.Product pp
                    on pp.ProductSubcategoryID = pps.ProductSubcategoryID
         inner JOIN Production.ProductCategory ppc
                    on pps.ProductCategoryID  = ppc.ProductCategoryID

-- Exercise 2
SELECT
    pp.Name,
    pps.Name as ProductSubcategory,
    ppc.Name as ProductCategory,
    AVG(ListPrice) OVER() as AvgPriceByCategory
FROM Production. ProductSubcategory pps
         inner JOIN Production.Product pp
                    on pp.ProductSubcategoryID = pps.ProductSubcategoryID
         inner JOIN Production.ProductCategory ppc
                    on pps.ProductCategoryID  = ppc.ProductCategoryID

-- Exercise 3
SELECT
    pp.Name,
    pps.Name as ProductSubcategory,
    ppc.Name as ProductCategory,
    AVG(ListPrice) OVER() as AvgPriceByCategory,
    AVG(ListPrice) OVER(partition by ppc.Name, pps.Name) as AvgPriceByCategoryAndSubcategory
FROM Production. ProductSubcategory pps
         inner JOIN Production.Product pp
                    on pp.ProductSubcategoryID = pps.ProductSubcategoryID
         inner JOIN Production.ProductCategory ppc
                    on pps.ProductCategoryID  = ppc.ProductCategoryID

-- Exercise 4
SELECT
    pp.Name,
    pps.Name as ProductSubcategory,
    ppc.Name as ProductCategory,
    AVG(ListPrice) OVER() as AvgPriceByCategory,
    ListPrice,
    AVG(ListPrice) OVER(partition by ppc.Name, pps.Name) as AvgPriceByCategoryAndSubcategory,
    pp.ListPrice - AVG(ListPrice) OVER(partition by ppc.Name, pps.Name) as ProductVsCategoryDelta
FROM Production. ProductSubcategory pps
         inner JOIN Production.Product pp
                    on pp.ProductSubcategoryID = pps.ProductSubcategoryID
         inner JOIN Production.ProductCategory ppc
                    on pps.ProductCategoryID  = ppc.ProductCategoryID
