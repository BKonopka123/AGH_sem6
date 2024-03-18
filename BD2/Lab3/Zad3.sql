-- ZAD 3

USE AdventureWorks2019;
GO

IF OBJECT_ID('dbo.GetOrdersByCustomerName') IS NOT NULL
DROP FUNCTION dbo.GetOrdersByCustomerName;
GO

CREATE FUNCTION dbo.GetOrdersByCustomerName (@CustomerName NVARCHAR(100))
RETURNS TABLE
AS
RETURN
(
    SELECT soh.SalesOrderID,
           soh.OrderDate,
           sod.ProductID,
           sod.OrderQty,
           sod.UnitPrice,
           sod.LineTotal
    FROM Sales.Customer AS c
    JOIN Sales.SalesOrderHeader AS soh ON c.CustomerID = soh.CustomerID
    JOIN Sales.SalesOrderDetail AS sod ON soh.SalesOrderID = sod.SalesOrderID
    JOIN Person.Person AS p ON c.PersonID = p.BusinessEntityID
    WHERE p.LastName + ' ' + p.FirstName = @CustomerName
);
GO

SELECT *
FROM dbo.GetOrdersByCustomerName('John Smith');