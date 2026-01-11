-- Exercise 1, Exercise 2, Exercise 3
SELECT
    pp.Name as ProductName,
    ppc.Name as ProductCategory,
    pps.Name as ProductSubcategory,
    ListPrice,
    ROW_NUMBER() OVER(ORDER BY ListPrice DESC) as 'Price Rank',
        ROW_NUMBER() OVER(Partition by ppc.Name ORDER BY ListPrice DESC) AS 'Category Price Rank',
        CASE
            WHEN ROW_NUMBER() OVER(Partition by ppc.Name ORDER BY ListPrice DESC) <= 5 THEN 'Yes'
            ELSE 'No'
            END as 'Top 5 Price In Category',
    RANK() OVER(Partition by ppc.Name ORDER BY ListPrice DESC) as rank,
    DENSE_RANK() OVER(Partition by ppc.Name ORDER BY ListPrice DESC) as dense_rank 
FROM Production.ProductSubcategory pps
         inner JOIN Production.Product pp
                    ON pps.ProductSubcategoryID = pp.ProductSubcategoryID
         inner JOIN  Production.ProductCategory ppc
                     ON pps.ProductCategoryID  = ppc.ProductCategoryID