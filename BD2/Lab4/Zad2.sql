--Zad 2

USE AdventureWorks2019;
GO

IF OBJECT_ID('dbo.ProductLog') IS NOT NULL
DROP TABLE dbo.ProductLog;
GO

IF OBJECT_ID('Production.Product_DML_Trigger') IS NOT NULL
DROP TRIGGER Production.Product_DML_Trigger;
GO

CREATE TABLE dbo.ProductLog (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    Operation VARCHAR(10),
    ProductID INT,
    Name NVARCHAR(50),
    ModifiedDate DATETIME
);
GO

CREATE TRIGGER Production.Product_DML_Trigger
ON Production.Product
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @Operation VARCHAR(10);
    DECLARE @ProductID INT;
    DECLARE @Name NVARCHAR(255);
    DECLARE @ModifiedDate DATETIME;

    IF EXISTS(SELECT * FROM inserted)
    BEGIN
        IF EXISTS(SELECT * FROM deleted)
            SET @Operation = 'UPDATE';
        ELSE
            SET @Operation = 'INSERT';

        SELECT @ProductID = ProductID, @Name = Name, @ModifiedDate = ModifiedDate FROM inserted;
    END
    ELSE
    BEGIN
        SET @Operation = 'DELETE';
        SELECT @ProductID = ProductID, @Name = Name, @ModifiedDate = ModifiedDate FROM deleted;
    END

    INSERT INTO ProductLog (Operation, ProductID, Name, ModifiedDate)
    VALUES (@Operation, @ProductID, @Name, @ModifiedDate);
END;
GO

INSERT INTO Production.Product (Name, ProductNumber, StandardCost, ListPrice, SellStartDate, SafetyStockLevel, ReorderPoint, DaysToManufacture)
VALUES ('ABC', 'NW123457', 50.00, 100.00, GETDATE(), 1, 1, 10);

UPDATE Production.Product
SET ListPrice = 120.00
WHERE ProductID = 1;

DELETE FROM Production.Product
WHERE ProductNumber = 'NW123457';

SELECT * FROM dbo.ProductLog;
GO