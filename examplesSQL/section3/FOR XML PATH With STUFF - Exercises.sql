-- Exercise 1
SELECT
    STUFF (
            (
                select
                        ',' + CAST(Name AS varchar)
                FROM Production.Product
                    FOR XML PATH('')
        ),
1,1,'');

SELECT
    pps.Name AS SubcategoryName,
    STUFF (
            (
                select
                        ',' + CAST(Name AS varchar)
                FROM Production.Product pp
                WHERE pp.ProductSubcategoryID = pps.ProductSubcategoryID
                    FOR XML PATH('')
        ),
1,1,'') AS Products
FROM Production.ProductSubcategory pps

-- Exercise 2
SELECT
    pps.Name AS SubcategoryName,
    STUFF (
            (
                select
                        ',' + CAST(Name AS varchar)
                FROM Production.Product pp
                WHERE pp.ProductSubcategoryID = pps.ProductSubcategoryID
                  AND pp.ListPrice > 50
                    FOR XML PATH('')
        ),
1,1,'') AS Products
FROM Production.ProductSubcategory pps