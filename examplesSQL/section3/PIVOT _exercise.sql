--Exercise 1
SELECT
    *
FROM
    (
        SELECT
            JobTitle,
            VacationHours
        FROM HumanResources.Employee
    ) A
    PIVOT(
             AVG(VacationHours)
             FOR JobTitle IN([Sales Representative],[Buyer],[Janitor])
         ) B


--Exercise 2
SELECT
    Gender AS [Employee Gender],
[Sales Representative],
Buyer,
Janitor
FROM
    (
    SELECT
    JobTitle,
    VacationHours,
    Gender
    FROM HumanResources.Employee
    ) A
    PIVOT(
    AVG(VacationHours)
    FOR JobTitle IN ([Sales Representative],[Buyer],[Janitor])
    ) B