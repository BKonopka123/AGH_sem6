-- Zad 1

CREATE LOGIN [WINSERV01\tester1] FROM WINDOWS WITH DEFAULT_DATABASE=[AdventureWorks2019], DEFAULT_LANGUAGE=[us_english];
CREATE LOGIN [WINSERV01\tester2] FROM WINDOWS WITH DEFAULT_DATABASE=[AdventureWorks2019], DEFAULT_LANGUAGE=[us_english];
CREATE LOGIN [WINSERV01\tester3] FROM WINDOWS WITH DEFAULT_DATABASE=[AdventureWorks2019], DEFAULT_LANGUAGE=[us_english];
CREATE LOGIN [WINSERV01\tester4] FROM WINDOWS WITH DEFAULT_DATABASE=[AdventureWorks2019], DEFAULT_LANGUAGE=[us_english];
CREATE LOGIN [WINSERV01\tester5] FROM WINDOWS WITH DEFAULT_DATABASE=[AdventureWorks2019], DEFAULT_LANGUAGE=[us_english];
CREATE LOGIN [WINSERV01\grupa1] FROM WINDOWS;
CREATE LOGIN [WINSERV01\grupa2] FROM WINDOWS;
GO

USE master;
GRANT CONNECT SQL TO [WINSERV01\grupa1];
DENY CONNECT SQL TO [WINSERV01\grupa2];
GO

--CREATE TRIGGER logon_trigger
--ON ALL SERVER
--FOR LOGON
--AS
--BEGIN
--    DECLARE @login_name NVARCHAR(100);
--    SET @login_name = ORIGINAL_LOGIN();

--    IF @login_name = 'grupa1'
--        RETURN;
--    ELSE
--        ROLLBACK;
--END;
--GO

--USE master;
--EXEC sp_revokelogin 'WINSERV01\tester1'
--EXEC sp_revokelogin 'WINSERV01\tester2'
--EXEC sp_revokelogin 'WINSERV01\tester3'
--EXEC sp_revokelogin 'WINSERV01\tester4'
--EXEC sp_revokelogin 'WINSERV01\tester5'
--EXEC sp_revokelogin 'WINSERV01\grupa1'
--EXEC sp_revokelogin 'WINSERV01\grupa2'
--DROP TRIGGER logon_trigger;
--GO

--U¿ytkownikowi nale¿¹cemu do obu grup zostanie nadane uprawnienie z grupy, która ma wy¿szy priorytet.
--Domyœlnie w bazie danych SQL Server, nowo utworzony u¿ytkownik nie ma ¿adnych uprawnieñ przypisanych do bazy danych. 
