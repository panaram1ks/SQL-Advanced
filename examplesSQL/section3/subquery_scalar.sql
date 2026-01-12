SELECT
    p.ProductID ,
    p.Name ,
    p.StandardCost ,
    p.ListPrice ,
    (SELECT AVG(ListPrice) FROM Production.Product) as AvgPrice,
    p.ListPrice - (SELECT AVG(ListPrice) FROM Production.Product) as AvgPriceDiff
FROM Production.Product p
WHERE p.ListPrice > (SELECT AVG(ListPrice) FROM Production.Product)
ORDER BY p.ProductID