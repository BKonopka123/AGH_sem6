-- ZAD 2

USE AdventureWorks2019;
GO

IF OBJECT_ID('dbo.GetPersonRecordsInRange') IS NOT NULL
DROP FUNCTION dbo.GetPersonRecordsInRange;
GO

CREATE FUNCTION dbo.GetPersonRecordsInRange (@StartIndex INT, @EndIndex INT)
RETURNS TABLE
AS
RETURN
(
    SELECT TOP (@EndIndex - @StartIndex + 1)
        p.LastName,
        p.FirstName,
        e.EmailAddress,
        a.AddressLine1
    FROM Person.Person AS p
    JOIN Person.EmailAddress AS e ON p.BusinessEntityID = e.BusinessEntityID
    JOIN Person.BusinessEntityAddress AS bea ON p.BusinessEntityID = bea.BusinessEntityID
    JOIN Person.Address AS a ON bea.AddressID = a.AddressID
    ORDER BY p.LastName, p.FirstName, a.AddressLine1
    OFFSET @StartIndex - 1 ROWS
);
GO

SELECT *
FROM dbo.GetPersonRecordsInRange(1, 5);