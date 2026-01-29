--Starter code:
SELECT
    BusinessEntityID
     ,JobTitle
     ,VacationHours
     ,MaxVacationHours = (SELECT MAX(VacationHours) FROM HumanResources.Employee)
     ,PercentOfMaxVacationHours = (VacationHours * 1.0) / (SELECT MAX(VacationHours) FROM HumanResources.Employee)

FROM HumanResources.Employee

WHERE (VacationHours * 1.0) / (SELECT MAX(VacationHours) FROM HumanResources.Employee) >= 0.8

--Refactored code:
DECLARE @Employee INT = (SELECT MAX(VacationHours) FROM HumanResources.Employee)

SELECT
    BusinessEntityID
     ,JobTitle
     ,VacationHours
     ,MaxVacationHours = @Employee
     ,PercentOfMaxVacationHours = (VacationHours * 1.0) / @Employee
FROM HumanResources.Employee
WHERE (VacationHours * 1.0) / @Employee >= 0.8