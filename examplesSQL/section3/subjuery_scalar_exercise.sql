-- Exercise 1
SELECT
    BusinessEntityID,
    JobTitle,
    VacationHours,
    (SELECT MAX(VacationHours) FROM HumanResources.Employee) as MaxVacationHours
FROM HumanResources.Employee he

-- Exercise 2
SELECT
    BusinessEntityID,
    JobTitle,
    VacationHours,
    (SELECT MAX(VacationHours) FROM HumanResources.Employee) as MaxVacationHours,
    FORMAT(he.VacationHours * 1.0 / (SELECT MAX(VacationHours) FROM HumanResources.Employee), 'P2') as PercentOfMaxHours
FROM HumanResources.Employee he

-- Exercise 3
SELECT
    BusinessEntityID,
    JobTitle,
    VacationHours,
    (SELECT MAX(VacationHours) FROM HumanResources.Employee) as MaxVacationHours,
    FORMAT(he.VacationHours * 1.0 / (SELECT MAX(VacationHours) FROM HumanResources.Employee), 'P2') as PercentOfMaxHours
FROM HumanResources.Employee he
WHERE (he.VacationHours * 1.0 / (SELECT MAX(VacationHours) FROM HumanResources.Employee)) >= 0.80