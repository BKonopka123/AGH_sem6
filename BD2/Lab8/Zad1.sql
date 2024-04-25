USE AdventureWorks2019;
GO

IF OBJECT_ID('dbo.SearchEmployeeByAddressMine') IS NOT NULL
DROP PROC dbo.SearchEmployeeByAddressMine;
GO


CREATE PROCEDURE dbo.SearchEmployeeByAddressMine
    @searchString NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT e.*
    FROM HumanResources.Employee e
    JOIN Person.BusinessEntityAddress bea ON e.BusinessEntityID = bea.BusinessEntityID
	JOIN Person.Address a ON bea.AddressID = a.AddressID
    WHERE CHARINDEX(@searchString, a.AddressLine1) > 0;
END;
GO

SELECT * FROM Person.Address;
EXEC SearchEmployeeByAddressMine 'Yo';