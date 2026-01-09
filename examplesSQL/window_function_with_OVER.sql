-- Exercise 1
-- 1)
SELECT
    FirstName,
    LastName
FROM Person.Person

-- 2)
SELECT
    JobTitle
FROM HumanResources.Employee

-- 3,4)
SELECT
    Rate,
    AVG(Rate) OVER()
FROM HumanResources.EmployeePayHistory

-- 5)
SELECT
    FirstName,
    LastName,
    JobTitle,
    Rate,
    AVG(Rate) OVER()
FROM Person.Person pe
         join HumanResources.Employee he
              on pe.BusinessEntityID = he.BusinessEntityID
         join HumanResources.EmployeePayHistory hre
              on pe.BusinessEntityID = hre.BusinessEntityID

-- Exercise 2
SELECT
    FirstName,
    LastName,
    JobTitle,
    Rate,
    AVG(Rate) OVER(),
    MAX(Rate) OVER() as MaximumRate
FROM Person.Person pe
         join HumanResources.Employee he
              on pe.BusinessEntityID = he.BusinessEntityID
         join HumanResources.EmployeePayHistory hre
              on pe.BusinessEntityID = hre.BusinessEntityID

-- Exercise 3
SELECT
    FirstName,
    LastName,
    JobTitle,
    Rate,
    AVG(Rate) OVER(),
    MAX(Rate) OVER() as MaximumRate,
    Rate - AVG(Rate) OVER() as DiffFromAvgRate
FROM Person.Person pe
         join HumanResources.Employee he
              on pe.BusinessEntityID = he.BusinessEntityID
         join HumanResources.EmployeePayHistory hre
              on pe.BusinessEntityID = hre.BusinessEntityID

-- Exercise 4
SELECT
    FirstName,
    LastName,
    JobTitle,
    Rate,
    AVG(Rate) OVER(),
    MAX(Rate) OVER() as MaximumRate,
    Rate - AVG(Rate) OVER() as DiffFromAvgRate,
    Rate / MAX(Rate) OVER()  as PercentofMaxRate
FROM Person.Person pe
         join HumanResources.Employee he
              on pe.BusinessEntityID = he.BusinessEntityID
         join HumanResources.EmployeePayHistory hre
              on pe.BusinessEntityID = hre.BusinessEntityID