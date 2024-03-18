-- ZAD 1

USE AdventureWorks2019;
GO

IF OBJECT_ID('dbo.GetPersonDataById') IS NOT NULL
DROP FUNCTION dbo.GetPersonDataById;
GO

CREATE FUNCTION dbo.GetPersonDataById (@BusinessEntityID INT)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @Result NVARCHAR(MAX);
    
    SELECT @Result = CONCAT(
        p.LastName, ';',
        p.FirstName, ';',
        e.EmailAddress, ';',
        a.AddressLine1
    )
    FROM Person.Person AS p
    JOIN Person.BusinessEntity AS be ON p.BusinessEntityID = be.BusinessEntityID
    JOIN Person.EmailAddress AS e ON p.BusinessEntityID = e.BusinessEntityID
    JOIN Person.BusinessEntityAddress AS bea ON be.BusinessEntityID = bea.BusinessEntityID
    JOIN Person.Address AS a ON bea.AddressID = a.AddressID
    WHERE be.BusinessEntityID = @BusinessEntityID;
    
    RETURN @Result;
END;
GO

SELECT dbo.GetPersonDataById(1) AS PersonData;