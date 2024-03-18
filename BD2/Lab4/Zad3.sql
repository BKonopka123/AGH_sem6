--Zad3

USE AdventureWorks2019;
GO

IF OBJECT_ID('dbo.uspIncreaseProductPrices') IS NOT NULL
DROP PROC dbo.uspIncreaseProductPrices;
GO

CREATE PROCEDURE dbo.uspIncreaseProductPrice
    @ProductID INT,
    @Multiplier DECIMAL(5,2)
AS
BEGIN
    DECLARE @MaxPrice DECIMAL(10,2) = 200.00;
    DECLARE @CurrentPrice DECIMAL(10,2);

    SELECT @CurrentPrice = ListPrice
    FROM Production.Product
    WHERE ProductID = @ProductID;

    IF (@CurrentPrice * @Multiplier > @MaxPrice)
    BEGIN
        DECLARE @ErrorMessage NVARCHAR(255) = 'Cena projektu nie moze byc wyzsza od: ' + CAST(@MaxPrice AS NVARCHAR(10));
        RAISERROR(@ErrorMessage, 16, 1);
    END
    ELSE
    BEGIN
        UPDATE Production.Product
        SET ListPrice = @CurrentPrice * @Multiplier
        WHERE ProductID = @ProductID;
    END
END;
GO

EXEC dbo.uspIncreaseProductPrice @ProductID = 1, @Multiplier = 4;
GO