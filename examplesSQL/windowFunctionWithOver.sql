SELECT
    BusinessEntityID,
    TerritoryID,
    SalesYTD,
    sum(SalesYTD) over() as SUM,
    MAX(SalesYTD) over() as MAX,
    SalesYTD / MAX(SalesYTD) over() as '% of Best Performer'
FROM [Sales].[SalesPerson]