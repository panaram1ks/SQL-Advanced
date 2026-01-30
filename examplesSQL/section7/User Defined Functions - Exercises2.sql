CREATE FUNCTION dbo.ufnPercentOfVacationHours(@VacationHours INT)
    RETURNS VARCHAR(32)
BEGIN
RETURN FORMAT(@VacationHours / CAST((select max(VacationHours) from HumanResources.Employee) AS FLOAT) , 'P')
END

DROP FUNCTION dbo.ufnPercentOfVacationHours

SELECT
    BusinessEntityID,
    JobTitle,
    VacationHours,
    dbo.ufnPercentOfVacationHours(VacationHours) AS VacationPercent
--	MaxVacationHours = (select max(VacationHours) from HumanResources.Employee)
FROM HumanResources.Employee



