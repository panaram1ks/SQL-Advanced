CREATE TABLE #TempPerson
(
    BusinessEntityID INT,
    Title VARCHAR(64),
    FirstName VARCHAR(64),
    MiddleName VARCHAR(64),
    LastName VARCHAR(64),
    PhoneNumber VARCHAR(64),
    PhoneNumberTypeID INT,
    PhoneNumberType VARCHAR(64),
    EmailAddress VARCHAR(64)
    )
INSERT INTO #TempPerson
(
    BusinessEntityID,
    Title,
    FirstName,
    MiddleName,
    LastName
)
SELECT
    BusinessEntityID,
    Title,
    FirstName,
    MiddleName,
    LastName
FROM Person.Person

         UPDATE A
SET PhoneNumber = B.PhoneNumber,
PhoneNumberTypeID = B.PhoneNumberTypeID
FROM #TempPerson A
JOIN Person.PersonPhone B
ON A.BusinessEntityID = B.BusinessEntityID

UPDATE A
SET PhoneNumberType = B.Name
FROM #TempPerson A
    JOIN Person.PhoneNumberType B
ON A.PhoneNumberTypeID = B.PhoneNumberTypeID

UPDATE A
SET EmailAddress = B.EmailAddress
FROM #TempPerson A
    JOIN Person.EmailAddress B
ON A.BusinessEntityID = B.BusinessEntityID


--TRUNCATE TABLE #TempPerson
SELECT * FROM #TempPerson
