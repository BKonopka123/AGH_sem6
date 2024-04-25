USE AdventureWorks2019;
GO

IF OBJECT_ID('dbo.SearchEmployeeByAddress_TVF') IS NOT NULL
DROP PROC dbo.SearchEmployeeByAddress_TVF;
GO

CREATE FUNCTION dbo.SearchEmployeeByAddress_TVF
(
    @searchString NVARCHAR(100)
)
RETURNS TABLE
AS
RETURN
(
    SELECT e.*
    FROM HumanResources.Employee e
    JOIN Person.BusinessEntityAddress bea ON e.BusinessEntityID = bea.BusinessEntityID
	JOIN Person.Address a ON bea.AddressID = a.AddressID
    WHERE CHARINDEX(@searchString, a.AddressLine1) > 0
);
GO

SELECT * FROM dbo.SearchEmployeeByAddress_TVF('Yo');