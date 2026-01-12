-- Exercise 1
SELECT 
	BusinessEntityID as EmployeeID,
	JobTitle,
	HireDate,
	VacationHours,
	FIRST_VALUE(VacationHours) OVER(Partition by JobTitle Order by VacationHours DESC) as FirstHireVacationHours
FROM HumanResources.Employee
Order by JobTitle, HireDate ASC


-- Exercise 2
SELECT 
	pp.ProductID,
	Name as ProductName,
	pplph.ListPrice,
	pplph.ModifiedDate,
	FIRST_VALUE(pplph.ListPrice) OVER(PARTITION BY pp.ProductID ORDER BY pplph.ListPrice Desc) as HighestPrice,
	FIRST_VALUE(pplph.ListPrice) OVER(PARTITION BY pp.ProductID ORDER BY pplph.ListPrice ASC) as LowestCost,
	(FIRST_VALUE(pplph.ListPrice) OVER(PARTITION BY pp.ProductID ORDER BY pplph.ListPrice Desc) 
	- 
	FIRST_VALUE(pplph.ListPrice) OVER(PARTITION BY pp.ProductID ORDER BY pplph.ListPrice ASC))as PriceRange
FROM Production.ProductListPriceHistory  pplph
 JOIN Production.Product pp
ON pp.ProductID = pplph.ProductID
ORDER BY pp.ProductID, pplph.ModifiedDate