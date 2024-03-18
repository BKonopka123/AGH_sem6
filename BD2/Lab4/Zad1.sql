--Zad1

USE AdventureWorks2019;
GO

IF OBJECT_ID('dbo.usp_PrintContacts') IS NOT NULL
DROP PROC dbo.usp_PrintContacts;
GO

CREATE PROCEDURE dbo.usp_PrintContacts
@Title AS NVARCHAR(8)
AS
BEGIN
    DECLARE @PersonType NCHAR(2),
            @FirstName NVARCHAR(50),
            @LastName NVARCHAR(50),
            @EmailPromotion NVARCHAR(100)

    DECLARE cursor_contacts CURSOR FOR
    SELECT PersonType, FirstName, LastName, EmailPromotion
    FROM Person.Person
	WHERE Title = @Title

    OPEN cursor_contacts

    FETCH NEXT FROM cursor_contacts INTO @PersonType, @FirstName, @LastName, @EmailPromotion

    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT 'PersonType: ' + @PersonType + ', Name: ' + @FirstName + ' ' + @LastName + ', EmailPromotion: ' + @EmailPromotion
        FETCH NEXT FROM cursor_contacts INTO @PersonType, @FirstName, @LastName, @EmailPromotion
    END

    CLOSE cursor_contacts
    DEALLOCATE cursor_contacts
END
GO

EXEC dbo.usp_PrintContacts @Title = 'Mr.';
GO